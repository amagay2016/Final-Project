from django import forms
from .models import Suco, Aldeia, Categoria, Pozisaun

class SucoForm(forms.ModelForm):
    class Meta:
        model = Suco
        fields = '__all__'

class AldeiaForm(forms.ModelForm):
    class Meta:
        model = Aldeia
        fields = '__all__'

class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categoria
        fields = ['categoria']
        widgets = {
            'categoria': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter categoria name'
            })
        }

    def clean_categoria(self):
        categoria = self.cleaned_data.get('categoria')
        if len(categoria) < 2:
            raise forms.ValidationError("Categoria must be at least 2 characters long")
        return categoria

class PozisaunForm(forms.ModelForm):
    class Meta:
        model = Pozisaun
        fields = '__all__'
