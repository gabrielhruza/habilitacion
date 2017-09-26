# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
from preinscripcion.models import PreinscripcionGeneral, Preinscripcion4Anios

import string, random

#metodos 
def id_generator(size=8, chars=string.digits):
  return ''.join(random.choice(chars) for _ in range(size))

# Create your models here.
class Nota(models.Model):

	ESTADO = (
		('NUEVA', 'Nueva'),
		('RECIBIDA', 'Recibida'),
		('LEIDA', 'Leida'),
		('DERIVADA', 'Derivada'),
		('RECHAZADA', 'Rechazada')

	)

	emisor			= models.ForeignKey(User, related_name='emisor', unique=False)
	receptor		= models.ForeignKey(User, related_name='receptor', unique=False)
	fecha_emision 	= models.DateField(auto_now_add=True)
	estado 			= models.CharField(max_length=100, choices=ESTADO, default='NUEVA')
	nro_de_tracking = models.CharField(max_length=10, unique=True, default=id_generator)

	def setEmisor(self, user):
		self.emisor = user
		return self

	def setEstadoLeida(self):
		self.estado = 'LEIDA'
		return self

	def setEstadoRechazada(self):
		self.estado = 'RECHAZADA'
		return self


class NotaP(Nota):
	p4 	= models.ForeignKey(Preinscripcion4Anios, null=True)
	pg  = models.ForeignKey(PreinscripcionGeneral, null=True)


class NotaG(Nota):
	motivo = models.CharField(max_length=200, default='No me acuerdo')	