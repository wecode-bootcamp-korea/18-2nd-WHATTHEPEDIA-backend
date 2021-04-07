from django.http      import JsonResponse
from django.views     import View

from .models import Movie, MovieImage, Gallery, MovieGenre, Panel, UserStar, Comment
        
        
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
        