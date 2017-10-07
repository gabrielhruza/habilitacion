# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from preinscripcion.decorators import group_required
from preinscripcion.models import PreinscripcionGeneral
from django.contrib import messages
from django.http import JsonResponse
from django.core import serializers

from .models 	import Nota, NotaP
from .forms 	import NeForm, NeDerivarForm, NegForm, NegInternaForm, NepForm

from pg.models import Profile, Perfil

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


#dar de alta nota de entrada interna general
#no hay notas internas asociadas a postulantes
@group_required('mes')
def neg_int_new(request):
  
  titulo_plantilla = 'Enviar Nota Interna'

  context = NegInternaForm(prefix='neg', user=request.user)

  if request.method == "POST":

    neg = NegInternaForm(request.POST, prefix='neg', user=request.user)

    if neg.is_valid():

      neg = neg.save(commit=False)
      neg.setEmisor(request.user)
      #todas las notas internas pasan por mesa de entrada 
      #enviar nota a perfil = "MESA DE ENTRADA"
      perfil = Perfil.objects.get(perfil='MESA DE ENTRADA')

      neg.setReceptor(perfil)
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

  #user_perfiles = user.profile.perfil.all()


  negs = Nota.objects.filter(emisor=user)
  
  return render(request, 'neg/env_index.html', { 
    'negs' : negs,
    'titulo_plantilla' : titulo_plantilla
  })


#index de notas de entrada generales recibidas
@group_required('mes')
def neg_rec_index(request):
  
  titulo_plantilla = 'Notas recibidas'
  user = request.user

  user_perfiles = user.profile.perfil.all()

  #notas por perfil con estado = NUEVA
  nxps = []

  for up in user_perfiles:
    nxp = []
    nxp.append(up.perfil)
    nxp.append(Nota.objects.filter(receptor=up, estado='NUEVA').count())
    nxps.append(nxp)

  negs = Nota.objects.filter(receptor__in=user.profile.perfil.all())
  
  return render(request, 'neg/rec_index.html', { 
    'negs'  : negs,
    'nxps'  : nxps,
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

      print receptor

      perfil_receptor = receptor.perfil.all().get(perfil=nivel)

      nep = nep.save(commit=False)
      nep.setEmisor(emisor)
      nep.setReceptor(perfil_receptor)
      nep.setPG(pg)
      messages.success(request, 'Nota creada correctamente')
      nep.save()
    else:
      context = nep

  return render(request, 'neg/new.html', { 
    'neg' : context, 
    'titulo_plantilla' : titulo_plantilla
    })


#ver notas asociadas a preinscripcion
@group_required('mes')
def nep_pre_asociada(request, pgid):

  titulo_plantilla = 'Notas asociadas'
  
  negs = NotaP.objects.filter(pg__id=pgid)

  return render(request, 'neg/index.html', { 
    'negs' : negs,
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
    ne.setEstadoRecibida(userlogueado)
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
    ne.setEstadoRechazada(userlogueado)
    ne.save()
    messages.success(request, 'Acción realizada correctamente')  
  return ne_show(request, ne.id)


#nota entrada => en tramite
@group_required('mes')
def ne_tramite(request, pid):
  
  userlogueado = request.user  
  ne = Nota.objects.get(pk=pid)

  if ne.emisor == userlogueado:
    messages.error(request, "Error, no es posible realizar la acción.")
    return ne_show(request, ne.id)
  else:
    ne.setEstadoEnTramite(userlogueado)
    ne.save()
    messages.success(request, 'Acción realizada correctamente')
  
  return ne_show(request, ne.id)


#nota entrada => derivar (edito la fecha y el destinatario)
@group_required('mes')
def ne_derivar(request, pid):
  
  titulo_plantilla = 'Realizar DERIVACION de Nota'

  context = NeDerivarForm(prefix='ne')

  if request.method == "POST":

    ne = NeDerivarForm(request.POST, prefix='ne')

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

    remitente = nota.remitente
    emisor    = nota.emisor.username
    receptor  = nota.receptor.perfil
    motivo    = nota.motivo

    data.append({'fecha_emision': nota.fecha_emision,
                  'remitente'   : remitente,
                  'emisor'      : emisor,
                  'receptor'    : receptor,
                  'motivo'      : motivo,
                  'nro_de_tracking': nota.nro_de_tracking,
                  'motivo_derivar' : nota.motivo_derivar,
                  'estado'      : nota.estado
    })
    
  return JsonResponse(data, safe=False)



#nota entrada => notificacion
@group_required('mes')
def ne_notificacion(request):

  user_logueado = request.user.profile.perfil

  notas = Nota.objects.filter(receptor__in=user_logueado.all(), estado='NUEVA', notificar=True).order_by('fecha_emision')

  data = []

     #nep.setReceptor(receptor.perfil.all()[0])

  for nota in notas:
    emisor = nota.emisor.username
    #receptor = nota.receptor

    data.append({'fecha_emision': nota.fecha_emision,
                  'emisor':emisor,
                  #'receptor': receptor,
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