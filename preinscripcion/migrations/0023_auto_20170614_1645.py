# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-06-14 16:45
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('preinscripcion', '0022_auto_20170613_1908'),
    ]

    operations = [
        migrations.AlterField(
            model_name='responsable',
            name='telefonoPersonal',
            field=models.CharField(max_length=30, null=True),
        ),
    ]
