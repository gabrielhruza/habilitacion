# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Perfil(models.Model):

	PERFIL = (
	    ('REP LEGAL', 'Representante Legal'),
	    ('ADMINSTRACION','Administracion'),
	    ('CONTABLE', 'Contable'),
	    ('COBRANZA', 'Cobranza'),
	    ('SECRETARIA', 'Secretaria'),
	    ('INFORMATICA','Informatica'),
	    ('MESA DE ENTRADA','Mesa de entrada'),
	    ('ESCUELA','Escuela'),
	    ('INICIAL', 'Inicial'),
	    ('PRIMARIA', 'Primaria'),
	    ('SECUNDARIA', 'Secundaria'),
	    ('BIBLIOTECA', 'Biblioteca'),
	    ('PARROQUIA', 'Parroquia')
    )


	perfil 	= models.CharField(max_length=30, choices=PERFIL, default='')
	
	def __str__(self):
		return self.perfil


class Profile(models.Model):

	NIVEL = (
	    ('INICIAL', 'Inicial'),
	    ('PRIMARIO', 'Primario'),
	    ('SECUNDARIO', 'Secundario'),
		('GENERAL','General'),	    
	    ('TODOS', 'Todos')
    )

	user 	= models.OneToOneField(User, on_delete=models.CASCADE)
	nivel 	= models.CharField(max_length=10, choices=NIVEL, default='INICIAL')
	perfil	= models.ManyToManyField(Perfil)
	
	def __str__(self):
		return self.user.username