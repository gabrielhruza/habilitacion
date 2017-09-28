from django.conf.urls import url

from . import views

urlpatterns = [
	
	#neg
	url(r'^neg/new/$', views.neg_new, name='neg_new'),
	url(r'^neg/env/$', views.neg_env_index, name='neg_env_index'),
	url(r'^neg/rec/$', views.neg_rec_index, name='neg_rec_index'),

	#nep
	url(r'^nep/new/(?P<pgid>[0-9]+)/$', views.nep_new, name='nep_new'),

	#ne
	url(r'^ne/show/(?P<pid>[0-9]+)/$', views.ne_show, name='ne_show'),
	url(r'^ne/leida/(?P<pid>[0-9]+)/$', views.ne_leida, name='ne_leida'),
	url(r'^ne/rechazar/(?P<pid>[0-9]+)/$', views.ne_rechazar, name='ne_rechazar'),
	url(r'^ne/derivar/(?P<pid>[0-9]+)/$', views.ne_derivar, name='ne_derivar'),
	url(r'^ne/tracking/(?P<ndt>[0-9]+)/$', views.ne_tracking, name='ne_tracking'),
	url(r'^ne/notificacion/$', views.ne_notificacion, name='ne_notificacion'),
	url(r'^ne/desactnotif/$', views.ne_desactivar_notif, name='ne_desactivar_notif'),

	

]