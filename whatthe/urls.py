from django.urls import path, include


urlpatterns = [
    path('movie', include('movie.urls')),
    path('user', include('user.urls')),
]
