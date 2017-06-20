from django import forms
from .models import Preinscripcion4Anios,Postulante, Responsable, Hermano, CicloLectivo

from django.forms import inlineformset_factory


class Preinscripcion4AniosForm(forms.ModelForm):
    class Meta:
    	model 	= Preinscripcion4Anios
    	fields 	= ['motivo']
        exclude = ['nro_de_preinscripto','nro_de_sorteo', 'estado', 'postulante', 'cicloLectivo', 'confirmado']     

    def clean_motivo(self):
        caja = self.cleaned_data.get('motivo')
        if len(caja)<1:
            raise forms.ValidationError('Escribir el motivo')

        return caja

class HermanoForm(forms.ModelForm):
    class Meta:
        model   = Hermano
        fields  = ['apellido', 'nombre', 'dni',]


class PostulanteForm(forms.ModelForm):
	class Meta:
		model 	= Postulante
		fields 	= [
            'apellido', 
            'nombre',
            'fecha_nacimiento',
            'dni',
            'genero',
            'domicilio',
            ]
        exclude = ['padre', 'madre', 'hermanos', 'edad']

class ResponsableForm(forms.ModelForm):
    class Meta:
        model   = Responsable
        fields  =(
            'apellido', 
            'nombre',
            'dni',
            'email',
            'telefonoPersonal',
            'domicilio',
            'nacionalidad',
        )

class CicloLectivoForm(forms.ModelForm):
    class Meta:
        model   = CicloLectivo
        fields  = '__all__'