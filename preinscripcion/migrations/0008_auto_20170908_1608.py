# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-09-08 19:08
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('preinscripcion', '0007_preinscripciongeneral_motivo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='preinscripciongeneral',
            name='cicloLectivo',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='preinscripcion.CicloLectivo'),
        ),
    ]
