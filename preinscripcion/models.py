# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

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


class Preinscripcion4Anios(models.Model):

    ESTADOPREINSCRIPCION = (
        ('PREINSCRIPTO', 'Preinscripto'),
        ('CONFIRMADO', 'Confirmado'),
        ('DESCARTADO', 'Descartado'),
        ('AUSENTE', 'Ausente'),
        ('RECHAZADO', 'Rechazado'),
        ('ALUMNO', 'Alumno'),
    )

    fecha               = models.DateField(auto_now_add=True)
    hora                = models.TimeField(auto_now_add=True)
    nro_de_preinscripto = models.CharField(max_length=10, unique=True, default=id_generator)
    nro_de_sorteo       = models.PositiveIntegerField(default=0)
    estado              = models.CharField(max_length=20, choices=ESTADOPREINSCRIPCION, default='PREINSCRIPTO')
    motivo              = models.TextField(default='No contesta')
    confirmado          = models.BooleanField(default=False)
    cicloLectivo        = models.ForeignKey(CicloLectivo, null=True)


class Responsable(models.Model):  
    apellido 			= models.CharField(max_length=50)
    nombre 				= models.CharField(max_length=50)
    dni 				= models.CharField(max_length=8, default='12345678')
    email 				= models.EmailField()
    domicilio 			= models.CharField(max_length=150)
    nacionalidad		= models.CharField(max_length=150)
    telefonoPersonal	= models.CharField(max_length=30, null=True, blank=True)


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


class PostulanteConfirmado(models.Model):
    dni                 = models.CharField(max_length=8, unique=True)
    postulante          = models.ForeignKey(Postulante, null=True)



class PreinscripcionGeneral(models.Model):

	NIVEL = (
		('INICIAL', 'Inicial'),
		('PRIMARIO', 'Primario'),
		('SECUNDARIO', 'Secundario')
	)

	fecha 				= models.DateField(auto_now_add=True)
	hora 				= models.TimeField(auto_now_add=True)
	nro_de_preinscripto = models.CharField(max_length=10,unique=True)
	nivel 				= models.CharField(max_length=20,choices=NIVEL, default='INICIAL')
	grado 				= models.PositiveIntegerField() #arreglar esto
	confirmado         	= models.BooleanField(default=False)
	cubrio_vacante		= models.BooleanField(default=False) #agregar en modelo
	postulante			= models.ForeignKey(Postulante)
	cicloLectivo 		= models.ForeignKey(CicloLectivo)
