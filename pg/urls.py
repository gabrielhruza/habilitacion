from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^new/$', views.pg_new, name='pg_new'),
    url(r'^comprobante/(?P<nrop>[0-9]+)/$', views.pdfPG, name='pdfPG'),

    #operaciones de administracion pg
    url(r'^index/$', views.admin_pg_index, name='admin_pg_index'), 
    url(r'^show/(?P<pid>[0-9]+)/$', views.admin_pg_show, name='admin_pg_show'),

    url(r'^confirmar/(?P<pid>[0-9]+)/$', views.admin_pg_confirmar, name='admin_pg_confirmar'),
	url(r'^cc/(?P<nrop>[0-9]+)/$', views.admin_pg_cc, name='admin_pg_cc')
]