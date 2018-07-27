# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.utils.translation import ugettext_lazy as _

from django.contrib import auth
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import *
# Register your models here.

admin.site.unregister(auth.models.Group)

class UserBaseAdmin(UserAdmin):
    list_display = ('id','email','first_name','last_name','birthday')
    ordering = ('-date_joined',)
    fieldsets = (
        (None, {'fields': ('username','email', 'password')}),
        (_('Personal info'),
            {'fields': ('first_name', 'last_name', 'birthday','avatar',
            'avatar_url','is_email_verified','fb_uid','opt')}),
        (_('Permissions'), 
            {'fields': ('is_active', 'is_staff', 'is_superuser',
                                       'groups', 'user_permissions')}),
        (_('Important dates'), 
            {'fields': ('last_login', 'date_joined')}),
        )

    readonly_fields = ('fb_uid',)

from treebeard.admin import TreeAdmin
from treebeard.forms import movenodeform_factory

class AL_TestNodeAdmin(TreeAdmin):
    form = movenodeform_factory(AL_TestNode)

admin.site.register(AL_TestNode, AL_TestNodeAdmin)

admin.site.register(UserBase, UserBaseAdmin)