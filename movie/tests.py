import json

from user.models import User
from .models     import (
                    Category, Movie, MainSort, MovieImage, 
                    Gallery, MovieLike, UserStar, Panel, Actor,
                    Comment, Genre, Collection, MovieGenre, CommentLike)

from django.test import TestCase
from django.test import Client
from unittest.mock import patch, MagicMock


class AutoCompleteTest(TestCase):
    def setUp(self):
        client = Client()
        Category.objects.create(
            id   = 1, 
            name = '영화'
        )

        Movie.objects.create(
            id                 = 1,
            korean_title       = '소닉',
            english_title      = 'sonic',
            release_date       = '2018-01-01',
            nationality        = '미국',
            number_of_audience = 2000,
            description        = '소닉 설명',
            running_time       = 120,
            category_id        = 1
        )

        Movie.objects.create(
            id                 =  2,  
            korean_title       = '소울',
            english_title      = 'soul',
            release_date       = '2020-01-01',
            nationality        = '미국',
            number_of_audience = 2000,
            description        = '소울 설명',
            running_time       = 120,
            category_id        =1
        )
    
    def tearDown(self):
        Category.objects.all().delete()
        Movie.objects.all().delete()

    def test_autocomplete_get_success(self):
        client=Client()
        response = client.get('/movie/autocomplete?query=소')
        self.assertEqual(response.json(),
            {
                'result': [
                    {
                        'id'          : 1, 
                        'korean_title': '소닉'
                    }, 
                    {
                        'id'          : 2, 
                        'korean_title': '소울'
                    }
                ]
            }
        )
        self.assertEqual(response.status_code, 200)
    
    def test_autocomplete_get_none(self):
        client=Client()
        response=client.get('/movie/autocomplete?query=광')
        self.assertEqual(response.json(),
            {
                "result": []
            }
        )
        self.assertEqual(response.status_code, 200)
    
    def test_autocomplete_get_fail(self):
        client=Client()
        response = client.get('/movie/autocomplete?cuery=소')
        self.assertEqual(response.json(),
            {
                'message': "Not a Valid Query"
            }
        )
        self.assertEqual(response.status_code, 400)

    def test_autocomplete_get_not_found(self):
        client=Client()
        response = client.get('/movie/autoco')
        self.assertEqual(response.status_code, 404)

class SearchTest(TestCase):
    def setUp(self):
        client=Client()
        Category.objects.create(
            id   = 1,
            name = "영화"
        )

        Movie.objects.create(
            id                 = 1,
            korean_title       = '소닉',
            english_title      = 'sonic',
            release_date       = '2018-01-01',
            nationality        = '미국',
            number_of_audience = 2000,
            description        = '소닉 설명',
            running_time       = 120,
            category_id        = 1
        )
        
    def tearDown(self):
        Category.objects.all().delete()
        Movie.objects.all().delete()

    def test_search_get_success(self):
        client=Client()
        response = client.get('/movie/search?query=소닉')
        self.assertEqual(response.json(),
            { 
                'result': 1
            }
        )
        self.assertEqual(response.status_code, 200)
    
    def test_search_get_fail(self):
        client=Client()
        response = client.get('/movie/search?query=소하')
        self.assertEqual(response.json(),
            {
                'message': 'Movie Does Not Exist'
            }
        )
        self.assertEqual(response.status_code, 400)


class GetMoviesTest(TestCase):
    def setUp(self):
        client = Client()
        User.objects.create(
            id       = 1,
            name     = '홍길동',
            email    = 'aaa@naver.com',
            password = 123123123,

        )

        User.objects.create(
            id       = 2,
            name     ='김길동',
            email    = 'bbb@naver.com',
            password = 123123123,
        )

        Category.objects.create(
            id   = 1,
            name = '영화'
        )

        MainSort.objects.create(
            id   = 1,
            name = '박스오피스'
        )

        Movie.objects.create(
            id                 = 1,
            korean_title       = '콩',
            release_date       = '2019-01-01',
            number_of_audience = 3000,
            description        = '콩 설명',
            nationality        = '미국',
            running_time       = 120,
            is_watcha          = True,
            category_id        = 1,
            main_sort_id       = 1,
        )

        MovieImage.objects.create(
            id        = 1,
            image_url = "https://an2-img.amz.wtchn.net/image/v2/24b8b07683cb530f082ad075bb4a8eff.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPamN3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFMU56Y3lNVE0zTURjME5UVXlOakkxSWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqbzBPVEI5LjY1MG1EeEM0akYtTDJXS0pXVE8yVGoyOFZNX3hicFBKM2plbnU3dG5kMkU",
            movie_id  = 1
        )
        
        Movie.objects.create(
            id                 = 2,
            korean_title       = '포레스트 검프',
            release_date       = '2020-01-01',
            number_of_audience = 5000,
            description        = '설명',
            nationality        = '미국',
            running_time       = 130,
            is_watcha          = False,
            category_id        = 1,
            main_sort_id       = 1,
        )

        MovieImage.objects.create(
            id        = 2,
            image_url = "https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466060983/rkrkzjyt4fae81eoojhb.jpg",
            movie_id  = 2
        )

        Movie.objects.create(
            id                 = 3,
            korean_title       = '겨울왕국',
            release_date       = '2018-01-01',
            number_of_audience = 4000,
            description        = '설명',
            nationality        = '미국',
            running_time       = 140,
            is_watcha          = True,
            category_id        = 1,
            main_sort_id       = 1,
        )

        MovieImage.objects.create(
            id        = 3,
            image_url = "https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_700,q_80,w_490/v1563830564/kcwvlxvq6hlnioxfa7rq.jpg",
            movie_id  = 3
        )

        UserStar.objects.create(
            id    = 1,
            user  = User.objects.get(id=1),
            movie = Movie.objects.get(id=1),
            star  = 5
        )

        UserStar.objects.create(
            id    = 2,
            user  = User.objects.get(id=1),
            movie = Movie.objects.get(id=2),
            star  = 4
        )

        UserStar.objects.create(
            id    = 3,
            user  = User.objects.get(id=1),
            movie = Movie.objects.get(id=3),
            star  = 3
        )

        UserStar.objects.create(
            id    = 4,
            user  = User.objects.get(id=2),
            movie = Movie.objects.get(id=1),
            star  = 3
        )
        
        UserStar.objects.create(
            id    = 5,
            user  = User.objects.get(id=2),
            movie = Movie.objects.get(id=2),
            star  = 2
        )

        UserStar.objects.create(
            id    = 6,
            user  = User.objects.get(id=2),
            movie = Movie.objects.get(id=3),
            star  = 1

        )

    def tearDown(self):
        User.objects.all().delete()
        Category.objects.all().delete()
        MainSort.objects.all().delete()
        Movie.objects.all().delete()
        MovieImage.objects.all().delete()
        UserStar.objects.all()

    def test_movielist_get_success(self):
        client   = Client()
        response = client.get('/movie')
        self.assertEqual(response.json(),
            {
                'results': {
                    'box_office': [
                        {
                            'id'                : 2,
                            'title'             : '포레스트 검프',
                            'image'             : "https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466060983/rkrkzjyt4fae81eoojhb.jpg",
                            'logo'              : False,
                            'nationality'       : '미국',
                            'release_date'      : 2020,
                            'average_stars'     : 3.0,
                            'number_of_audience': 5000,
                            'movie_rating'      : 15000.0
                        },
                        {
                            'id'                : 1,
                            'title'             : '콩',
                            'image'             : "https://an2-img.amz.wtchn.net/image/v2/24b8b07683cb530f082ad075bb4a8eff.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPamN3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFMU56Y3lNVE0zTURjME5UVXlOakkxSWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqbzBPVEI5LjY1MG1EeEM0akYtTDJXS0pXVE8yVGoyOFZNX3hicFBKM2plbnU3dG5kMkU",
                            'logo'              : True,
                            'nationality'       :'미국',
                            'release_date'      : 2019,
                            'average_stars'     : 4.0,
                            'number_of_audience': 3000,
                            'movie_rating'      : 12000.0
                        },
                        {
                            'id'                : 3,
                            'title'             : '겨울왕국',
                            'image'             : "https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_700,q_80,w_490/v1563830564/kcwvlxvq6hlnioxfa7rq.jpg",
                            'logo'              : True,
                            'nationality'       :'미국',
                            'release_date'      : 2018,
                            'average_stars'     : 2.0,
                            'number_of_audience': 4000,
                            'movie_rating'      : 8000.0
                        }

                    ],
                'watcha_movie': [
                        {
                            'id'                : 1,
                            'title'             : '콩',
                            'image'             : "https://an2-img.amz.wtchn.net/image/v2/24b8b07683cb530f082ad075bb4a8eff.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPamN3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFMU56Y3lNVE0zTURjME5UVXlOakkxSWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqbzBPVEI5LjY1MG1EeEM0akYtTDJXS0pXVE8yVGoyOFZNX3hicFBKM2plbnU3dG5kMkU",
                            'logo'              : True,
                            'nationality'       :'미국',
                            'release_date'      : 2019,
                            'average_stars'     : 4.0,
                            'number_of_audience': 3000,
                            'movie_rating'      : 12000.0
                        },
                        {
                            'id'                : 3,
                            'title'             : '겨울왕국',
                            'image'             : "https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_700,q_80,w_490/v1563830564/kcwvlxvq6hlnioxfa7rq.jpg",
                            'logo'              : True,
                            'nationality'       :'미국',
                            'release_date'      : 2018,
                            'average_stars'     : 2.0,
                            'number_of_audience': 4000,
                            'movie_rating'      : 8000.0
                        }
                ],
                "rating_amount": 6
                }
            }
        )

    def test_movielist_get_not_found(self):
        client   = Client()
        response = client.get('/movies')

        self.assertEqual(response.status_code, 404)


class NoMovieTest(TestCase):
    def setUp(self):
        client = Client()

        Category.objects.create(
            id   = 1,
            name = '영화'
        )

        MainSort.objects.create(
            id   = 1,
            name = '박스오피스'
        )
    
    def tearDown(self):
        Category.objects.all().delete()
        MainSort.objects.all().delete()
    
    def test_movie_get_fail(self):
        client   = Client()
        response = client.get('/movie')
        self.assertEqual(response.json(), 
            {
                'results': {'box_office': [], 'watcha_movie': [], 'rating_amount': 0}
            }
        )


class MovieTest(TestCase):
    def setUp(self):
        client = Client()
        User.objects.create(
            id       = 1,
            name     = '홍길동',
            email    = 'aaa@naver.com',
            password = 123123123,
        )

        User.objects.create(
            id       = 2,
            name     ='김길동',
            email    = 'bbb@naver.com',
            password = 123123123,
        )

        Category.objects.create(
            id   = 1,
            name = '영화'
        )

        # 장르 2개
        Genre.objects.create(
            id = 1,
            name= '액션'
        )

        Genre.objects.create(
            id = 2,
            name = '로맨스'
        )

        # 배우들 4명
        Actor.objects.create(
            id=1,
            name='김병수',
            image_url='https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFjZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
        )

        Actor.objects.create(
            id=2,
            name='박병수',
            image_url='https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFjZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
        )

        Actor.objects.create(
            id=3,
            name='이병수',
            image_url='https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFjZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
        )

        Actor.objects.create(
            id=4,
            name='주병수',
            image_url='https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFjZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
        )

        # 1번째 영화
        Movie.objects.create(
            id                 = 1,
            korean_title       = '콩',
            release_date       = '2019-01-01',
            number_of_audience = 3000,
            description        = '설명',
            nationality        = '미국',
            running_time       = 120,
            is_watcha          = True,
            category_id        = 1,
        )

        MovieImage.objects.create(
            id        = 1,
            image_url = "https://an2-img.amz.wtchn.net/image/v2/24b8b07683cb530f082ad075bb4a8eff.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPamN3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFMU56Y3lNVE0zTURjME5UVXlOakkxSWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqbzBPVEI5LjY1MG1EeEM0akYtTDJXS0pXVE8yVGoyOFZNX3hicFBKM2plbnU3dG5kMkU",
            movie_id  = 1
        )

        Gallery.objects.create(
            id=1,
            image_url= "https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true",
            movie_id=1
        )

        MovieGenre.objects.create(
            id=1,
            movie_id=1,
            genre_id=1
        )

        Panel.objects.create(
            id=1,
            role='감독',
            actor_id=1,
            movie_id=1,
        )

        Panel.objects.create(
            id=2,
            role='주연',
            actor_id=2,
            movie_id=1,
        )

        # 2번째 영화
        Movie.objects.create(
            id                 = 2,
            korean_title       = '포레스트 검프',
            release_date       = '2020-01-01',
            number_of_audience = 5000,
            description        = '설명',
            nationality        = '미국',
            running_time       = 130,
            is_watcha          = False,
            category_id        = 1
        )

        MovieImage.objects.create(
            id        = 2,
            image_url = "https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466060983/rkrkzjyt4fae81eoojhb.jpg",
            movie_id  = 2
        )

        Gallery.objects.create(
            id=2,
            image_url= "https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true",
            movie_id=2
        )

        MovieGenre.objects.create(
            id=2,
            movie_id=2,
            genre_id=1
        )

        Panel.objects.create(
            id=3,
            role='감독',
            actor_id=3,
            movie_id=2,
        )

        Panel.objects.create(
            id=4,
            role='조연',
            actor_id=4,
            movie_id=2,
        )

        # 3번째 영화
        Movie.objects.create(
            id                 = 3,
            korean_title       = '겨울왕국',
            release_date       = '2018-01-01',
            number_of_audience = 4000,
            description        = '설명',
            nationality        = '미국',
            running_time       = 140,
            is_watcha          = True,
            category_id        = 1,
        )

        MovieImage.objects.create(
            id        = 3,
            image_url = "https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_700,q_80,w_490/v1563830564/kcwvlxvq6hlnioxfa7rq.jpg",
            movie_id  = 3
        )

        Gallery.objects.create(
            id=3,
            image_url= "https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true",
            movie_id=3
        )

        MovieGenre.objects.create(
            id=3,
            movie_id=2,
            genre_id=2
        )

        Panel.objects.create(
            id=5,
            role='감독',
            character='',
            actor_id=1,
            movie_id=3,
        )
    
        Panel.objects.create(
            id=6,
            role='주연',
            character='',
            actor_id=2,
            movie_id=3,
        )

        # 평가
        UserStar.objects.create(
            id=1,
            star=4,
            movie_id=1,
            user_id=1
        )

        UserStar.objects.create(
            id=2,
            star=3,
            movie_id=2,
            user_id=1
        )

        UserStar.objects.create(
            id=3,
            star=5,
            movie_id=3,
            user_id=1
        )

        UserStar.objects.create(
            id=4,
            star=5,
            movie_id=1,
            user_id=2
        )

        UserStar.objects.create(
            id=5,
            star=3,
            movie_id=2,
            user_id=2
        )

        UserStar.objects.create(
            id=6,
            star=1,
            movie_id=3,
            user_id=2
        )

        # 댓글 6개
        Comment.objects.create(
            id=1,
            movie_id=1,
            user_id=1,
            content="짱"
        )

        Comment.objects.create(
            id=2,
            movie_id=2,
            user_id=1,
            content="굳"
        )

        Comment.objects.create(
            id=3,
            movie_id=3,
            user_id=1,
            content="짱"
        )

        Comment.objects.create(
            id=4,
            movie_id=1,
            user_id=2,
            content="호우!"
        )

        Comment.objects.create(
            id=5,
            movie_id=2,
            user_id=2,
            content="요우!"
        )

        Comment.objects.create(
            id=6,
            movie_id=3,
            user_id=2,
            content="워호~!"
        )

        # 코멘트 좋아요 6개 
        CommentLike.objects.create(
            id=1,
            user_id=1,
            comment_id=4,
        )

        CommentLike.objects.create(
            id=2,
            user_id=1,
            comment_id=5,
        )

        CommentLike.objects.create(
            id=3,
            user_id=1,
            comment_id=6
        )

        CommentLike.objects.create(
            id=4,
            user_id=2,
            comment_id=1,
        )

        CommentLike.objects.create(
            id=5,
            user_id=2,
            comment_id=2,
        )

        CommentLike.objects.create(
            id=6,
            user_id=2,
            comment_id=3
        )

    def tearDown(self):
        User.objects.all().delete()
        Category.objects.all().delete()
        MainSort.objects.all().delete()
        Genre.objects.all().delete()
        Movie.objects.all().delete()
        Gallery.objects.all().delete()
        MovieImage.objects.all().delete()
        MovieGenre.objects.all().delete()
        Actor.objects.all().delete()
        Panel.objects.all().delete()
        UserStar.objects.all().delete()
        Comment.objects.all().delete()
        CommentLike.objects.all().delete()


    def test_movie_get_success(self):
        client = Client()
        response = client.get('/movie/1')
        self.assertEqual(response.json(),
            { 
                'results' : {
                    'id'            : 1,
                    'main_image'    : "https://an2-img.amz.wtchn.net/image/v2/24b8b07683cb530f082ad075bb4a8eff.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKaVlXTnJaM0p2ZFc1a0lqcDdJbklpT2pJMU5Td2laeUk2TWpVMUxDSmlJam95TlRWOUxDSmpjbTl3SWpwMGNuVmxMQ0pvWldsbmFIUWlPamN3TUN3aWNHRjBhQ0k2SWk5Mk1pOXpkRzl5WlM5cGJXRm5aUzh4TmpFMU56Y3lNVE0zTURjME5UVXlOakkxSWl3aWNYVmhiR2wwZVNJNk9EQXNJbmRwWkhSb0lqbzBPVEI5LjY1MG1EeEM0akYtTDJXS0pXVE8yVGoyOFZNX3hicFBKM2plbnU3dG5kMkU",
                    'korean_title'  : '콩',
                    'release_date'  : 2019,
                    'running_time'  : 120,
                    'genre'         : '액션',
                    'nationality'   : '미국',
                    'average_stars' : 4.5, # 여기 문제 -> 해결 -> 이 부분 나중에 print로 확인해보자.
                    'num_of_stars'  : 2,
                    'description'   : '설명',
                    'panels'        : [
                        {
                            "role":'감독',
                            "character":None, # 여기도 문제 None말고 ""로 나오도록 해보자
                            "actor":'김병수',
                            "profile": 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFjZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
                        },
                    {
                            "role":'주연',
                            "character":None,
                            "actor":'박병수',
                            "profile":'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFjZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
                        }
                    ],
                    'galleries'     : [
                        "https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true"
                    ],
                    'star_graph'    : 
                        {
                            "5" : 1,
                            "4" : 1,
                            "3" : 0,
                            "2" : 0,
                            "1" : 0
                        },

                    'comments'      : [
                        {
                            'user': '홍길동',
                            'user_star': 4,
                            'content': "짱",
                            'like': 1
                        },
                        {
                            'user': '김길동',
                            'user_star': 5,
                            'content': "호우!",
                            'like': 1
                        }
                    ],
                    'related_movies': [
                        {
                            "id": 2,
                            "image": "https://an2-img.amz.wtchn.net/image/v1/watcha/image/upload/c_fill,h_700,q_80,w_490/v1466060983/rkrkzjyt4fae81eoojhb.jpg",
                            "title": "포레스트 검프",
                            "logo": False,
                            "category": "영화",
                            "average_stars": 3.0
                        }
                    ],
                    'rating_amount' : 6
                }
            }
        )
    
    def test_movie_get_fail(self):
        client = Client()
        response = client.get('/movie/100')
        self.assertEqual(response.json(), 
            {
                "message":'Movie Does Not Exist'
            }
        )

    def test_movie_get_not_found(self):
        client = Client()
        response = client.get('/movie/movie=1')
        self.assertEqual(response.status_code, 404)
