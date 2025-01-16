from django.db import models

class Suco(models.Model):
    suco = models.CharField(max_length=20)
    
    def __str__(self):
        return self.suco

class Aldeia(models.Model):
    aldeia = models.CharField(max_length=20)
    suco = models.ForeignKey(Suco, on_delete=models.CASCADE)

    def __str__(self):
        return self.aldeia

class Categoria(models.Model):
    categoria = models.CharField(max_length=100)

    def __str__(self):
        return self.categoria

class Pozisaun(models.Model):
    pozisaun = models.CharField(max_length=100)

    def __str__(self):
        return self.pozisaun

class Profisaun(models.Model):
    profisaun = models.CharField(max_length=100)

    def __str__(self):
        return self.profisaun
