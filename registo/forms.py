from django import forms
from .models import FichaFamilia, Pasiente, Registo, Staff, Diagnosaun

class FichaFamiliaForm(forms.ModelForm):
    class Meta:
        model = FichaFamilia
        fields = ['no_ficha', 'chefe_familia', 'aldeia']

class PasienteForm(forms.ModelForm):
    class Meta:
        model = Pasiente
        fields = ['nome', 'sexo', 'profisaun', 'hela_fatin']

class RegistoForm(forms.ModelForm):
    class Meta:
        model = Registo
        fields = ['categoria', 'doctor']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['doctor'].queryset = Staff.objects.filter(pozisaun=1)

class DiagnosaunForm(forms.ModelForm):
    class Meta:
        model = Diagnosaun
        fields = ['diagnosaun']
