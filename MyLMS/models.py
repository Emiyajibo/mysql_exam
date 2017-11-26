# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# 书库


class Book(models.Model):

    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='Book_ID')
    Available = models.BooleanField(default=1)
    Title = models.CharField(max_length=64,default='')
    Author = models.CharField(max_length=32, default='')
    ISBN = models.CharField(max_length=32, default='')
    Publisher = models.CharField(max_length=32, default='')
    Pub_Time = models.DateField(null=True)
    Pages = models.IntegerField(null=True)
    Description = models.TextField(null=True)
    Position = models.CharField(max_length=8, default='A-101')
    Price = models.DecimalField(max_digits=4, decimal_places=2, default=35)

    def __unicode__(self):
        return str(self.id)


class Reader(models.Model):
    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='Reader_ID')
    Name = models.CharField(max_length=16, null=False,unique=True)
    StudentCard = models.CharField(max_length=16, null=False,unique=True)
    Password = models.CharField(max_length=16, null=False)
    Active = models.BooleanField(default=0)

    def __unicode__(self):
        return str(self.id)


class Record(models.Model):
    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='Record_ID')
    Book = models.ForeignKey('Book',on_delete=models.CASCADE,related_name="The_Book")
    Reader = models.ForeignKey('Reader',on_delete=models.CASCADE,)
    Created_time = models.DateTimeField(auto_now_add = True)
    Modified_time = models.DateTimeField(auto_now=True)
    Fine = models.DecimalField(max_digits=4,decimal_places=2,default=0)
    WAITFORCHECK = 'WAITFORCHECK'
    BORROWED = 'BORROWED'
    RETURNED = 'RETURNED'
    TURNDOWN = 'TURNDOWN'
    DEMAGE = 'DEMAGE'
    STATUS_CHOICES = (
        ( WAITFORCHECK, 'WAITFORCHECK'),
        ( BORROWED , 'BORROWED'),
        ( RETURNED , 'RETURNED'),
        ( TURNDOWN , 'TURNDOWN'),
        ( DEMAGE , 'DEMAGE'),
    )
    Status = models.CharField(
        max_length=16,
        choices=STATUS_CHOICES,
        default=WAITFORCHECK,
    )

    def __unicode__(self):
        return str(self.id)


class FineStatistic(models.Model):
    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='Fine_ID')
    Begin_time = models.DateField(blank=True, null=True)
    End_time = models.DateField(blank=True, null=True)
    Reader =  models.ForeignKey('Reader',on_delete=models.CASCADE,blank=True,null=True)
    TotalFine = models.DecimalField(max_digits=8,decimal_places=2,default=0,null = True)

    def __unicode__(self):
        return str(self.id)


class AddbyISBN(models.Model):
    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='AddRecord_ID')
    ISBN = models.CharField(max_length=32, default='')
    Number = models.IntegerField(default=1)
    Price = models.DecimalField(max_digits=4, decimal_places=2, default=35.00)
    Position = models.CharField(max_length=8, default='A-101')

    def __unicode__(self):
        return str(self.id)
