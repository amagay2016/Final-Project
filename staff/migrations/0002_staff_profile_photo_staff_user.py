# Generated by Django 4.2.6 on 2024-11-25 16:54

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('staff', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='staff',
            name='profile_photo',
            field=models.ImageField(default='avatar.jpg', upload_to='staff_photos/'),
        ),
        migrations.AddField(
            model_name='staff',
            name='user',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL),
        ),
    ]
