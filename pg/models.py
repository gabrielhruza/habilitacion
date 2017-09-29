# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Profile(models.Model):

	NIVEL = (
	    ('INICIAL', 'Inicial'),
	    ('PRIMARIO', 'Primario'),
	    ('SECUNDARIO', 'Secundario'),
	    ('TODOS', 'Todos')
    )

	user 	= models.OneToOneField(User, on_delete=models.CASCADE)
	nivel 	= models.CharField(max_length=10, choices=NIVEL, default='INICIAL')

	