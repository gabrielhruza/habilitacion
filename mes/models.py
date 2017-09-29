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
	remitente  	= models.CharField(max_length=200, default='Don Pedro')
	fecha_emision 	= models.DateField(auto_now_add=True)
	estado 			= models.CharField(max_length=100, choices=ESTADO, default='NUEVA')
	nro_de_tracking = models.CharField(max_length=10, default=id_generator)
	notificar 	= models.BooleanField(default=True)
	motivo = models.CharField(max_length=200, default='No me acuerdo')	

	def setEmisor(self, user):
		self.emisor = user
		return self

	def setEstadoLeida(self):
		self.estado = 'LEIDA'
		return self

	def setEstadoRechazada(self):
		self.estado = 'RECHAZADA'
		return self

	def desactivarNotificacion(self):
		self.notificar = False
		return self


class NotaP(Nota):
	pg  = models.ForeignKey(PreinscripcionGeneral, null=True)

	def setPG(self, pg):
		self.pg = pg
		return self
