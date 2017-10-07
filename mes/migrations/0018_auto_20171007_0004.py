# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-10-07 03:04
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pg', '0004_auto_20171004_1604'),
        ('mes', '0017_auto_20171006_2239'),
    ]

    operations = [
        migrations.CreateModel(
            name='NotaI',
            fields=[
                ('nota_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='mes.Nota')),
                ('enviar_a', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='pg.Perfil')),
            ],
            bases=('mes.nota',),
        ),
        migrations.AlterField(
            model_name='nota',
            name='emisor_perfil',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='pg.Perfil'),
        ),
        migrations.AlterField(
            model_name='nota',
            name='remitente',
            field=models.CharField(default='Andres Garcia', max_length=200),
        ),
    ]
