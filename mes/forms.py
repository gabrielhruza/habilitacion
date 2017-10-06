from django import forms
from .models import Nota, NotaP

class NegForm(forms.ModelForm):
	class Meta:
		model 	= Nota
		fields 	= ['remitente','receptor', 'motivo']


class  NegInternaForm(forms.ModelForm):
	class Meta:
		model 	= Nota
		fields 	= ['motivo']


class NepForm(forms.ModelForm):
	class Meta:
		model 	= NotaP
		fields 	= ['emisor','remitente', 'motivo']


class NeForm(forms.ModelForm):
	class Meta:
		model 	= Nota
		fields 	= ['receptor']


class NeDerivarForm(forms.ModelForm):
	class Meta:
		model 	= Nota
		fields 	= ['receptor', 'motivo_derivar']
