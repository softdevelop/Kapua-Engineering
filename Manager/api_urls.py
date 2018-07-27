from django.conf.urls import url
from django.urls import re_path
from . import views as apiview
urlpatterns = [
	re_path(r'^list-node/$', apiview.NodeListAPIView.as_view(), name='list-node'),
	re_path(r'^list-node-update/$', apiview.EditNodeListAPIView.as_view(), name='list-node-update'),
]