from django import forms
from django.contrib.auth.models import User
from .models import Staff

class StaffForm(forms.ModelForm):
    class Meta:
        model = Staff
        fields = ['nome', 'email', 'telefone', 'aldeia', 'pozisaun', 'profile_photo']

class UserProfileForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput(), required=False)
    confirm_password = forms.CharField(widget=forms.PasswordInput(), required=False)

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name']

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get('password')
        confirm_password = cleaned_data.get('confirm_password')

        if password and confirm_password:
            if password != confirm_password:
                raise forms.ValidationError("Passwords don't match")
        return cleaned_data
