from operator import itemgetter

from django.db.models import Avg, Prefetch
from django.http      import JsonResponse
from django.views     import View

from .models import (
        Category, Movie, MainSort, MovieImage, 
        Gallery, MovieLike, UserStar, Panel, Actor,
        Comment, Genre, Collection, MovieGenre, CommentLike
        )
        
        
class AutoCompleteView(View):
    def get(self, request):
        try:
            query  = request.GET.get('query', None)
            movies = Movie.objects.filter(korean_title__icontains=query) 
            
            query_list = [
                {
                    'id': movie.id,
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

            box_office_movies = Movie.objects.filter(main_sort=MainSort.objects.get(name="박스오피스"))
            box_office_list = [
                { 
                    'id'                : movie.id,
                    'title'             : movie.korean_title,
                    'image'             : movie.movieimage_set.get().image_url,
                    'logo'              : True if movie.is_watcha else False,
                    'nationality'       : movie.nationality,
                    'release_date'      : movie.release_date.year,
                    'average_stars'     : 0 if movie.userstar_set.aggregate(Avg('star'))['star__avg'] is None else movie.userstar_set.aggregate(Avg('star'))['star__avg'], # 18개
                    'number_of_audience': movie.number_of_audience,
                    'movie_rating'      : (movie.number_of_audience) * (1 if movie.userstar_set.aggregate(Avg('star'))['star__avg'] is None else movie.userstar_set.aggregate(Avg('star'))['star__avg'])
                } 
                for movie in box_office_movies
            ]

            box_office_by_ranking = sorted(box_office_list, key=itemgetter('movie_rating'), reverse=True)
            
            results['box_office'] = box_office_by_ranking


            watcha_movies = Movie.objects.filter(is_watcha=True)

            watcha_list = [
                { 
                    'id'                : movie.id,
                    'title'             : movie.korean_title,
                    'image'             : movie.movieimage_set.get(movie=movie).image_url,
                    'logo'              : True if movie.is_watcha else False,
                    'nationality'       : movie.nationality,
                    'release_date'      : movie.release_date.year,
                    'average_stars'     : 0 if movie.userstar_set.aggregate(Avg('star'))['star__avg'] is None else movie.userstar_set.aggregate(Avg('star'))['star__avg'],
                    'number_of_audience': movie.number_of_audience,
                    'movie_rating'      : (movie.number_of_audience) * (1 if movie.userstar_set.aggregate(Avg('star'))['star__avg'] is None else movie.userstar_set.aggregate(Avg('star'))['star__avg'])
                } 
                for movie in watcha_movies
            ]
        
            watcha_list_by_ranking  = sorted(watcha_list, key=itemgetter('movie_rating'), reverse=True)

            results['watcha_movie'] = watcha_list_by_ranking


            rating_amount = UserStar.objects.count()
            
            results['rating_amount'] = rating_amount

            return JsonResponse({"results": results}, status=200)

        except MainSort.DoesNotExist:
            return JsonResponse({'message': 'MAINSORT_DOES_NOT_EXIST'}, status=400)
        
        except MovieImage.DoesNotExist:
            return JsonResponse({'message': 'IMAGE_DOES_NOT_EXIST'}, status=400)



class MovieView(View):
    def get(self, request, movie_id):
        try:
            movie = Movie.objects.get(id=movie_id)
            stars = UserStar.objects.filter(movie=movie)
            
            panel_list = [
                            {
                                'role'     : panel.role,    
                                'character': panel.character, 
                                'actor'    : panel.actor.name, 
                                'profile'  : panel.actor.image_url
                            }
                            for panel in Panel.objects.filter(movie_id=movie_id).select_related('actor')
                        ]

            star_graph = [{'review_score': 5, 'vote': 0},
                          {'review_score': 4, 'vote': 0},
                          {'review_score': 3, 'vote': 0},
                          {'review_score': 2, 'vote': 0},
                          {'review_score': 1, 'vote': 0}]
            
            for user_star in stars:
                for review_score in star_graph:
                    if review_score['review_score'] == user_star.star:
                        review_score['vote'] += 1
                        continue
            
            genre_id_list = [movie_genre.genre_id for movie_genre in MovieGenre.objects.filter(movie_id=movie_id)]

            movie_info = {
                'id'            : movie.id,
                'main_image'    : MovieImage.objects.get(movie_id=movie_id).image_url,
                'korean_title'  : movie.korean_title,
                'release_date'  : movie.release_date.year,
                'running_time'  : movie.running_time,
                'genre'         : MovieGenre.objects.get(movie_id=movie_id).genre.name,
                'nationality'   : movie.nationality,
                'average_stars' : sum([movie.star for movie in stars])/stars.count()
                                    if stars.exists() else None,
                'num_of_stars'  : stars.count(),
                'description'   : movie.description,
                'panels'        : panel_list,
                'galleries'     : [image.image_url for image in Gallery.objects.filter(movie_id=movie_id)],
                'star_graph'    : star_graph,
                'comments'      : [
                                    {
                                        'user'     : comment.user.name,
                                        'user_star': UserStar.objects.filter(user=comment.user, movie_id=movie_id).first().star 
                                                        if UserStar.objects.filter(user=comment.user, movie_id=movie_id).exists() else None,
                                        'content'  : comment.content,
                                        'like'     : comment.commentlike_set.all().count()
                                    }
                                    for comment in Comment.objects.filter(movie_id=movie_id).select_related('user')
                                  ],
                'related_movies': [
                                    {
                                        'id'           : genre_movie.movie.id,
                                        'image'        : MovieImage.objects.get(movie=genre_movie.movie).image_url,
                                        'title'        : genre_movie.movie.korean_title,
                                        'logo'         : True if genre_movie.movie.is_watcha else False,
                                        'category'     : genre_movie.movie.category.name,
                                        'average_stars': sum([movie.star for movie in UserStar.objects.filter(movie=genre_movie.movie)])/UserStar.objects.filter(movie=genre_movie.movie).count() 
                                                            if UserStar.objects.filter(movie=genre_movie.movie).exists() else None,
                                    }
                                    for genre_movie in MovieGenre.objects.filter(genre_id__in=genre_id_list) if movie.id != genre_movie.movie.id

                                  ]

            }
            
            return JsonResponse({'results': movie_info}, status=200)
        
        except Movie.DoesNotExist:
            return JsonResponse({"message":'Movie Does Not Exist'}, status=400)

        except MovieImage.DoesNotExist:
            return JsonResponse({'message': 'Movie Image Does Not Exist'}, status=400)
        
        except MovieGenre.DoesNotExist:
            return JsonResponse({'message': 'Genre Does Not Exist'}, status=400)
        
