from django.conf.urls import url

from . import views

urlpatterns = [

	#neg
	url(r'^neg/new/$', views.neg_new, name='neg_new'),
	url(r'^neg/env/$', views.neg_env_index, name='neg_env_index'),
	url(r'^neg/rec/$', views.neg_rec_index, name='neg_rec_index'),

	#ni
	url(r'^ni/new/$', views.ni_new, name='ni_new'),
	url(r'^ni/me/(?P<pid>[0-9]+)/$', views.ni_me, name='ni_me'),
	url(r'^ni/rec/$', views.ni_rec_index, name='ni_rec_index'),
	url(r'^ni/env/$', views.ni_env_index, name='ni_env_index'),

	#nep
	url(r'^nep/new/(?P<pgid>[0-9]+)/$', views.nep_new, name='nep_new'),
	url(r'^nep/asociada/(?P<pgid>[0-9]+)/$', views.nep_pre_asociada, name='nep_pre_asociada'),

	#ne
	url(r'^ne/show/(?P<pid>[0-9]+)/$', views.ne_show, name='ne_show'),
	url(r'^ne/recibida/(?P<pid>[0-9]+)/$', views.ne_recibida, name='ne_recibida'),
	url(r'^ne/rechazar/(?P<pid>[0-9]+)/$', views.ne_rechazar, name='ne_rechazar'),
	url(r'^ne/derivar/(?P<pid>[0-9]+)/$', views.ne_derivar, name='ne_derivar'),
	url(r'^ne/tramite/(?P<pid>[0-9]+)/$', views.ne_tramite, name='ne_tramite'),
	url(r'^ne/tracking/(?P<ndt>[0-9]+)/$', views.ne_tracking, name='ne_tracking'),
	url(r'^ne/notificacion/$', views.ne_notificacion, name='ne_notificacion'),
	url(r'^ne/desactnotif/$', views.ne_desactivar_notif, name='ne_desactivar_notif'),

	

]