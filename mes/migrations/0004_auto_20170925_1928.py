# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-09-25 22:28
from __future__ import unicode_literals

from django.db import migrations, models
import mes.models


class Migration(migrations.Migration):

    dependencies = [
        ('mes', '0003_auto_20170925_1826'),
    ]

    operations = [
        migrations.AddField(
            model_name='nota',
            name='nro_de_tracking',
            field=models.CharField(default=mes.models.id_generator, max_length=10, unique=True),
        ),
        migrations.AlterField(
            model_name='nota',
            name='estado',
            field=models.CharField(choices=[('NUEVA', 'Nueva'), ('RECIBIDA', 'Recibida'), ('LEIDA', 'Leida'), ('DERIVADA', 'Derivada'), ('RECHAZADA', 'Rechazada')], default='NUEVA', max_length=100),
        ),
    ]
