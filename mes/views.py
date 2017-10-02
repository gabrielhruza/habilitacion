# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from preinscripcion.decorators import group_required
from preinscripcion.models import PreinscripcionGeneral
from django.contrib import messages
from django.http import JsonResponse
from django.core import serializers

from .models 	import Nota 
from .forms 	import NeForm, NegForm, NepForm

from pg.models import Profile

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
	
	titulo_plantilla = 'Notas enviadas'
	user = request.user

	negs = Nota.objects.filter(emisor=user)

	return render(request, 'neg/index.html', { 
		'negs' : negs,
		'titulo_plantilla' : titulo_plantilla
		})


#index de notas de entrada generales recibidas
@group_required('mes')
def neg_rec_index(request):
	
	titulo_plantilla = 'Notas recibidas'
	user = request.user

	negs = Nota.objects.filter(receptor=user)

	return render(request, 'neg/index.html', { 
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

      emisor = request.user
      nivel = pg.nivel
      receptor = Profile.objects.select_related('user').get(nivel=nivel)

      nep = nep.save(commit=False)
      nep.setEmisor(emisor)
      nep.setReceptor(receptor.user)
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

	titulo_plantilla = 'Nota entrada'

	ne = Nota.objects.get(pk=pid)	

	return render(request, 'neg/show.html', { 
		'titulo_plantilla' : titulo_plantilla,
		'ne' : ne
		})


#nota entrada => marcar como recibida
@group_required('mes')
def ne_recibida(request, pid):

  userlogueado = request.user
  ne = Nota.objects.get(pk=pid)

  if ne.emisor == userlogueado:
    messages.error(request, "Error, no puede marcar como RECIBIDA.")
    return ne_show(request, ne.id)
  else:
    ne.setEstadoRecibida()
    ne.save()
    messages.success(request, 'Acción realizada correctamente')
  return ne_show(request, ne.id)


#nota entrada => rechazar
@group_required('mes')
def ne_rechazar(request, pid):
  
  userlogueado = request.user  
  ne = Nota.objects.get(pk=pid)

  if ne.emisor == userlogueado:
    messages.error(request, "Error, no es posible RECHAZAR.")
    return ne_show(request, ne.id)
  else:
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


#nota entrada => tracking
@group_required('mes')
def ne_tracking(request, ndt):

  notas = Nota.objects.filter(nro_de_tracking=ndt).order_by('fecha_emision')  

  data = []

  for nota in notas:
    emisor = nota.emisor.username
    receptor = nota.receptor.username
    motivo = nota.motivo

    data.append({'fecha_emision': nota.fecha_emision,
                  'emisor':emisor,
                  'receptor': receptor,
                  'motivo': motivo,
                  'nro_de_tracking': nota.nro_de_tracking,
                  'estado': nota.estado
    })
    
  return JsonResponse(data, safe=False)



#nota entrada => notificacion
@group_required('mes')
def ne_notificacion(request):

  user_logueado = request.user.username

  notas = Nota.objects.filter(receptor__username=user_logueado, estado='NUEVA', notificar=True).order_by('fecha_emision')

  data = []

  for nota in notas:
    emisor = nota.emisor.username
    receptor = nota.receptor.username

    data.append({'fecha_emision': nota.fecha_emision,
                  'emisor':emisor,
                  'receptor': receptor,
                  'motivo': nota.motivo,
                  'estado': nota.estado,
                  'id' : nota.id
    })
    
  return JsonResponse(data, safe=False)



#nota entrada => desactivar notificacion
@group_required('mes')
def ne_desactivar_notif(request):

  pid = request.GET.get('pid', None)

  nota = Nota.objects.get(pk=pid)
  nota.desactivarNotificacion()
  nota.save()

  data = []
    
  return JsonResponse(data, safe=False)