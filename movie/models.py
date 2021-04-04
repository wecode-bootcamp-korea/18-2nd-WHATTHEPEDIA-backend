from django.db   import models

from user.models import User


class Category(models.Model):
    name = models.CharField(max_length=45)

    class Meta:
        db_table = 'categories'


class Movie(models.Model):
    korean_title       = models.CharField(max_length=100)
    english_title      = models.CharField(max_length=100, null=True)
    release_date       = models.DateField(auto_now=False, auto_now_add=False)
    nationality        = models.CharField(max_length=45)
    number_of_audience = models.PositiveIntegerField()
    description        = models.TextField()
    running_time       = models.PositiveSmallIntegerField()
    is_watcha          = models.BooleanField(default=False)
    category           = models.ForeignKey(Category, on_delete=models.CASCADE)
    main_sort          = models.ForeignKey('MainSort', null=True, on_delete=models.SET_NULL)
    movie_like         = models.ManyToManyField(User, through='MovieLike', related_name='movie_movie_like')
    user_star          = models.ManyToManyField(User, through='UserStar', related_name='movie_user_star')
    comment            = models.ManyToManyField(User, through='Comment', related_name='movie_comment')
    collection         = models.ManyToManyField(User, through='Collection', related_name='movie_collection')
    genre              = models.ManyToManyField('Genre', through='MovieGenre', related_name='movie_genre')
    
    class Meta:
        db_table = 'movies'


class MainSort(models.Model):
    name = models.CharField(max_length=45)

    class Meta:
        db_table = 'main_sorts'


class MovieImage(models.Model):
    image_url = models.URLField(max_length=3000)
    movie     = models.ForeignKey(Movie, on_delete=models.CASCADE)
    
    class Meta:
        db_table = 'movie_images'


class Gallery(models.Model):
    image_url = models.URLField(max_length=3000, null=True)
    video_url = models.URLField(max_length=3000, null=True)
    movie     = models.ForeignKey(Movie, on_delete=models.CASCADE)
    
    class Meta:
        db_table = 'galleries'


class MovieLike(models.Model):
    user  = models.ForeignKey(User, on_delete=models.CASCADE)
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE)
    
    class Meta:
        db_table = 'movie_likes'


class UserStar(models.Model):
    user  = models.ForeignKey(User, on_delete=models.CASCADE)
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE)
    star  = models.IntegerField(default=0)

    class Meta:
        db_table = 'user_stars'


class Panel(models.Model):
    movie     = models.ForeignKey(Movie, on_delete=models.CASCADE)
    role      = models.CharField(max_length=100)
    character = models.CharField(max_length=45, null=True)
    actor     = models.ForeignKey('Actor', on_delete=models.CASCADE)
   
    class Meta:
        db_table = 'panels'


class Actor(models.Model):
    name      = models.CharField(max_length=45)
    image_url = models.URLField(max_length=3000, null=True)
    
    class Meta:
        db_table = 'actors'


class Comment(models.Model):
    user    = models.ForeignKey(User, on_delete=models.CASCADE)
    movie   = models.ForeignKey(Movie, on_delete=models.CASCADE, related_name='comment_movie')
    content = models.TextField()
    like    = models.ManyToManyField(User, through='CommentLike', related_name='comment_like')

    class Meta:
        db_table = 'comments'


class Genre(models.Model):
    name = models.CharField(max_length=45)
    
    class Meta:
        db_table = 'genres'


class Collection(models.Model):
    title = models.CharField(max_length=45)
    user  = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, related_name='collection_movie')

    class Meta:
        db_table = 'collections'


class MovieGenre(models.Model):
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE)
    genre = models.ForeignKey(Genre, on_delete=models.CASCADE)
    
    class Meta:
        db_table = 'movie_genres'


class CommentLike(models.Model):
    user    = models.ForeignKey(User, on_delete=models.CASCADE)
    comment = models.ForeignKey(Comment, on_delete=models.CASCADE)
    
    class Meta:
        db_table = 'comment_likes'