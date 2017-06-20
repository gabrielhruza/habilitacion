# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from reportlab.pdfgen import canvas
from django.contrib import messages
from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout

from django.forms import formset_factory

from .forms import Preinscripcion4AniosForm, PostulanteForm, ResponsableForm, HermanoForm, CicloLectivoForm
from .models import Preinscripcion4Anios, Postulante, PostulanteConfirmado, CicloLectivo, CicloLectivo

from .decorators import group_required
import datetime


# Create your views here.
#login y demases 
def login_mio(request):
  if request.method == "POST":
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(request, username=username, password=password)
    
    if user is not None:
      login(request, user)
      return admin_mio(request)
    
    else:
      messages.error(request, "Usuario y/o contraseña incorrectos.")
      return render(request, 'accounts/login.html')
  else:
    return render(request, 'accounts/login.html')


def logout_mio(request):
    logout(request)
    return admin_preinscripciones(request)


#vista para anonimos
def preinscripcion4_new(request):
    HermanosFormSet = formset_factory(PostulanteForm)
    
    if request.method == "POST":

        formp      = Preinscripcion4AniosForm(request.POST, prefix='p') # Bound form
        formpost   = PostulanteForm(request.POST, prefix='postulante') # Bound form
        formpadre  = ResponsableForm(request.POST, prefix='padre') # Bound form
        formmadre  = ResponsableForm(request.POST, prefix='madre') # Bound form
        formtutor  = ResponsableForm(request.POST, prefix='tutor') # Bound form
        formvivecon  = ResponsableForm(request.POST, prefix='vivecon') # Bound form
        hnos       = HermanosFormSet(request.POST, prefix='hno')
        
        formpadre   = formpadre.save()
        formmadre   = formmadre.save()

        
        formtutor   = formtutor.save()

        formvivecon = formvivecon.save()
        formp       = formp.save()

        #actualizo el ciclo lectivo para la actual preinscripcion
        formpact        = Preinscripcion4Anios.objects.get(pk=formp.id)
        ciclo_lectivo   = CicloLectivo.objects.get(pk=3)
        formpact.cicloLectivo = ciclo_lectivo
        formpactn        = formpact.save()

        formpost                = formpost.save(commit=False)
        formpost.padre          = formpadre
        formpost.madre          = formmadre
        formpost.tutor          = formtutor
        formpost.vive_con       = formvivecon
        formpost.preinscripcion = formp

        #calculo la edad
        diff = (datetime.date.today() - formpost.fecha_nacimiento).days
        years = str(int(diff/365))
        
        formpost.edad      = years
        formpostn          = formpost.save()

        #Agrego los hermanos para cada postulante
        for hno in hnos:
          hnon = hno.save()
          formpost.hermanos.add(hnon)

        #crear pdf de la preinscripcion
        return render(request, 'preinscripcion4anios/exito.html', {
           'formp'   : formpact,
           'formpost': formpost,
            }
            )
    else:
        formp        = Preinscripcion4AniosForm(prefix='p')
        formpost     = PostulanteForm(prefix='postulante')
        formpadre    = ResponsableForm(prefix='padre')
        formmadre    = ResponsableForm(prefix='madre')
        formtutor    = ResponsableForm(prefix='tutor')
        formvivecon  = ResponsableForm(prefix='vivecon')

        HermanosFormSet = formset_factory(PostulanteForm, max_num=4, min_num=0)
        hermanosFormSet = HermanosFormSet(prefix='hno')

        return render(request, 'preinscripcion4anios/new.html',{
          'formp': formp , 
          'formpost': formpost, 
          'formpadre': formpadre,
          'formmadre': formmadre,
          'formtutor': formtutor,
          'formvivecon' : formvivecon,
          'hermanosFormSet' : hermanosFormSet,
          }
        )


def preinscripcion4_imprimir(request):
    # Create the HttpResponse object with the appropriate PDF headers.
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="preinscripcion.pdf"'

    # Create the PDF object, using the response object as its "file."
    p = canvas.Canvas(response)

    # Draw things on the PDF. Here's where the PDF generation happens.
    # See the ReportLab documentation for the full list of functionality.
    p.drawString(100, 100, "Hello world.")

    # Close the PDF object cleanly, and we're done.
    p.showPage()
    p.save()
    return response


#operaciones de administradores

#pagina de inicio de admin
@login_required(login_url='/accounts/login/')
def admin_mio(request):
  
  return render(request, 'admin.html')


## operaciones relacionadas con el rol gestionpreinscripciones
#listado de todas las preinscripciones
@group_required('gestionpreinscripciones')
def admin_preinscripciones(request):

  postulantes = Postulante.objects.all()

  return render(request, 'admin/preinscripciones.html',{
          'postulantes': postulantes 
          }
          )


#listado de todas las preinscripciones de un ciclo lectivo
@group_required('gestionpreinscripciones')
def admin_p_cl(request, year):

  postulantes = Postulante.objects.all()
  resultado = []

  for postulante in postulantes:
    if postulante.preinscripcion.cicloLectivo.fecha_apertura_ciclo.year == int(year):
      resultado.append(postulante)  

  return render(request, 'admin/preinscripciones.html',{
          'postulantes': resultado
          }
          )


#listado de todas los postulantes
@login_required(login_url='/accounts/login/')
@group_required('gestionpreinscripciones')
def admin_postulantes(request):

  postulantes = Postulante.objects.all()

  return render(request, 'admin/postulantes.html',{
          'postulantes': postulantes 
          }
          )

#listado de todas los postulantes confirmados
@login_required(login_url='/accounts/login/')
def admin_postulantes_confirmados(request):

  pls = PostulanteConfirmado.objects.all()

  return render(request, 'admin/postulantes-confirmados.html',{
          'pls': pls 
          }
          )

#confirmar formulario seleccionado
@login_required(login_url='/accounts/login/')
@group_required('gestionpreinscripciones')
def admin_confirmar(request, pid):

  preinscripcion  = Preinscripcion4Anios.objects.get(pk=pid)

  #obtengo postulante confirmado
  p                 = Postulante.objects.get(preinscripcion_id=preinscripcion.id)
  pl                = PostulanteConfirmado()
  pl.dni            = p.dni

  #sino existe lo doy de alta, sino envio errores
  ple = PostulanteConfirmado.objects.filter(dni=pl.dni).exists()
  
  if ple == False:
      pl.postulante     = p
      pl.save()
  else:
    messages.error(request, "Ya existe un formulario confirmado con el DNI que quiere ingresar.")
    return admin_preinscripciones(request)

  #ver si el formulario  no esta confirmado y si no existe un dni duplicado
  if preinscripcion.confirmado == False :

    ciclo_lectivo  = CicloLectivo.objects.get(pk=preinscripcion.cicloLectivo_id)

    nro_sorteo = ciclo_lectivo.ultimo_nro_sorteo 

    nro_sorteo = nro_sorteo + 1
    ciclo_lectivo.ultimo_nro_sorteo = nro_sorteo
    ciclo_lectivo.save()

    preinscripcion.nro_de_sorteo = nro_sorteo
    preinscripcion.confirmado = True
    preinscripcion.estado     = 'CONFIRMADO'
    preinscripcion.save()

    messages.success(request, 'Preinscripción CONFIRMADA. Puede imprimir el comprobante.')

  else:
    messages.error(request, "El formulario ya se encuentra CONFIRMADO.")

  return admin_preinscripcion(request, preinscripcion.id)


#desconfirmar la preinscripcion seleccionada
@login_required(login_url='/accounts/login/')
@group_required('gestionpreinscripciones')
def admin_desconfirmar(request, pid):

  preinscripcion  = Preinscripcion4Anios.objects.get(pk=pid)

  if preinscripcion.confirmado == True :

    ciclo_lectivo  = CicloLectivo.objects.get(pk=preinscripcion.cicloLectivo_id)

    nro_sorteo = ciclo_lectivo.ultimo_nro_sorteo

    nro_sorteo = nro_sorteo - 1

    ciclo_lectivo.ultimo_nro_sorteo   = nro_sorteo
    ciclo_lectivo.save()

    p   = Postulante.objects.get(preinscripcion=pid)
    pl  = PostulanteConfirmado.objects.get(postulante=p.id)
    pl.delete()

    preinscripcion.nro_de_sorteo = 0
    preinscripcion.confirmado = False
    preinscripcion.estado     = 'PREINSCRIPTO'
    preinscripcion.save()

  return admin_preinscripciones(request)


#ver una preinscripcion en particular
@login_required(login_url='/accounts/login/')
@group_required('gestionpreinscripciones')
def admin_preinscripcion(request, pid):

  p  = Preinscripcion4Anios.objects.get(pk=pid)

  return render(request, 'admin/verpre.html',{
          'p': p 
          }
  )

## operaciones relacionadas con el rol gestionciclolectivo
#dar de alta ciclo lectivo
@login_required(login_url='/accounts/login/')
@group_required('gestionciclolectivo')
def admin_alta_ciclolectivo(request):

  context = CicloLectivoForm(prefix='cl')

  if request.method == "POST":

    cl = CicloLectivoForm(request.POST, prefix='cl')

    if cl.is_valid():
      cl.save()
      messages.success(request, 'Ciclo Lectivo creado correctamente')
      context = cl
    else:
      context = cl

  return render(request, 'admin/ciclolectivo/new.html', { 'cl' : context })


#Listado de ciclos lectivos
@login_required(login_url='/accounts/login/')
@group_required('gestionciclolectivo')
def admin_index_ciclolectivo(request):

  cl_index = CicloLectivo.objects.all()

  return render(request, 'admin/ciclolectivo/index.html', { 'cl_index' : cl_index })