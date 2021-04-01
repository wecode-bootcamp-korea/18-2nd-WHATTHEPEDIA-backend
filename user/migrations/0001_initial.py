from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AccountType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('account_type', models.CharField(max_length=45)),
            ],
            options={
                'db_table': 'account_types',
            },
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('email', models.EmailField(max_length=254, null=True, unique=True)),
                ('kakao_id', models.CharField(max_length=100, null=True, unique=True)),
                ('password', models.CharField(max_length=300)),
                ('profile_image_url', models.URLField(max_length=3000, null=True)),
                ('maketing_is_agreed', models.BooleanField(default=False)),
                ('account_type', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='user.accounttype')),
            ],
            options={
                'db_table': 'users',
            },
        ),
    ]
