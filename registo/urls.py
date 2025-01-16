from django.urls import path
from . import views

urlpatterns = [
    path('ficha/', views.ficha_list, name='ficha-list'),
    path('ficha/create/', views.ficha_create, name='ficha-create'),
    path('ficha/<str:pk>/update/', views.ficha_update, name='ficha-update'),
    path('ficha/<str:pk>/', views.ficha_detail, name='ficha-detail'),
    path('ficha/<str:pk>/pasiente/<int:pasiente_id>/', views.ficha_detail, name='pasiente-update'),
    path('pasiente/<int:pk>/delete/', views.pasiente_delete, name='pasiente-delete'),
    path('my-patients/', views.my_patients, name='my-patients'),
    path('diagnose/<int:pk>/', views.diagnose_patient, name='diagnose-patient'),
    path('update-status/<int:pk>/', views.update_consultation_status, name='update-consultation-status'),
    path('patient-history/<int:pk>/', views.patient_history, name='patient-history'),
]