from django.conf.urls import url

from . import views

urlpatterns = [
	
	url(r'^neg/new/$', views.neg_new, name='neg_new'),
	url(r'^neg/env/$', views.neg_env_index, name='neg_env_index'),
	url(r'^neg/rec/$', views.neg_rec_index, name='neg_rec_index'),
	url(r'^neg/show/(?P<pid>[0-9]+)/$', views.neg_show, name='neg_show'),
	url(r'^neg/leida/(?P<pid>[0-9]+)/$', views.neg_leida, name='neg_leida'),
	url(r'^neg/rechazar/(?P<pid>[0-9]+)/$', views.neg_rechazar, name='neg_rechazar'),
   
]