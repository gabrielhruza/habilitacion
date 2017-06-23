# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from preinscripcion.models import Responsable, Postulante, CicloLectivo, Preinscripcion4Anios, PreinscripcionGeneral

# Register your models here.
admin.site.register(Responsable)
admin.site.register(Postulante)
admin.site.register(CicloLectivo)
admin.site.register(Preinscripcion4Anios)
admin.site.register(PreinscripcionGeneral)
