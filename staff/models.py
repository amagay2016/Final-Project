from django.db import models
from django.contrib.auth.models import User
from custom.models import Pozisaun, Aldeia

class Staff(models.Model):
    user = models.OneToOneField(User, on_delete=models.SET_NULL, null=True, blank=True)
    nome = models.CharField(max_length=100)
    email = models.EmailField(max_length=100, null=True, blank=True)
    telefone = models.CharField(max_length=100, null=True, blank=True)
    aldeia = models.ForeignKey(Aldeia, on_delete=models.CASCADE)
    pozisaun = models.ForeignKey(Pozisaun, on_delete=models.CASCADE)
    espesializasaun = models.CharField(max_length=100, null=True, blank=True)
    profile_photo = models.ImageField(upload_to='staff_photos/', null=True, blank=True)

    def __str__(self):
        return self.nome

