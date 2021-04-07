from django.urls    import path

from .views         import SignupView, LoginView, KakaoView, MyPageView, MyEvaluationView

urlpatterns = [
    path('/signup', SignupView.as_view()),
    path('/login', LoginView.as_view()),
    path('/login/kakao', KakaoView.as_view()),
    path('/mypage', MyPageView.as_view()),
    path('/rating', MyEvaluationView.as_view()),
]
