from django import forms
from .models import Nota, NotaP, NotaI, Perfil, Movimiento

class NegForm(forms.ModelForm):
	class Meta:
		model 	= Nota
		fields 	= ['remitente','emisor_perfil','destino', 'motivo']

	def __init__(self, *args, **kwargs):
		user = kwargs.pop('user')
		super(NegForm, self).__init__(*args, **kwargs)
		self.fields['emisor_perfil'] = forms.ModelChoiceField(queryset=user.profile.perfil)
		self.fields['emisor_perfil'].label = 'Seleccione Perfil'



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
		fields 	= ['remitente', 'emisor_perfil', 'motivo']

	def __init__(self, *args, **kwargs):
		user = kwargs.pop('user')
		super(NepForm, self).__init__(*args, **kwargs)
		self.fields['emisor_perfil'] = forms.ModelChoiceField(queryset=user.profile.perfil)
		self.fields['emisor_perfil'].label = 'Seleccione Perfil'



class NeForm(forms.ModelForm):
	class Meta:
		model 	= Nota
		fields 	= ['destino']


class NeDerivarForm(forms.ModelForm):
	class Meta:
		model 	= Movimiento
		fields 	= ['motivo_derivar', 'destino']
