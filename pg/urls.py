from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^new/$', views.new, name='new'),
    url(r'^comprobante/(?P<nrop>[0-9]+)/$', views.pdfPG, name='pdfPG'),
]