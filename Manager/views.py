# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.urls import reverse
from django.http import HttpResponse, HttpResponseRedirect
from rest_framework.response import Response
from django.views.generic import TemplateView
from rest_framework import generics
from .models import *
from .serializers import *
from django.views import generic
from django.contrib.auth import authenticate
import pprint
from . import api_utils
from datetime import datetime
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.permissions import BasePermission, IsAdminUser, IsAuthenticated
from django.db.models import Q
import ast

# User login and get their profile
class UserProfile(generics.GenericAPIView):
    serializer_class = UserWithTokenSerializer

    def post(self, request, format=None):
        fb_token = request.data.get('fb_token')
        # gp_token = request.data.get('gp_token')
        email = request.data.get('email')
        password = request.data.get('password')

        user = None

        if request.user.is_authenticated:
            user = request.user
        elif fb_token:
            user = UserBase.get_or_create_user_from_facebook(fb_token, should_create=False)
        # elif gp_token:
        #     user = UserBase.get_or_create_user_from_googleplus(gp_token, should_create=False)
        elif email and password:
            user = authenticate(username=email, password=password)
        if not user:
            raise api_utils.BadRequest("INVALID_PROFILE")

        # if request.session.get('_auth_user_id', 0) != user.id:
        #     # create logged in session for the user if not available
        #     utils.login_user(request, user)
        if type(user) == UserBase:
            user.last_login = datetime.now()
            user.save()
            serializer = self.get_serializer(user)
            return Response(serializer.data)
        raise api_utils.BadRequest("INVALID_PROFILE")
# Create your views here.
class NodeListAPIView(generics.ListAPIView):
    queryset = AL_TestNode.objects.all()
    serializer_class = NodeSerializer

class EditNodeListAPIView(APIView):
    def post(self,request,format=None):
        list_data = request.data.get("list",None)
        ret = {}
        i=1
        for obj in list_data:
            obj = ast.literal_eval(str(obj))
            AL_TestNode.objects.filter(pk=int(obj['id'])).update(parent=obj['parent'],name=obj['name'],sib_order=i)
            i=i+1
        return Response(ret,status=status.HTTP_200_OK)