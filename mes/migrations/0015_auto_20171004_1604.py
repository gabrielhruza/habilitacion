# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-10-04 19:04
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('mes', '0014_auto_20171003_0145'),
    ]

    operations = [
        migrations.AddField(
            model_name='nota',
            name='accion_por',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='accion_por', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='nota',
            name='motivo',
            field=models.CharField(default='Consulta', max_length=200),
        ),
    ]
