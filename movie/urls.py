from django.urls import path

from .views import AutoCompleteView, SearchView, MovieListView, MovieView


urlpatterns = [
    path('/<int:movie_id>', MovieView.as_view()),
    path('/autocomplete', AutoCompleteView.as_view()),
    path('/search', SearchView.as_view()),
    path('', MovieListView.as_view()),
]

