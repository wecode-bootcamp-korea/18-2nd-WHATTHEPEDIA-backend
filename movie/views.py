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
            
            query_list = [movie.korean_title for movie in movies]

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

