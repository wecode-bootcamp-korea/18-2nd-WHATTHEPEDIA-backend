import json, re, bcrypt, jwt, requests

from django.http        import JsonResponse
from django.views       import View

from .models            import User
from my_settings        import SECRET_KEY, ALGORITHM

class SignupView(View):
    def post(self, request):
        try:
            data     = json.loads(request.body)
            name     = data['name']
            email    = data['email']
            password = data['password']
            
            if User.objects.filter(email=email).exists():
                return JsonResponse({'message' : 'ALREADY_EXISTS'}, status = 400)
            
            REGEX_EMAIL    = '^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
            REGEX_PASSWORD = '^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,25}$'

            if not re.match(REGEX_EMAIL, email):
                return JsonResponse({'message':'INVALID_VALUE'}, status=400)
            
            if not re.match(REGEX_PASSWORD, password):
                return JsonResponse({'message':'INVALID_VALUE'}, status=400)
            
            hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

            User.objects.create(
                name     = name,
                email    = email,
                password = hashed_password,
            )

            return JsonResponse({'message' : 'SUCCESS'}, status = 201)

        except json.JSONDecodeError:
            return JsonResponse({'message': 'JSON_DECODE_ERROR'}, status=400)
        except KeyError:
            return JsonResponse({'message': 'KEY_ERROR'}, status=400)

class LoginView(View):
    def post(self, request):
        try:
            data = json.loads(request.body)
            user = User.objects.get(email = data['email'])

            if not bcrypt.checkpw(data['password'].encode('utf-8'), user.password.encode('utf-8')):
                return JsonResponse({'message' : 'INVALID_USER'}, status=400)

            access_token = jwt.encode({'user_id' : user.id}, SECRET_KEY, ALGORITHM)
            return JsonResponse({'message' : 'SUCCESS', 'access_token' : access_token}, status=200)
        
        except json.JSONDecodeError:
            return JsonResponse({'message': 'JSON_DECODE_ERROR'}, status=400)
        except KeyError:
            return JsonResponse({'message': 'KEY_ERROR'}, status=400)
        except User.DoesNotExist:
            return JsonResponse({'message' : 'INVALID_USER'}, status=401)

class KakaoView(View):
    def get(self, request):
        try:
            access_token = request.headers["Authorization"]
            headers      = ({'Authorization':f'Bearer {access_token}'})
            kakao_url    = 'https://kapi.kakao.com/v2/user/me'
            response     = requests.get(kakao_url, headers = headers)
            user         = response.json()

            kakao_id          = user['id']
            kakao_name        = user['properties']['nickname']
            kakao_profile_img = user['properties']['profile_image']

            kakao_user, is_created = User.objects.get_or_create(kakao_id = user['id'])
            if not is_created:
                kakao_id           = kakao_id,
                name               = kakao_name,
                profile_image_url  = kakao_profile_img
                kakao_user.save()

            return JsonResponse({
                'message'         : 'SUCCESS',
                'access_token'    : access_token
                }, status=201)

        except KeyError:
            return JsonResponse({'message' : 'KEY_ERROR'}, status=400)