from django import forms
from .models import Nota

class NegForm(forms.ModelForm):
	class Meta:
		model 	= Nota
		fields 	= ['receptor']
	