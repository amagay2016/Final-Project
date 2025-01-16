from django.urls import path
from . import views

urlpatterns = [
    path('', views.staff_list, name='staff-list'),
    path('create/', views.staff_create, name='staff-create'),
    path('<int:pk>/update/', views.staff_update, name='staff-update'),
    path('<int:pk>/delete/', views.staff_delete, name='staff-delete'),
    path('<int:pk>/create-user/', views.staff_create_user, name='staff-create-user'),
    path('<int:pk>/reset-password/', views.staff_reset_password, name='staff-reset-password'),
    path('profile/', views.user_profile, name='user-profile'),
]
