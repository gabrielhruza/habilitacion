# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from preinscripcion.decorators import group_required
from django.contrib import messages
from django.http import JsonResponse
from django.core import serializers
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from datetime import datetime    

from .models 	import Nota, NotaP, NotaI, Movimiento
from .forms 	import NeForm, NeDerivarForm, NegForm, NIForm, NepForm

from pg.models import Profile, Perfil
from preinscripcion.models import Postulante, PreinscripcionGeneral


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

      #selecciono perfil de session
      neg.emisor_perfil = Perfil.objects.get(perfil=request.session['perfil_selec'])

      neg.save()
      messages.success(request, 'Nota creada correctamente.')
      messages.success(request, 'N°: ' + neg.nro_de_tracking)

    else:
      context = neg

  return render(request, 'neg/new.html', { 
    'neg' : context, 
    'titulo_plantilla' : titulo_plantilla
  })


#dar de alta nota de entrada interna general
#no hay notas internas asociadas a postulantes
@group_required('mes')
def ni_new(request):
  
  titulo_plantilla = 'Enviar Nota Interna'

  context = NIForm(prefix='neg')

  if request.method == "POST":

    neg = NIForm(request.POST, prefix='neg')

    if neg.is_valid():

      neg = neg.save(commit=False)
      neg.setEmisor(request.user)

      #selecciono perfil de session
      neg.emisor_perfil = Perfil.objects.get(perfil=request.session['perfil_selec'])

      if neg.nota_fisica:

        #todas las notas internas con nota fisic asociada pasan por mesa de entrada 
        #enviar nota a perfil = "MESA DE ENTRADA"
        perfil = Perfil.objects.get(perfil='MESA DE ENTRADA')

      else:

        #si no tiene nota fisica asociada no pasa por MESA DE ENTRADA
        perfil = neg.enviar_a

      neg.setDestino(perfil)

      neg.save()
      messages.success(request, 'Nota creada correctamente.')
      messages.success(request, 'N°: ' + neg.nro_de_tracking)
      
    else:
        context = neg


  return render(request, 'neg/new.html', { 
    'neg' : context, 
    'titulo_plantilla' : titulo_plantilla
     })


#enviar nota interna recibida en MESA DE ENTRADA
@group_required('mes')
def ni_me(request, pid):

  ni = NotaI.objects.get(pk=pid)

  ni.destino    = ni.enviar_a
  ni.notificar  = True
  ni.estado     = 'DESPACHADA'

  ni.save()

  messages.success(request, 'Acción realizada correctamente.')
  
  return ni_rec_index(request)


#index de notas de entrada generales registradas
@group_required('mes')
def neg_env_index(request):

  titulo_plantilla = 'Notas generales enviadas'
  user = request.user
  user_perfiles = user.profile.perfil.all()

  page = request.GET.get('page', 1)

  
  #notas por perfil con estado = 'NUEVA'
  nxps = []

  for up in user_perfiles:
    nxp = []
    nxp.append(up.perfil)
    nxp.append(Nota.objects.exclude(remitente=None).filter(emisor= user, emisor_perfil=up, estado='NUEVA').count())
    nxps.append(nxp)

  perfil_selec = request.session['perfil_selec']
  negs = Nota.objects.filter(emisor=user,emisor_perfil__perfil=perfil_selec).exclude(remitente=None).order_by('-fecha_emision')
  

  #paginator
  paginator = Paginator(negs, 15)
  try:
    negs = paginator.page(page)
  except PageNotAnInteger:
    negs = paginator.page(1)
  except EmptyPage:
    negs = paginator.page(paginator.num_pages)


  return render(request, 'neg/env_index.html', { 
    'negs' : negs,
    'nxps'  : nxps,
    'titulo_plantilla' : titulo_plantilla
  })


#index de notas de entrada generales recibidas
@group_required('mes')
def neg_rec_index(request):
  
  titulo_plantilla = 'Notas ingresadas por mesa de entrada'
  user = request.user
  user_perfiles = user.profile.perfil.all()
  
  page = request.GET.get('page', 1)

  #notas por perfil con estado = NUEVA
  nxps = []

  for up in user_perfiles:
    nxp = []
    nxp.append(up.perfil)
    nxp.append(Nota.objects.exclude(remitente=None).filter(destino=up, estado='NUEVA').count())
    nxps.append(nxp)

  #selecciono perfil de session
  perfil_selec = Perfil.objects.get(perfil=request.session['perfil_selec'])

  negs = Nota.objects.filter(destino=perfil_selec).exclude(remitente=None).order_by('-fecha_emision')
  
  
  #paginator
  paginator = Paginator(negs, 15)
  try:
    negs = paginator.page(page)
  except PageNotAnInteger:
    negs = paginator.page(1)
  except EmptyPage:
    negs = paginator.page(paginator.num_pages)


  return render(request, 'neg/rec_index.html', { 
    'negs'  : negs,
    'nxps'  : nxps,
    'titulo_plantilla' : titulo_plantilla
  })



#index de notas recibidas internas
@group_required('mes')
def ni_rec_index(request):
  
  titulo_plantilla = 'Notas internas recibidas'
  user = request.user
  page = request.GET.get('page', 1)

  user_perfiles = user.profile.perfil.all()

  #notas por perfil con estado = NUEVA
  nxps = []

  for up in user_perfiles:
    nxp = []
    nxp.append(up.perfil)
    nxp.append(NotaI.objects.filter(destino=up, estado='NUEVA').count())
    nxps.append(nxp)

  #selecciono perfil de session
  perfil_selec = Perfil.objects.get(perfil=request.session['perfil_selec'])

  negs = NotaI.objects.filter(destino=perfil_selec).order_by('-fecha_emision')


  #paginator
  paginator = Paginator(negs, 15)
  try:
    negs = paginator.page(page)
  except PageNotAnInteger:
    negs = paginator.page(1)
  except EmptyPage:
    negs = paginator.page(paginator.num_pages)
  
  return render(request, 'neg/ni_rec_index.html', { 
    'negs'  : negs,
    'nxps'  : nxps,
    'titulo_plantilla' : titulo_plantilla
  })


#index de notas enviadas internas
@group_required('mes')
def ni_env_index(request):
  
  titulo_plantilla = 'Notas internas enviadas'
  
  user = request.user
  user_perfiles = user.profile.perfil.all()
  page = request.GET.get('page', 1)

  #notas por perfil con estado = NUEVA
  nxps = []

  for up in user_perfiles:
    nxp = []
    nxp.append(up.perfil)
    nxp.append(NotaI.objects.filter(emisor=user, emisor_perfil=up , estado='NUEVA').count())
    nxps.append(nxp)

  perfil_selec = request.session['perfil_selec']
  negs = NotaI.objects.filter(emisor=user, emisor_perfil__perfil=perfil_selec).order_by('-fecha_emision')
  
  
  #paginator
  paginator = Paginator(negs, 10)
  try:
    negs = paginator.page(page)
  except PageNotAnInteger:
    negs = paginator.page(1)
  except EmptyPage:
    negs = paginator.page(paginator.num_pages)


  return render(request, 'neg/ni_env_index.html', { 
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
      pact = request.session['perfil_selec']
      emisor_perfil = emisor.profile.perfil.get(perfil=pact)
      nivel = pg.nivel
      destino = Profile.objects.select_related('user').get(nivel=nivel)

      perfil_destino = destino.perfil.all().get(perfil=nivel)

      nep = nep.save(commit=False)
      nep.setEmisor(emisor)
      nep.emisor_perfil = emisor_perfil
      nep.setDestino(perfil_destino)
      nep.setPG(pg)
      nep.save()
      messages.success(request, 'Nota creada correctamente.')
      messages.success(request, 'N°: ' + nep.nro_de_tracking)
    else:
      context = nep

  return render(request, 'neg/new.html', { 
    'neg' : context, 
    'titulo_plantilla' : titulo_plantilla
    })


#ver notas asociadas a preinscripcion
@group_required('mes')
def nep_pre_asociada(request, pgid):

  titulo_plantilla = 'Notas asociadas a preinscripcion'
  
  negs = NotaP.objects.filter(pg__id=pgid).order_by('-fecha_emision')

  return render(request, 'neg/index.html', { 
    'negs' : negs,
    'titulo_plantilla' : titulo_plantilla
    })


#ver notas asociadas a dni de postulante
@group_required('mes')
def nep_post_asociadas(request):
  
  titulo_plantilla = 'Totales de notas presentadas por postulante'

  negs          = []
  resultado     = []
  fecha_actual  = datetime.now
  user_logueado = request.user.username
  postulante    = []
  pdni          = []
  
  if request.method == "POST":

    pdni = int(request.POST.get('dni', ''))

    postulantes = Postulante.objects.filter(dni=pdni)

    postulante = postulantes.first()

    for p in postulantes:
      corte = []
      pg = p.pg
      
      corte.append(pg)

      if not p.pg == None:
        notas = NotaP.objects.filter(pg=pg.id)
        corte.append(notas)
      
      resultado.append(corte)

  return render(request, 'neg/total_notas_postulante.html', { 
    'titulo_plantilla' : titulo_plantilla,
    'negs'  : negs,
    'pdni'  : pdni,
    'postulante'  : postulante,
    'resultado'   : resultado,
    'fecha_actual': fecha_actual,
    'user_logueado': user_logueado
    })



#ver una nota de entrada
@group_required('mes')
def ne_show(request, pid):

	titulo_plantilla = 'Detalle Nota'

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
    messages.success(request, 'Acción realizada correctamente.')
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
    messages.success(request, 'Acción realizada correctamente.')  
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
    messages.success(request, 'Acción realizada correctamente.')
  
  return ne_show(request, ne.id)


#nota entrada => derivar 
@group_required('mes')
def ne_derivar(request, pid):
  
  titulo_plantilla = 'Realizar DERIVACION de Nota'
  context = NeDerivarForm(prefix='ne')
  
  if request.method == "POST":
    
    ne = NeDerivarForm(request.POST, prefix='ne')
    
    if ne.is_valid():
      nota = Nota.objects.get(pk=pid)

      ne = ne.save(commit=False)
      ne.nota   = nota
      ne.emisor = request.user
      ne.emisor_perfil = nota.emisor_perfil
      ne.save()

      nota.estado = 'NUEVA'
      nota.notificar = True
      nota.destino = ne.destino
      nota.save()
      


      messages.success(request, 'Acción realizada correctamente.')
    else:
      context = ne
  
  return render(request, 'neg/new.html', { 
    'neg' : context, 
    'titulo_plantilla' : titulo_plantilla
})


#nota entrada => tracking
@group_required('mes')
def ne_tracking(request, ndt):

  movs = Movimiento.objects.filter(nota__nro_de_tracking=ndt).order_by('fecha')  
  nota = Nota.objects.get(nro_de_tracking=ndt)

  data = {}

  nota_json = {
    'fecha_emision' : nota.fecha_emision,
    'emisor_perfil' : nota.emisor_perfil.perfil,
    'nro_de_tracking' : nota.nro_de_tracking,
    'estado'        : nota.estado,
    'asunto'        : nota.asunto,
    'remitente'     : nota.remitente
      }

  data.update({'nota' : nota_json})

  movs_json = []

  for mov in movs:

    movs_json.append({
                  'fecha'   : mov.fecha,
                  'emisor_perfil'  : mov.emisor_perfil.perfil,       
                  'destino' : mov.destino.perfil,
                  'motivo_derivar' : mov.motivo_derivar,
    })
  
  data.update({'movs' : movs_json})

  return JsonResponse(data, safe=False)



#nota entrada => notificacion
@group_required('mes')
def ne_notificacion(request):

  user_logueado = request.user.profile.perfil.all()

  notas = Nota.objects.filter(destino__in=user_logueado, estado='NUEVA', notificar=True).order_by('fecha_emision')
  
  data = []

  for nota in notas:
    
    emisor = nota.emisor_perfil.perfil

    data.append({'fecha_emision': nota.fecha_emision,
                  'emisor':emisor,
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