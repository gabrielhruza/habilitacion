# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from preinscripcion.decorators import group_required
from preinscripcion.models import PreinscripcionGeneral
from django.contrib import messages

from .models 	import Nota 
from .forms 	import NeForm, NegForm, NepForm

# Create your views here.

## operaciones relacionadas con el rol mes

#dar de alta nota de entrada general
@group_required('mes')
def neg_new(request):
  
  titulo_plantilla = 'Crear Nota de Entrada General'

  context = NegForm(prefix='neg')

  if request.method == "POST":

    neg = NegForm(request.POST, prefix='neg')

    if neg.is_valid():

    	neg = neg.save(commit=False)
    	neg.setEmisor(request.user)
    	messages.success(request, 'Nota creada correctamente')
    	neg.save()

    else:
      	context = neg


  return render(request, 'neg/new.html', { 
  	'neg' : context, 
  	'titulo_plantilla' : titulo_plantilla
  	 })


#index de notas de entrada generales enviadas
@group_required('mes')
def neg_env_index(request):
	
	titulo_plantilla = 'Notas generales enviadas'
	user = request.user

	negs = Nota.objects.filter(emisor=user)

	return render(request, 'neg/env_index.html', { 
		'negs' : negs,
		'titulo_plantilla' : titulo_plantilla
		})


#index de notas de entrada generales recibidas
@group_required('mes')
def neg_rec_index(request):
	
	titulo_plantilla = 'Notas generales recibidas'
	user = request.user

	negs = Nota.objects.filter(receptor=user)

	return render(request, 'neg/env_index.html', { 
		'negs' : negs,
		'titulo_plantilla' : titulo_plantilla
		})


#dar de alta nota de entrada asociada a póstulante
@group_required('mes')
def nep_new(request, pgid):
  
  titulo_plantilla = 'Crear Nota de Entrada Asociada a Preinscripcion'

  context = NepForm(prefix='nep')

  if request.method == "POST":

    nep = NepForm(request.POST, prefix='nep')

    if nep.is_valid():

    	pg 	= PreinscripcionGeneral.objects.get(pk=pgid)

    	nep = nep.save(commit=False)
    	nep.setEmisor(request.user)
    	nep.setPG(pg)
    	messages.success(request, 'Nota creada correctamente')
    	nep.save()

    else:
      	context = nep


  return render(request, 'neg/new.html', { 
  	'neg' : context, 
  	'titulo_plantilla' : titulo_plantilla
  	 })


#ver una nota de entrada
@group_required('mes')
def ne_show(request, pid):

	titulo_plantilla = 'Nota entrada general'

	ne = Nota.objects.get(pk=pid)	

	return render(request, 'neg/show.html', { 
		'titulo_plantilla' : titulo_plantilla,
		'ne' : ne
		})


#nota entrada => marcar como leida
@group_required('mes')
def ne_leida(request, pid):

	ne = Nota.objects.get(pk=pid)
	ne.setEstadoLeida()
	ne.save()

	return ne_show(request, ne.id)


#nota entrada => rechazar
@group_required('mes')
def ne_rechazar(request, pid):

	ne = Nota.objects.get(pk=pid)
	ne.setEstadoRechazada()
	ne.save()

	return ne_show(request, ne.id)


#nota entrada => derivar (edito la fecha y el destinatario)
@group_required('mes')
def ne_derivar(request, pid):
  
  titulo_plantilla = 'Realizar DERIVACION de Nota'

  context = NeForm(prefix='ne')

  if request.method == "POST":

    ne = NeForm(request.POST, prefix='ne')

    if ne.is_valid():

    	neo = Nota.objects.get(pk=pid)

    	ne = ne.save(commit=False)

    	ne.setEmisor(request.user)
    	ne.save()
    	ne.nro_de_tracking  = neo.nro_de_tracking
    	ne.save()
    	messages.success(request, 'Acción realizada correctamente')

    else:
      	context = ne


  return render(request, 'neg/new.html', { 
  	'neg' : context, 
  	'titulo_plantilla' : titulo_plantilla
  	 })