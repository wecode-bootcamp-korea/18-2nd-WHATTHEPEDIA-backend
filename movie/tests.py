from .models     import (Movie, MovieImage, Gallery, MovieGenre, 
                         Genre, Panel, UserStar, Comment, Genre, 
                         Actor, Comment, CommentLike, Category)
from user.models import User

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
            id                 = 2,
            korean_title       = '소울',
            english_title      = 'sonic',
            release_date       = '2018-01-01',
            nationality        = '미국',
            number_of_audience = 2000,
            description        = '소닉 설명',
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
               "result": [
                    "소닉",
                    "소울"
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
        
        