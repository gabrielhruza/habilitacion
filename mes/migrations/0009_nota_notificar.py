# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-09-28 22:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mes', '0008_auto_20170925_2318'),
    ]

    operations = [
        migrations.AddField(
            model_name='nota',
            name='notificar',
            field=models.BooleanField(default=True),
        ),
    ]