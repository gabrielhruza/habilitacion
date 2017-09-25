# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from preinscripcion.decorators import group_required
from django.contrib import messages

from .models 	import Nota 
from .forms 	import NegForm

# Create your views here.

## operaciones relacionadas con el rol mes

#dar de alta nota de entrada general
@group_required('mes')
def neg_new(request):
  
  titulo_plantilla = 'Nota de Entrada General'

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


#ver una nota de entrada general
@group_required('mes')
def neg_show(request, pid):

	titulo_plantilla = 'Nota entrada general'

	neg = Nota.objects.get(pk=pid)

	return render(request, 'neg/show.html', { 
		'titulo_plantilla' : titulo_plantilla,
		'neg' : neg
		})