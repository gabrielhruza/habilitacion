from django import forms
from .models import NotaG, NotaP

class NegForm(forms.ModelForm):
	class Meta:
		model 	= NotaG
		fields 	= ['receptor', 'motivo']
	

class NepForm(forms.ModelForm):
	class Meta:
		model 	= NotaP
		fields 	= ['receptor', 'p4', 'pg']

	def __init__(self, *args, **kwargs):
		super(self.__class__, self).__init__(*args, **kwargs)
		# solo con los campos que especificaste en la clase Meta
		self.fields['p4'].required = False  
		self.fields['pg'].required = False  