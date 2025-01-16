from django.db import models
from custom.models import Aldeia, Profisaun, Categoria
from staff.models import Staff

class FichaFamilia(models.Model):
    no_ficha = models.CharField(max_length=5, unique=True, primary_key=True)
    chefe_familia = models.CharField(max_length=100)
    aldeia = models.ForeignKey(Aldeia, on_delete=models.CASCADE)

    def __str__(self):
        return format(self.no_ficha - self.chefe_familia)

class Pasiente(models.Model):
    nome = models.CharField(max_length=100)
    ficha_familia = models.ForeignKey(FichaFamilia, on_delete=models.CASCADE)
    sexo = models.CharField(max_length=10, choices=[('Mane', 'Mane'), ('Feto', 'Feto')])
    profisaun = models.ForeignKey(Profisaun, on_delete=models.CASCADE)
    hela_fatin = models.CharField(max_length=20, null=True, blank=True)

    def __str__(self):
        return format(self.nome)

class Registo(models.Model):
    pasiente = models.ForeignKey(Pasiente, on_delete=models.CASCADE)
    data_registo = models.DateField(auto_now_add=True)
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    doctor = models.ForeignKey(Staff, on_delete=models.CASCADE, related_name='patient_registrations', null=True, blank=True)
    status = models.CharField(max_length=20, choices=[
        ('Pendente', 'Pendente'),
        ('Konsulta Hela', 'Konsulta Hela'),
        ('Konsulta Hotu ona', 'Konsulta Hotu ona')
    ], default='Pendente')

    def __str__(self):
        return format(self.pasiente.nome)

class Diagnosaun(models.Model):
    registo = models.ForeignKey(Registo, on_delete=models.CASCADE)
    data_diagnosaun = models.DateField(auto_now_add=True)
    diagnosaun = models.TextField()
    diagnose_by = models.ForeignKey(Staff, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.registo.pasiente.nome} - {self.data_diagnosaun}"
