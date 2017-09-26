from django.conf.urls import url

from . import views

urlpatterns = [
	
	#neg
	url(r'^neg/new/$', views.neg_new, name='neg_new'),
	url(r'^neg/env/$', views.neg_env_index, name='neg_env_index'),
	url(r'^neg/rec/$', views.neg_rec_index, name='neg_rec_index'),

	#nep
	url(r'^nep/new/$', views.nep_new, name='nep_new'),

	#ne
	url(r'^ne/show/(?P<pid>[0-9]+)/$', views.ne_show, name='ne_show'),
	url(r'^ne/leida/(?P<pid>[0-9]+)/$', views.ne_leida, name='ne_leida'),
	url(r'^ne/rechazar/(?P<pid>[0-9]+)/$', views.ne_rechazar, name='ne_rechazar'),
   
]