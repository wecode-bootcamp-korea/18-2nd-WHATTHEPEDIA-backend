from django.urls import path

from .views import AutoCompleteView, SearchView
urlpatterns = [
    path('/autocomplete', AutoCompleteView.as_view()),
    path('/search', SearchView.as_view())
]