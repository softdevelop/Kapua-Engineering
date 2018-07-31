# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.models import AbstractUser
from rest_framework.authtoken.models import Token
from django.db.models.signals import post_save, post_delete, pre_save, pre_delete
from django.dispatch import receiver
from django_tenants.models import TenantMixin, DomainMixin
from treebeard.al_tree import AL_Node
# Create your models here.

class UserBase(AbstractUser):
    email = models.EmailField(_('email address'), unique=True)
    birthday = models.DateField(null=True, blank=False)
    avatar = models.ImageField(help_text=_('Picture shall be squared, max 640*640, 500k'), upload_to='avatars',
                                 null=True, blank=True)
    avatar_url = models.CharField(max_length=200, null=True, blank=True)
    opt = models.CharField(max_length=255, null=True, blank=True)
    is_email_verified = models.BooleanField(default=False)
    fb_uid = models.CharField(max_length=200, null=True, blank=True)
    fb_access_token = models.CharField(max_length=1000, null=True, blank=True)

    @property
    def full_name(self):
        return u'{} {}'.format(self.first_name,self.last_name)

    @property
    def token(self):
        return self.auth_token.key

    @property
    def qr_code(self):
        datetime_format = '%Y-%m-%d %H:%M:%S'
        # today = (self.last_login).strftime(datetime_format)
        data = u'User:{} {} Id:{}'.format(self.first_name, self.last_name, self.id)
        data = urllib.quote_plus(data)
        return u'https://api.qrserver.com/v1/create-qr-code/?size=300x300&data={}'.format(data)

@receiver(post_save, sender=UserBase)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)

class UserLog(models.Model):
    user = models.ForeignKey("UserBase", related_name="log_at",on_delete=models.CASCADE)
    creation_date = models.DateTimeField(auto_now_add=True)

class Client(TenantMixin):
    name = models.CharField(max_length=100)
    paid_until =  models.DateField()
    on_trial = models.BooleanField()
    created_on = models.DateField(auto_now_add=True)
    # default true, schema will be automatically created and synced when it is saved
    auto_create_schema = True

class Domain(DomainMixin):
    pass

class AL_TestNode(AL_Node):

    parent = models.ForeignKey('self',
                               related_name='children',
                               null=True,
                               db_index=True,on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    sib_order = models.PositiveIntegerField()
    
    def __str__(self):
        return self.name
    class Meta:
        verbose_name = 'Directory'
        verbose_name_plural = 'Directory'
