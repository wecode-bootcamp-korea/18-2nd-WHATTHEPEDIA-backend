import unittest, json, requests, jwt
from django.http import response

from django.test       import Client, TestCase, client
from unittest.mock     import patch, MagicMock

from user.models       import User
from movie.models      import (Category, Movie, MovieImage, MovieLike, UserStar)

from .utils            import Authorization
from my_settings       import SECRET_KEY, ALGORITHM

class SignupTest(TestCase):
    def setUp(self):
        client = Client()
        User.objects.create(
            email              = 'inah@pe.dia',
            password           = 'whatthehell^^77',
            name               = '최인아',
            kakao_id           = '68541',
            profile_image_url  = 'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true',
            maketing_is_agreed = 'True',
        )

    def tearDown(self):
        User.objects.all().delete()

    def test_signup_post_success(self):
        client = Client()
        user = {
            'email'              : 'whatthe@what.the',
            'password'           : 'whatthehell^^7',
            'name'               : 'inah',
            'maketing_is_agreed' : True,
        }

        response = client.post('/user/signup', json.dumps(user), content_type='application/json')
        self.assertEqual(response.status_code, 201)

    def test_signup_email_exists(self):
        client = Client()
        user = {
            'email'              : 'inah@pe.dia',
            'password'           : 'whatthehell^^7',
            'name'               : 'inah',
            'maketing_is_agreed' : True,
        }

        response = client.post('/user/signup', json.dumps(user), content_type='application/json')
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(), {'message' : 'ALREADY_EXISTS'})

    def test_signup_password_format_validation(self):
        client = Client()
        user = {
            'email'              : 'whatthe@what.the',
            'password'           : '1004',
            'name'               : 'inah',
        }

        response = client.post('/user/signup', json.dumps(user), content_type='application/json')
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(), {'message' : 'INVALID_VALUE'})

    def test_signup_invalid_key(self):
        client = Client()
        user = {
            'email'    : 'whatthe@unit.test',
            'password' : 'whatthehell^^7'
        }

        response = client.post('/user/signup', json.dumps(user), content_type='application/json')
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(), {'message' : 'KEY_ERROR'})


class LoginTest(TestCase):
    def setUp(self):
        client = Client()
        User.objects.create(
            email    = 'choiinah@what.the',
            password = '$2b$12$1jZkLsXMoSzWZgaT3B006u75RY2McRE02SlrQbnhnCAwaSIk.GkUO',
            name     = '최인아'
        )

    def tearDown(self):
        User.objects.all().delete()

    def test_login_post_success(self):
        client = Client()
        user = {
            'email'    : 'choiinah@what.the',
            'password' : '^^a7s8d9f0',
            'name'     : '최인아'
        }
        
        response = client.post('/user/login', json.dumps(user), content_type='application/json')
        self.assertEqual(response.status_code, 200)
        #self.assertEqual(response.json(), {'access_token' : response.json()['access_token']})

    def test_login_does_not_exist(self):
        client = Client()
        user = {
            'email'    : 'choi@what.the',
            'password' : '^^a7s8d9f0',
            'name'     : '최왓더'
        }

        response = client.post('/user/login', json.dumps(user), content_type='application/json')
        self.assertEqual(response.status_code, 401)
        self.assertEqual(response.json(),{'message' : 'INVALID_USER'})


class KakaoLoginTest(TestCase):
    def setUp(self):
        client = Client()        
        User.objects.create(
            kakao_id          = '168312825',
            name              = '최청',
            profile_image_url = 'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true'
        )

    def tearDown(self):
        User.objects.all().delete()

    @patch('user.views.requests')
    def test_kakao_login_success(self, mock_request):
        client = Client()
        class MockResponse:
            def json(self):
                return {
                    'id'         : '168312825',
                    'properties' : {'nickname' : '최청', 'profile_image' : 'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true'},
                }
        
        mock_request.get = MagicMock(return_value = MockResponse())
        header           = {'HTTP_Authorization' : 'access_token'}
        response         = client.get('/user/login/kakao', content_type='application/json', **header)
        self.assertEqual(response.status_code, 201)

    @patch('user.views.requests')
    def test_kakao_signup_success(self, mock_request):
        client = Client()
        class MockResponse:
            def json(self):
                return {
                    'id'         : '1004',
                    'properties' : {'nickname' : '최라라', 'profile_image' : 'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true'},
                }
        mock_request.get = MagicMock(return_value = MockResponse())
        header           = {'HTTP_Authorization':'access_token'}
        response         = client.get('/user/login/kakao', content_type='application/json', **header)
        self.assertEqual(response.status_code, 201)

    @patch('user.views.requests')
    def test_kakao_login_key_error(self, mock_request):
        client = Client()
        class MockResponse:
            def json(self):
                return {
                    'i'         : '1004',
                    'properties' : {'nickname' : '최라라', 'profile_image' : 'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true'},
                }
        mock_request.get = MagicMock(return_value = MockResponse())
        header           = {'HTTP_Authorization':'access_token'}
        response         = client.get('/user/login/kakao', content_type='application/json', **header)
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(), {'message' : 'KEY_ERROR'})

class MyPageTest(TestCase):
    def setUp(self):
        client = Client()
        Category.objects.create(
            id   = 1,
            name = '영화'
        )
        User.objects.create(
            id                 = 1,
            email              = 'whatthe@pe.dia',
            name               = '최인아',
            kakao_id           = '1004',
            profile_image_url  = 'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true',
        )
        Movie.objects.create(
            id                 = 1,
            korean_title       = "장고",
            english_title      = "Django",
            release_date       = "2018-01-01",
            nationality        = "미국",
            number_of_audience = 25000,
            description        = "django는 재밌엉",
            running_time       = 130,
            is_watcha          = False,
            category_id        = 1,
        )
        MovieLike.objects.create(id=1, user_id=1, movie_id=1)

        self.access_token = jwt.encode({'user_id' : User.objects.get(id=1).id}, SECRET_KEY, ALGORITHM)

    def tearDown(self):
        client = Client()
        Category.objects.all().delete()
        UserStar.objects.all().delete()
        Movie.objects.all().delete()
        User.objects.all().delete()

    def test_mypage_success(self):
        client          = Client()
        user_star_count = UserStar.objects.filter(user_id=1, movie_id=1).count()
        header          = {'HTTP_Authorization':self.access_token}
        response        = client.get('/user/mypage', content_type='application/json', **header)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            'mypage_data':
            {
                'user'            : '최인아',
                'profile'         : 'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true',
                'user_star_count' : user_star_count
            }
        })       

    def test_mypage_not_found(self):
        client   = Client()
        header   = {'HTTP_Authorization':self.access_token}
        response = client.get('/whatthe', content_type='application/json', **header)
        self.assertEqual(response.status_code, 404)

class MyEvaluationTest(TestCase):
    def setUp(self):
        client = Client()
        Category.objects.create(
            id   = 1,
            name = '영화'
        )
        User.objects.create(
            id                 = 1,
            email              = 'whatthe@pe.dia',
            name               = '최인아',
            kakao_id           = '1004',
            profile_image_url  = 'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true',
        )
        Movie.objects.create(
            id                 = 1,
            korean_title       = "장고",
            english_title      = "Django",
            release_date       = "2018-01-01",
            nationality        = "미국",
            number_of_audience = 25000,
            description        = "django는 재밌엉",
            running_time       = 130,
            is_watcha          = True,
            category_id        = 1,
        )

        Movie.objects.create(
            id                 = 2,
            korean_title       = "파이썬",
            english_title      = "Python",
            release_date       = "2021-02-07",
            nationality        = "미국",
            number_of_audience = 250000,
            description        = "Python은 재밌엉",
            running_time       = 100,
            is_watcha          = True,
            category_id        = 1,
        )

        MovieImage.objects.create(
            id        = 1,
            image_url = "https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true",
            movie_id  = 1
            )

        UserStar.objects.create(id=1, user_id=1, movie_id=1, star=5)

        self.access_token = jwt.encode({'user_id' : User.objects.get(id=1).id}, SECRET_KEY, ALGORITHM)

    def tearDown(self):
        client = Client()
        Category.objects.all().delete()
        UserStar.objects.all().delete()
        Movie.objects.all().delete()
        MovieImage.objects.all().delete()
        User.objects.all().delete()

    def test_my_evaluation_success(self):
        client      = Client()
        user_star  = UserStar.objects.filter(user_id=1, movie_id=1)
        header      = {'HTTP_Authorization':self.access_token}
        response    = client.get('/user/rating', content_type='application/json', **header)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            "movie_info_data": [
                {
                    "title": "장고",
                    "image": "https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true",
                    "is_watcha": 1,
                    "star": 5,
                    "release_date": "2018-01-01"
                }
            ]
        })    

    def test_my_evaluation_not_found(self):
        client   = Client()
        header   = {'HTTP_Authorization':self.access_token}
        response = client.get('/whatthe', content_type='application/json', **header)
        self.assertEqual(response.status_code, 404)
    