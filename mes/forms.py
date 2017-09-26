from django import forms
from .models import Nota, NotaG, NotaP

class NegForm(forms.ModelForm):
	class Meta:
		model 	= NotaG
		fields 	= ['remitente','receptor', 'motivo']
	

class NepForm(forms.ModelForm):
	class Meta:
		model 	= NotaP
		fields 	= ['remitente','receptor']


class NeForm(forms.ModelForm):
	class Meta:
		model 	= Nota
		fields 	= ['receptor']
