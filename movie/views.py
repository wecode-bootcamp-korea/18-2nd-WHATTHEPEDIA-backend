from operator import itemgetter

from django.db.models import Avg, Prefetch
from django.http      import JsonResponse
from django.views     import View

from .models import (
        Category, Movie, MainSort, MovieImage, 
        Gallery, MovieLike, UserStar, Panel, Actor,
        Comment, Genre, Collection, MovieGenre, CommentLike
        )

from user.utils import Authorization        
        

class AutoCompleteView(View):
    def get(self, request):
        try:
            query  = request.GET.get('query', None)
            movies = Movie.objects.filter(korean_title__icontains=query) 
            
            query_list = [
                {
                    'id'          : movie.id,
                    'korean_title': movie.korean_title
                }
                for movie in movies]

            return JsonResponse({'result': query_list}, status=200)
        except ValueError:
            return JsonResponse({'message': "Not a Valid Query"}, status=400)
                

class SearchView(View):
    def get(self, request):
        try: 
            search_result = request.GET.get('query')
            movie         = Movie.objects.get(korean_title=search_result)
            movie_id      = movie.id

            return JsonResponse({'result': movie_id}, status=200)
        except Movie.DoesNotExist:
            return JsonResponse({'message': 'Movie Does Not Exist'}, status=400)
        
        
class MovieListView(View):
    def get(self, request):
        try:
            results = {}

            box_office_movies = Movie.objects.filter(main_sort=MainSort.objects.get(name="박스오피스"))\
                                             .prefetch_related('movieimage_set', 'userstar_set')
            
            box_office_list = [
                { 
                    'id'                : movie.id,
                    'title'             : movie.korean_title,
                    'image'             : movie.movieimage_set.all()[0].image_url,
                    'logo'              : bool(movie.is_watcha),
                    'nationality'       : movie.nationality,
                    'release_date'      : movie.release_date.year,
                    'average_stars'     : 0 if movie.userstar_set.aggregate(Avg('star'))['star__avg'] is None 
                                            else round(movie.userstar_set.aggregate(Avg('star'))['star__avg'], 1),
                    'number_of_audience': movie.number_of_audience,
                    'movie_rating'      : (movie.number_of_audience) * (1 if movie.userstar_set.aggregate(Avg('star'))['star__avg'] is None 
                                                                        else movie.userstar_set.aggregate(Avg('star'))['star__avg'])
                } 
                for movie in box_office_movies
            ]

            box_office_by_ranking = sorted(box_office_list, key=itemgetter('movie_rating'), reverse=True)
            

            watcha_movies = Movie.objects.filter(is_watcha=True).prefetch_related('movieimage_set')

            watcha_list = [
                { 
                    'id'                : movie.id,
                    'title'             : movie.korean_title,
                    'image'             : movie.movieimage_set.all()[0].image_url,
                    'logo'              : bool(movie.is_watcha),
                    'nationality'       : movie.nationality,
                    'release_date'      : movie.release_date.year,
                    'average_stars'     : 0 if movie.userstar_set.aggregate(Avg('star'))['star__avg'] is None 
                                            else round(movie.userstar_set.aggregate(Avg('star'))['star__avg'], 1),
                    'number_of_audience': movie.number_of_audience,
                    'movie_rating'      : (movie.number_of_audience) * (1 if movie.userstar_set.aggregate(Avg('star'))['star__avg'] is None 
                                                                        else movie.userstar_set.aggregate(Avg('star'))['star__avg'])
                } 
                for movie in watcha_movies
            ]
        
            watcha_list_by_ranking  = sorted(watcha_list, key=itemgetter('movie_rating'), reverse=True)

            rating_amount = UserStar.objects.count()

            results = {
                'box_office'   : box_office_by_ranking,
                'watcha_movie' : watcha_list_by_ranking,
                'rating_amount': rating_amount
            }

            return JsonResponse({"results": results}, status=200)

        except MainSort.DoesNotExist:
            return JsonResponse({'message': 'MAINSORT_DOES_NOT_EXIST'}, status=400)
        
        except MovieImage.DoesNotExist:
            return JsonResponse({'message': 'IMAGE_DOES_NOT_EXIST'}, status=400)


class MovieView(View):
    def get(self, request, movie_id):
        try:
            movie        = Movie.objects.prefetch_related('movieimage_set', 'moviegenre_set').get(id=movie_id)
            stars        = UserStar.objects.filter(movie=movie)
            panels       = Panel.objects.filter(movie_id=movie_id).select_related('actor')
            movie_genres = MovieGenre.objects.filter(movie_id=movie_id)
            galleries    = Gallery.objects.filter(movie_id=movie_id)
            user_stars   = Comment.objects.filter(movie_id=movie_id).select_related('user').prefetch_related('commentlike_set')
            
            genre_id_list        = [movie_genre.genre_id for movie_genre in movie_genres]
            related_movie_genres = MovieGenre.objects.filter(genre_id__in=genre_id_list).select_related('movie')
            
            panel_list = [
                            {
                                'role'     : panel.role,    
                                'character': panel.character, 
                                'actor'    : panel.actor.name, 
                                'profile'  : panel.actor.image_url
                            }
                            for panel in panels
                        ]

            
            movie_info = {
                'id'            : movie.id,
                'main_image'    : movie.movieimage_set.all()[0].image_url,
                'korean_title'  : movie.korean_title,
                'release_date'  : movie.release_date.year,
                'running_time'  : movie.running_time,
                'genre'         : movie.moviegenre_set.all()[0].genre.name,
                'nationality'   : movie.nationality,
                'average_stars' : round(sum([movie.star for movie in stars])/stars.count(), 1)
                                    if stars.exists() else None,
                'num_of_stars'  : stars.count(),
                'description'   : movie.description,
                'panels'        : panel_list,
                'galleries'     : [image.image_url for image in galleries],
                'star_graph'    : 
                                {   "5": UserStar.objects.filter(star=5, movie=movie).count(),
                                    "4": UserStar.objects.filter(star=4, movie=movie).count(),
                                    "3": UserStar.objects.filter(star=3, movie=movie).count(),
                                    "2": UserStar.objects.filter(star=2, movie=movie).count(),
                                    "1": UserStar.objects.filter(star=1, movie=movie).count()
                                },
                'comments'      : [
                                    {
                                        'user'     : comment.user.name,
                                        'user_star': UserStar.objects.filter(user=comment.user, movie_id=movie_id).first().star 
                                                        if UserStar.objects.filter(user=comment.user, movie_id=movie_id).exists() else None,
                                        'content'  : comment.content,
                                        'like'     : len(comment.commentlike_set.all())
                                    }
                                    for comment in user_stars
                                  ],
                'related_movies': [
                                    {
                                        'id'           : genre_movie.movie.id,
                                        'image'        : MovieImage.objects.get(movie=genre_movie.movie).image_url,
                                        'title'        : genre_movie.movie.korean_title,
                                        'logo'         : True if genre_movie.movie.is_watcha else False,
                                        'category'     : genre_movie.movie.category.name,
                                        'average_stars': round(sum([movie.star for movie in UserStar.objects.filter(movie=genre_movie.movie)])/UserStar.objects.filter(movie=genre_movie.movie).count(), 1) 
                                                            if UserStar.objects.filter(movie=genre_movie.movie).exists() else None,
                                    }
                                    for genre_movie in related_movie_genres if movie.id != genre_movie.movie.id

                                  ],
                'rating_amount' : UserStar.objects.count()

            }
            
            return JsonResponse({'results': movie_info}, status=200)
        
        except Movie.DoesNotExist:
            return JsonResponse({"message":'Movie Does Not Exist'}, status=400)

        except MovieImage.DoesNotExist:
            return JsonResponse({'message': 'Movie Image Does Not Exist'}, status=400)
        
        except MovieGenre.DoesNotExist:
            return JsonResponse({'message': 'Genre Does Not Exist'}, status=400)
        
