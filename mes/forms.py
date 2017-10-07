from django import forms
from .models import Nota, NotaP, NotaI, Perfil

class NegForm(forms.ModelForm):
	class Meta:
		model 	= Nota
		fields 	= ['remitente','receptor', 'motivo']


class  NegInternaForm(forms.ModelForm):
	class Meta:
		model 	= NotaI
		fields 	= ['motivo', 'emisor_perfil', 'enviar_a']

	def __init__(self, *args, **kwargs):
		user = kwargs.pop('user')
		super(NegInternaForm, self).__init__(*args, **kwargs)
		self.fields['emisor_perfil'] = forms.ModelChoiceField(queryset=user.profile.perfil)
		self.fields['emisor_perfil'].label = 'Seleccione Perfil'
		self.fields['enviar_a'] = forms.ModelChoiceField(queryset=Perfil.objects.all())



class NepForm(forms.ModelForm):
	class Meta:
		model 	= NotaP
		fields 	= ['remitente', 'motivo']


class NeForm(forms.ModelForm):
	class Meta:
		model 	= Nota
		fields 	= ['receptor']


class NeDerivarForm(forms.ModelForm):
	class Meta:
		model 	= Nota
		fields 	= ['receptor', 'motivo_derivar']
