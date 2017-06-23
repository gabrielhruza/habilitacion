from django import forms
from .models import Preinscripcion4Anios, Postulante, Responsable, CicloLectivo
from datetime import date
# from django.forms import inlineformset_factory


class Preinscripcion4AniosForm(forms.ModelForm):
    class Meta:
        model = Preinscripcion4Anios
        fields = ['motivo']
        exclude = ['nro_de_preinscripto', 'nro_de_sorteo',
                   'estado', 'postulante', 'cicloLectivo', 'confirmado']

    def clean_motivo(self):
        caja = self.cleaned_data.get('motivo')
        if len(caja) < 10:
            raise forms.ValidationError('Escribir el motivo')
        return caja


class PostulanteForm(forms.ModelForm):
    class Meta:
        model = Postulante
        fields = ['apellido', 'nombre', 'fecha_nacimiento',
                  'dni', 'genero', 'domicilio',
                  ]
        exclude = ['padre', 'madre', 'hermanos', 'edad']

    def clean_apellido(self):
        ap = self.cleaned_data.get('apellido')
        if len(ap) < 3:
            raise forms.ValidationError("Ingrese un apellido valido")
        return ap

    def clean_nombre(self):
        name = self.cleaned_data.get('nombre')
        if len(name) < 3:
            raise forms.ValidationError("Ingrese un nombre valido")
        return name

    def clean_dni(self):
        dni = self.cleaned_data.get('dni')

        if not dni.isdigit():
            raise forms.ValidationError("Ingrese solamente numeros")
        else:
            if int(dni) < 40000000:
                raise forms.ValidationError("Ingrese un dni valido")
        return dni

    def clean_fecha_nacimiento(self):
        nac = self.cleaned_data.get('fecha_nacimiento')
        if nac >= date.today():
            msj = 'Ingrese una fecha de nacimiento valida'
            raise forms.ValidationError(msj)
        return nac

    def clean_domicilio(self):
        domi = self.cleaned_data.get('domicilio')
        if len(domi) < 5:
            msj = 'Ingrese un domicilio valido'
            raise forms.ValidationError(msj)
        return domi
        

class ResponsableForm(forms.ModelForm):
    class Meta:
        model = Responsable
        fields = [
            'apellido',
            'nombre',
            'dni',
            'email',
            'telefonoPersonal',
            'domicilio',
            'nacionalidad',
        ]

    def clean_dni(self):
        dni = self.cleaned_data.get('dni')

        if not dni.isdigit():
            raise forms.ValidationError("Ingrese solamente numeros")
        else:
            if int(dni) > 40000000:
                raise forms.ValidationError("Ingrese un dni valido")
        return dni

    def clean_telefonoPersonal(self):
        tel = self.cleaned_data.get('telefonoPersonal')

        if tel:
            if not tel.isdigit():
                raise forms.ValidationError("Ingrese solamente numeros")
            else:
                if len(tel) < 6:
                    msj = 'Escriba un telefono valido'
                    raise forms.ValidationError(msj)
        # else:
        #     raise forms.ValidationError("mierda de forumlario")
        #     print ("error de los buenos")
        return tel

    def clean_apellido(self):
        ap = self.cleaned_data.get('apellido')
        if len(ap) < 3:
            raise forms.ValidationError("Ingrese un apellido valido")
        return ap

    def clean_nombre(self):
        name = self.cleaned_data.get('nombre')
        if len(name) < 3:
            raise forms.ValidationError("Ingrese un nombre valido")
        return name

    def clean_domicilio(self):
        domi = self.cleaned_data.get('domicilio')
        if len(domi) < 5:
            msj = 'Ingrese un domicilio valido'
            raise forms.ValidationError(msj)
        return domi


class CicloLectivoForm(forms.ModelForm):
    class Meta:
        model = CicloLectivo
        fields = '__all__'
