from django.urls import path
from . import views

urlpatterns = [
    path('categoria/', views.categoria_list, name='categoria-list'),
    path('categoria/create/', views.categoria_create, name='categoria-create'),
    path('categoria/<int:pk>/update/', views.categoria_update, name='categoria-update'),
    path('categoria/<int:pk>/delete/', views.categoria_delete, name='categoria-delete'),
]
