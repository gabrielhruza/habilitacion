# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-10-03 02:10
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pg', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='nivel',
            field=models.CharField(choices=[('INICIAL', 'Inicial'), ('PRIMARIO', 'Primario'), ('SECUNDARIO', 'Secundario'), ('GENERAL', 'General'), ('TODOS', 'Todos')], default='INICIAL', max_length=10),
        ),
    ]
