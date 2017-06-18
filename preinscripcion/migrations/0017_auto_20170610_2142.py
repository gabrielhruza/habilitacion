# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-06-10 21:42
from __future__ import unicode_literals

from django.db import migrations, models
import preinscripcion.models


class Migration(migrations.Migration):

    dependencies = [
        ('preinscripcion', '0016_auto_20170610_1809'),
    ]

    operations = [
        migrations.AddField(
            model_name='preinscripcion4anios',
            name='confirmado',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='preinscripcion4anios',
            name='nro_de_preinscripto',
            field=models.CharField(default=preinscripcion.models.id_generator, max_length=10, unique=True),
        ),
    ]
