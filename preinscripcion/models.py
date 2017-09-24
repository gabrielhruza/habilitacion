# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User

import datetime, string, random

def id_generator(size=8, chars=string.digits):
  return ''.join(random.choice(chars) for _ in range(size))

# Create your models here.
class CicloLectivo(models.Model):
    
    fecha_apertura_ciclo    = models.DateField()
    fecha_cierre_ciclo      = models.DateField()
    fecha_inicio_preinsc_ni = models.DateField()
    fecha_fin_preinsc_ni    = models.DateField()
    vacantes                = models.PositiveIntegerField()
    ultimo_nro_sorteo       = models.PositiveIntegerField(default=0)
    fecha_dia_sorteo        = models.DateField() #agregar en modelo

    def __str__(self):
     return str(self.fecha_apertura_ciclo.year)


class Preinscripcion(models.Model):
    ESTADOPREINSCRIPCION = (
        ('PREINSCRIPTO', 'Preinscripto'),
        ('CONFIRMADO', 'Confirmado'),
        ('DESCARTADO', 'Descartado'),
        ('AUSENTE', 'Ausente'),
        ('RECHAZADO', 'Rechazado'),
        ('ALUMNO', 'Alumno'),
    )

    fecha = models.DateField(auto_now_add=True)
    hora = models.TimeField(auto_now_add=True)
    nro_de_preinscripto = models.CharField(
        max_length=10, unique=True, default=id_generator)
    estado = models.CharField(
        max_length=20, choices=ESTADOPREINSCRIPCION, default='PREINSCRIPTO')
    cicloLectivo = models.ForeignKey(CicloLectivo, null=True)
    fecha_confirmado = models.DateField(blank=True, null=True)
    confirmado = models.BooleanField(default=False)
    # este no me acuerdo para que se usaba
    usuarioqueconfirma = models.ForeignKey(User, null=True, unique=False)
    # tablas de usuarios del sistema
    responsablequeconfirma = models.CharField(max_length=20, null=True)
    # puede ser un padre,pariente o motomandado
    motivo = models.TextField(default='No contesta')

    def set_estado_confirmar(self):
        self.estado = 'CONFIRMADO'
        self.confirmado = True
        return self

    def set_estado_asignarvacante(self):
        self.estado = 'ALUMNO'
        return self

    def is_confirmado(self):
        return self.confirmado

    def is_alumno(self):
        alumno = False
        if self.estado == 'CONFIRMADO':
            alumno = True
        return alumno


    class Meta:
        abstract = True


class Preinscripcion4Anios(Preinscripcion):

    nro_de_sorteo = models.PositiveIntegerField(default=0)

    def set_estado_alumno(self):
        self.estado = 'ALUMNO'
        return self


class PreinscripcionGeneral(Preinscripcion):

    PROVINCIA = (
        ('CHACO','Chaco'),
        ('SANTA FE', 'Santa Fe'),
        ('BUENOS AIRES', 'Buenos Aires')
    )

    LOCALIDAD = (
        ('CHARATA','Charata'),
        ('ROSARIO','Rosario'),
        ('LA PLATA','La Plata'),
        ('RECONQUISTA','Reconquista')
    )

    NIVEL = (
            ('INICIAL', 'Inicial'),
            ('PRIMARIO', 'Primario'),
            ('SECUNDARIO', 'Secundario')
    )

    GRADO = (
            ('1', '1'), ('2', '2'),
            ('3', '3'), ('4', '4'),
            ('5', '5'), ('6', '6'),
            ('7', '7'),
    )

    nivel = models.CharField(max_length=10, choices=NIVEL, default='INICIAL')
    anio = models.CharField(max_length=1, choices=GRADO, default='1', verbose_name='Curso')
    institucion_anterior = models.CharField(max_length=200, default='Escuela actual', verbose_name='Nombre')
    localidad = models.CharField(max_length=200, choices=LOCALIDAD, default='CHARATA')
    provincia = models.CharField(max_length=100, choices=PROVINCIA, default='SANTA FE')
    telefono  = models.CharField(max_length=100, default='262626262')  
    cubrio_vacante = models.BooleanField(default=False)             


class Responsable(models.Model):  
    apellido 			= models.CharField(max_length=50)
    nombre 				= models.CharField(max_length=50)
    dni 				= models.CharField(max_length=8)
    email 				= models.EmailField()
    domicilio 			= models.CharField(max_length=150)
    nacionalidad		= models.CharField(max_length=150)
    telefonoPersonal	= models.CharField(max_length=30)


class Postulante(models.Model):
	#FEMENINO 	= 'Femenino'
    #MASCULINO 	= 'Masculino'

    GENERO = (
        ('FEMENINO', 'Femenino'),
        ('MASCULINO', 'Masculino'),
    )
  
    apellido 			= models.CharField(max_length=50)
    nombre 				= models.CharField(max_length=50)
    fecha_nacimiento 	= models.DateField()
    edad				= models.PositiveIntegerField()
    dni 				= models.CharField(max_length=8)
    genero				= models.CharField(max_length=15, choices=GENERO, default='MASCULINO')
    domicilio 			= models.CharField(max_length=150)
    vive_con			= models.ForeignKey(Responsable, related_name='vive_con', blank=True, null=True) 
    padre				= models.ForeignKey(Responsable, related_name='padre', null=True) 
    madre				= models.ForeignKey(Responsable, related_name='madre', null=True) 
    tutor				= models.ForeignKey(Responsable, related_name='tutor', null=True) 
    hermanos			= models.ManyToManyField('self', blank=True, null=True)
    preinscripcion      = models.ForeignKey(Preinscripcion4Anios, null=True)
    pg                  = models.ForeignKey(PreinscripcionGeneral, null=True)

    def rhermanos(self):
        hnos = []        

        if self.hermanos.all():
            for hno in self.hermanos.all():
                hnos.append(hno)
                for hno2 in hno.hermanos.all():
                    if not hno2 == self:
                        hnos.append(hno2)

        return hnos


class PostulanteConfirmado(models.Model):
    dni                 = models.CharField(max_length=8, unique=True)
    postulante          = models.ForeignKey(Postulante, null=True)

