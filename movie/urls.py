from django.urls import path

from .views import AutoCompleteView, SearchView, MovieListView


urlpatterns = [
    path('/autocomplete', AutoCompleteView.as_view()),
    path('/search', SearchView.as_view()),
    path('', MovieListView.as_view())
]
