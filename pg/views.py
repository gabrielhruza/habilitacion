# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.contrib import messages
from django.http import HttpResponse
from django.http import HttpResponseNotAllowed

from .forms import PgForm

from preinscripcion.forms 	import PostulanteForm, ResponsableForm
from preinscripcion.models 	import Postulante, CicloLectivo, PreinscripcionGeneral
from mes.models             import NotaP
from preinscripcion.decorators import group_required
from django.views.decorators.csrf import ensure_csrf_cookie

import datetime

from habilitacion.utils import render_to_pdf
from django.template.loader import get_template



# Create your views here.
def pg_new(request):

  padre_context = ResponsableForm(prefix='padre', initial=request.session.get('data_padre'))
  madre_context = ResponsableForm(prefix='madre', initial=request.session.get('data_madre'))
  tutor_context = ResponsableForm(prefix='tutor', initial=request.session.get('data_tutor'))
  vivecon_context = ResponsableForm(prefix='vivecon', initial=request.session.get('data_vivecon'))
  postulante_context = PostulanteForm(prefix='postulante')
  pg_context = PgForm(prefix='pg')
  
  if request.method == "POST":

    cdor        = 0
    formpadre   = ResponsableForm(request.POST, prefix='padre') # Bound form    
    formmadre   = ResponsableForm(request.POST, prefix='madre') # Bound form    
    formtutor   = ResponsableForm(request.POST, prefix='tutor') # Bound form    
    formvivecon = ResponsableForm(request.POST, prefix='vivecon') # Bound form    
    formpostulante = PostulanteForm(request.POST, prefix='postulante') # Bound form    
    formpg = PgForm(request.POST, prefix='pg') # Bound form

    #comienzo validaciones para cada uno
    if formpg.is_valid(): 
      pg_context = formpg
    else:
      pg_context = formpg

    if formpadre.is_valid(): 
      padre_context = formpadre
      request.session['data_padre'] = formpadre.cleaned_data
      cdor += 1
    else:
      padre_context = formpadre

    if formmadre.is_valid():
      madre_context = formmadre
      request.session['data_madre'] = formmadre.cleaned_data
      cdor += 1
    else:
      madre_context = formmadre
	   
    switch_tutor = False
    if formtutor.has_changed():
      switch_tutor = True
      if formtutor.is_valid(): 
        tutor_context = formtutor
        request.session['data_tutor'] = formtutor.cleaned_data
        switch_tutor = False
      else:
        tutor_context = formtutor

    if formvivecon.is_valid(): 
      vivecon_context = formvivecon
      request.session['data_vivecon'] = formvivecon.cleaned_data
      cdor += 1     
    else:
      vivecon_context = formvivecon

    if formpostulante.is_valid(): 
      postulante_context = formpostulante
      cdor += 1
    else:
      postulante_context = formpostulante


    #Si todo ha ido de maravillash
    if (cdor == 4 and switch_tutor == False):

      formpostulante = formpostulante.save(commit=False)

      formpadre   = formpadre.save()
      formmadre   = formmadre.save()
      formvivecon = formvivecon.save()

      formpg		= formpg.save()

      formpostulante.padre  	= formpadre
      formpostulante.madre  	= formmadre
      formpostulante.vive_con = formvivecon

      #calculo de edad del changuito/a
      diff = (datetime.date.today() - formpostulante.fecha_nacimiento).days
      edad = str(int(diff/365))
      formpostulante.edad   	= edad
      formpostulante.pg 		= formpg

      formpostulante.save()

      request.session["nropreinscripto"] = formpg.nro_de_preinscripto

      return render(request, 'pg/pg/exito.html', {
         'postulante' : formpostulante,	
          })

  return render(request, 'pg/pg/new.html', {
  	'formpg'  		: pg_context,
    'formpadre'   	: padre_context,
    'formmadre'   	: madre_context,
    'formtutor'   	: tutor_context,
    'formvivecon' 	: vivecon_context,
    'formpostulante': postulante_context

    })


##generar pdf
def pdfPG(request, nrop):

  if not request.session['nropreinscripto'] == nrop:
    return HttpResponse("ERROR AL GENERAR EL COMPROBANTE")

  template = get_template('pg/pg/comprobante.html')

  #html = template.render(pibe)

  postulantes  = Postulante.objects.all()

  #buscar el postulante con el nro de preinscripto igual al que viene por parametro
  for postulante in postulantes:
    if postulante.pg.nro_de_preinscripto == nrop:
      pibe = postulante

  contexto = {'postulante' : pibe }
  pdf = render_to_pdf('pg/pg/comprobante.html', contexto)

  if pdf:
    response = HttpResponse(pdf, content_type='application/pdf')
    filename = "Comprobante_Preinscripcion"
    content = "inline; filename='%s'" % (filename)
    return response
  
  return HttpResponse("ERROR AL GENERAR EL COMPROBANTE")

####


#listado de todas las preinscripciones
@group_required('recepcion')
def admin_pg_index_recepcion(request):

  titulo_plantilla = 'Listado de PREINCRIPCIONES'

  user_nivel  = request.user.profile.nivel

  cl    = 2017
  anio  = 1
  anios = 7

  if request.method == 'POST':
    cl    = int(request.POST.get('cl', ''))
    anio  = request.POST.get('anio', '')

  #ciclos lectivos
  clvs        = CicloLectivo.objects.all()
  
  if user_nivel == 'TODOS':
    postulantes = Postulante.objects.filter(pg__anio=anio, pg__cicloLectivo__fecha_apertura_ciclo__year=cl, pg__estado='CONFIRMADO')
     

  return render(request, 'pg/adminpg/index.html',{
          'titulo_plantilla' : titulo_plantilla,
          'postulantes' : postulantes,
          'clvs'        : clvs,
          'cl'          : cl,
          'anio'        : anio,
          'anios'       : anios
          }
          )


## operaciones relacionadas con el rol gestionpreinscripciones
#listado de todas las preinscripciones
@group_required('gestion_pg')
def admin_pg_index(request):

  titulo_plantilla = 'Listado de PREINCRIPCIONES'

  user_nivel  = request.user.profile.nivel

  cl    = 2017
  anio  = 1
  anios = 7

  if request.method == 'POST':
    cl    = int(request.POST.get('cl', ''))
    anio  = request.POST.get('anio', '')

  #ciclos lectivos
  clvs        = CicloLectivo.objects.all()
  
  postulantes = Postulante.objects.filter(pg__nivel=user_nivel, pg__anio=anio, pg__cicloLectivo__fecha_apertura_ciclo__year=cl)

  cp          = PreinscripcionGeneral.objects.filter(nivel=user_nivel, anio=anio, cicloLectivo__fecha_apertura_ciclo__year=cl).count()
  cpc         = PreinscripcionGeneral.objects.filter(nivel=user_nivel, anio=anio, cicloLectivo__fecha_apertura_ciclo__year=cl, estado='CONFIRMADO').count()
  cpa         = PreinscripcionGeneral.objects.filter(nivel=user_nivel, anio=anio, cicloLectivo__fecha_apertura_ciclo__year=cl, estado='ALUMNO').count()
     

  return render(request, 'pg/adminpg/index.html',{
          'titulo_plantilla' : titulo_plantilla,
          'postulantes' : postulantes,
          'cp'          : cp,
          'cpc'         : cpc,
          'cpa'         : cpa,
          'clvs'        : clvs,
          'cl'          : cl,
          'anio'        : anio,
          'anios'       : anios
          }
          )


#ver una preinscripcion en particular
@group_required('gestion_pg')
def admin_pg_show(request, pid):

  user_nivel  = request.user.profile.nivel

  #obtengo la preinscripcion con ese pid
  p  = PreinscripcionGeneral.objects.get(pk=pid)

  confirmado = p.is_confirmado()
  alumno     = p.is_alumno()

  #obtengo el postulante de esa preinscripcion
  postulante  = Postulante.objects.get(pg = p)

  hnos        = postulante.rhermanos();

  return render(request, 'pg/adminpg/show.html',{
          'p': p,
          'postulante'  : postulante,
          'hermanos'    : hnos,
          'confirmado'  : confirmado,
          'alumno'      : alumno
          }
  )

#listado de todas las preinscripciones confirmadas
@group_required('gestion_pg')
def admin_pg_confirmados(request):
  titulo_plantilla = 'Listado de CONFIRMADOS'

  user_nivel  = request.user.profile.nivel

  cl    = 2017
  anio  = 1
  anios = 7

  if request.method == 'POST':
    cl    = int(request.POST.get('cl', ''))
    anio  = request.POST.get('anio', '')

  #ciclos lectivos
  clvs        = CicloLectivo.objects.all()

  postulantes = Postulante.objects.filter(pg__nivel=user_nivel, pg__anio=anio, pg__cicloLectivo__fecha_apertura_ciclo__year=cl, pg__estado='CONFIRMADO')
  cp          = PreinscripcionGeneral.objects.filter(nivel=user_nivel, anio=anio, cicloLectivo__fecha_apertura_ciclo__year=cl, confirmado=True).count()
  cpc         = PreinscripcionGeneral.objects.filter(nivel=user_nivel, anio=anio, cicloLectivo__fecha_apertura_ciclo__year=cl, estado='CONFIRMADO').count()
  cpa         = PreinscripcionGeneral.objects.filter(nivel=user_nivel, anio=anio, cicloLectivo__fecha_apertura_ciclo__year=cl, estado='ALUMNO').count()
     

  return render(request, 'pg/adminpg/index.html',{
          'titulo_plantilla' : titulo_plantilla,
          'postulantes' : postulantes,
          'cp'          : cp,
          'cpc'         : cpc,
          'cpa'         : cpa,
          'clvs'        : clvs,
          'cl'          : cl,
          'anio'        : anio,
          'anios'       : anios
          }
          )


#confirmar formulario seleccionado
@group_required('gestion_pg')
def admin_pg_confirmar(request, pid):

  preinscripcion  = PreinscripcionGeneral.objects.get(pk=pid)

  #obtengo postulante a confirmar
  p = Postulante.objects.get(pg=preinscripcion.id)
  
  ##verificar si esta confirmado para el ciclo de la pg


  #sino existe lo doy de alta, sino envio errores
  #ple = False
  
  #if ple == False:
   #   pl.postulante     = p
    #  pl.save()
  #else:
   # messages.error(request, "Ya existe un formulario confirmado con el DNI que quiere ingresar.")
    #return admin_preinscripciones(request)

  #ver si el formulario  no esta confirmado y si no existe un dni duplicado
  if preinscripcion.confirmado == False :

    preinscripcion.set_estado_confirmar()
    preinscripcion.fecha_confirmado = datetime.date.today()
    preinscripcion.usuarioqueconfirma = request.user

    preinscripcion.save()

    messages.success(request, 'Preinscripción CONFIRMADA. Puede imprimir el comprobante.')

    #mensaje por si tiene hermanos
    if p.hermanos.all():
      messages.info(request, "El postulante tiene hermanos de la misma edad, advertir de que el responsable deberá realizar el mismo procedimiento con las demás preinscripciones.")  

  else:
    messages.error(request, "El formulario ya se encuentra CONFIRMADO.")

  return admin_pg_show(request, preinscripcion.id)


#asignar vacante formulario seleccionado
@group_required('gestion_pg')
def admin_pg_asignarvacante(request, pid):

  preinscripcion  = PreinscripcionGeneral.objects.get(pk=pid)

  #obtengo postulante a confirmar
  p = Postulante.objects.get(pg=preinscripcion.id)

  #ver si el formulario  no esta confirmado y si no existe un dni duplicado
  if preinscripcion.confirmado == True :

    preinscripcion.set_estado_asignarvacante()

    preinscripcion.save()

    messages.success(request, 'Exito!')

    #mensaje por si tiene hermanos
    if p.hermanos.all():
      messages.info(request, "El postulante tiene hermanos de la misma edad, advertir de que el responsable deberá realizar el mismo procedimiento con las demás preinscripciones.")  

  else:
    messages.error(request, "Error, ya está asignado.")

  return admin_pg_show(request, preinscripcion.id)


#Ranking por notas asociadas
@group_required('gestion_pg')
def admin_pg_ranking(request):
  titulo_plantilla = 'Ranking por nota asociadas'

  user_nivel  = request.user.profile.nivel

  cl    = 2017
  anio  = 1
  anios = 7

  if request.method == 'POST':
    cl    = int(request.POST.get('cl', ''))
    anio  = request.POST.get('anio', '')

  #ciclos lectivos
  clvs        = CicloLectivo.objects.all()

  pgs = PreinscripcionGeneral.objects.filter(nivel=user_nivel, anio=anio, cicloLectivo__fecha_apertura_ciclo__year=cl, estado='CONFIRMADO')[:10]

  for pg in pgs:
    cant_notas = NotaP.objects.filter(pg=pg).count()
    pg.cant_notas = cant_notas
    pg.save()
    
  return render(request, 'pg/adminpg/ranking.html',{
          'titulo_plantilla' : titulo_plantilla,
          'pgs'   : pgs,
          'clvs'  : clvs,
          'cl'    : cl,
          'anio'  : anio,
          'anios' : anios
          }
          )



#generar pdf comprobante confirmacion
##generar pdf
@group_required('gestion_pg')
def admin_pg_cc(request, nrop):
  template = get_template('pg/adminpg/comprobante_confirmado.html')

  preinscripcion = PreinscripcionGeneral.objects.get(nro_de_preinscripto=nrop)

  user = preinscripcion.usuarioqueconfirma

  contexto = {'preinscripcion' : preinscripcion, 'user': user }
  pdf = render_to_pdf('pg/adminpg/comprobante_confirmado.html', contexto)

  if pdf:
    response = HttpResponse(pdf, content_type='application/pdf')
    filename = "Comprobante_Preinscripcion"
    content = "inline; filename='%s'" % (filename)
    #download = request.GET.get("download")
    #return response
    #if download:
     # content = "attachment; filename='%s'" % (filename)
      #response['Content-Disposition'] = content
    return response
  
  return HttpResponse("ERROR AL GENERAR EL COMPROBANTE")


####