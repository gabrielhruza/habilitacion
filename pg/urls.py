from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^new/$', views.pg_new, name='pg_new'),
    url(r'^comprobante/(?P<nrop>[0-9]+)/$', views.pdfPG, name='pdfPG'),
]