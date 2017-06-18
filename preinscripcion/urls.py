from django.conf.urls import url

from . import views

urlpatterns = [
    
    url(r'^preinscripcion4/new/$', views.preinscripcion4_new, name='preinscripcion4_new'),
    url(r'^preinscripcion4/imprimir/$', views.preinscripcion4_imprimir, name='preinscripcion4_imprimir'),

    url(r'^accounts/login/$', views.login_mio, name='login_mio'),
    url(r'^accounts/logout/$', views.logout_mio, name='logout_mio'),

    #operaciones de administrador
    url(r'^administrador/$', views.admin_mio, name='admin_mio'),
    url(r'^administrador/preinscripciones/$', views.admin_preinscripciones, name='admin_preinscripciones'),
    url(r'^administrador/preinscripciones/(?P<year>[0-9]{4})/$', views.admin_p_cl, name='admin_p_cl'),
    url(r'^administrador/preinscripcion/ver/(?P<pid>[0-9]+)/$', views.admin_preinscripcion, name='admin_preinscripcion'),
    url(r'^administrador/postulantes/$', views.admin_postulantes, name='admin_postulantes'),
    url(r'^administrador/post-confirmados/$', views.admin_postulantes_confirmados, name='admin_postulantes_confirmados'),

    url(r'^administrador/preinscripciones/confirmar/(?P<pid>[0-9]+)/$', views.admin_confirmar, name='admin_confirmar'),
    url(r'^administrador/preinscripciones/desconfirmar/(?P<pid>[0-9]+)/$', views.admin_desconfirmar, name='admin_desconfirmar'),

    url(r'^administrador/ciclolectivo/new/$', views.admin_alta_ciclolectivo, name='admin_alta_ciclolectivo'),
    url(r'^administrador/ciclolectivo/$', views.admin_index_ciclolectivo, name='admin_index_ciclolectivo'),

]