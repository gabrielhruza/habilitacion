from django import forms
from .models import Nota, NotaP, NotaI, Perfil, Movimiento

#import django_filters
from django_filters import rest_framework as filters

class NotaFilter(filters.FilterSet):
	class Meta:
		model 	= Nota
		fields 	= ['estado', 'nro_de_tracking','remitente']


class NotaIFilter(filters.FilterSet):
	class Meta:
		model 	= NotaI
		fields 	= ['estado', 'nro_de_tracking','remitente']


class NegForm(forms.ModelForm):
	class Meta:
		model 	= Nota
		fields 	= ['remitente', 'destino', 'motivo']


class  NIForm(forms.ModelForm):
	class Meta:
		model 	= NotaI
		fields 	= ['asunto', 'motivo', 'enviar_a' ,'nota_fisica']

	def __init__(self, *args, **kwargs):
		super(NIForm, self).__init__(*args, **kwargs)
		self.fields['enviar_a'] = forms.ModelChoiceField(queryset=Perfil.objects.all())


class NepForm(forms.ModelForm):
	class Meta:
		model 	= NotaP
		fields 	= ['remitente', 'motivo']


class NeForm(forms.ModelForm):
	class Meta:
		model 	= Nota
		fields 	= ['destino']


class NeDerivarForm(forms.ModelForm):
	class Meta:
		model 	= Movimiento
		fields 	= ['motivo_derivar', 'destino']
