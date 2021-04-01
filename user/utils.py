import json, jwt

from django.http    import JsonResponse

from my_settings    import SECRET_KEY, ALGORITHM
from user.models    import User

def Authoriation(func):
    def wrapper(self, request, *args, **kwargs):
        try:
            access_token = request.headers.get('Authoriation')
            payload      = jwt.decode(access_token, SECRET_KEY, ALGORITHM)
            user         = User.objects.get(id = payload['user_id'])
            request.user = user
        
        except User.DoesNotExist:
            return JsonResponse({'message':'INVALID_USER'}, status=400)
        except jwt.DecodeError:
            return JsonResponse({'message': 'INVALID_TOKEN'}, status=401)
        
        return func(self, request, *args, **kwargs)
    return wrapper