# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
from preinscripcion.models import PreinscripcionGeneral, Preinscripcion4Anios
from pg.models import Perfil

import string, random
from django.db.models.signals import post_save
from django.dispatch import receiver

#metodos 
def id_generator(size=8, chars=string.digits):
  return ''.join(random.choice(chars) for _ in range(size))

# Create your models here.
class Nota(models.Model):

	ESTADO = (
		('NUEVA', 'Nueva'),
		('RECIBIDA', 'Recibida'),
		('EN TRAMITE','En trámite'),
		('DERIVADA', 'Derivada'),
		('RECHAZADA', 'Rechazada')
	)

	emisor			= models.ForeignKey(User, related_name='emisor', unique=False)
	receptor		= models.ForeignKey(Perfil, related_name='receptor', unique=False)
	remitente  		= models.CharField(max_length=200, default='Don Pedro')
	fecha_emision 	= models.DateField(auto_now_add=True)
	estado 			= models.CharField(max_length=100, choices=ESTADO, default='NUEVA')
	nro_de_tracking = models.CharField(max_length=10, default=id_generator)
	notificar 		= models.BooleanField(default=True)
	motivo 			= models.CharField(max_length=200, default='Consulta')	
	motivo_derivar	= models.CharField(max_length=200, default='')
	accion_por 		= models.ForeignKey(User, related_name='accion_por', unique=False, null=True)

	def setEmisor(self, user):
		self.emisor = user
		return self

	def setReceptor(self, user):
		self.receptor = user
		return self

	def setEstadoRecibida(self, user):
		self.estado = 'RECIBIDA'
		self.accion_por = user
		return self

	def setEstadoEnTramite(self, user):
		self.estado = 'EN TRÁMITE'
		self.accion_por = user
		return self

	def setEstadoRechazada(self, user):
		self.estado = 'RECHAZADA'
		self.accion_por = user
		return self

	def desactivarNotificacion(self):
		self.notificar = False
		return self
	
	def checkEmisorDistRecep(self):
		if self.emisor == self.receptor:
			return True
		else:
			return False


class NotaP(Nota):
	pg  = models.ForeignKey(PreinscripcionGeneral, null=True)

	def setPG(self, pg):
		self.pg = pg
		return self


# method for updating
@receiver(post_save, sender=NotaP, dispatch_uid="update_pg_notas_count")
def update_stock(sender, instance, **kwargs):
     instance.pg.cant_notas += 1
     instance.pg.save()