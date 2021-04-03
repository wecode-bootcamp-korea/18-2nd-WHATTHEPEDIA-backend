from django.db import models

class User(models.Model):
    name               = models.CharField(max_length=30)
    email              = models.EmailField(max_length=254, unique=True, null=True)
    kakao_id           = models.CharField(max_length=100, null=True, unique=True)
    password           = models.CharField(max_length=300)
    profile_image_url  = models.URLField(max_length=3000, null=True)
    maketing_is_agreed = models.BooleanField(default=False)
    account_type       = models.ForeignKey('AccountType', on_delete=models.CASCADE, null=True)
    
    class Meta:
        db_table = 'users'


class AccountType(models.Model):
    account_type = models.CharField(max_length=45)
    
    class Meta:
        db_table = 'account_types'