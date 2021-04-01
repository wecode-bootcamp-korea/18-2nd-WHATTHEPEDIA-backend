from django.urls    import path

from .views         import SignupView, LoginView, KakaoView

urlpatterns = [
    path('/signup', SignupView.as_view()),
    path('/login', LoginView.as_view()),
    path('/login/kakao', KakaoView.as_view()),
]
