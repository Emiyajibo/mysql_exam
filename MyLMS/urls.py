# -*- coding: utf-8 -*-
from django.conf.urls import url


from .import views

urlpatterns = [
    url(r'^$', views.login_page,name='login_page'),
    url(r'^login/$', views.login_page, name='login_page'),
    url(r'^login/1$', views.login_action, name='login_action'),
    url(r'^signup/$', views.signup_page, name='signup_page'),
    url(r'^signup/1$', views.signup_action, name='signup_action'),
    url(r'^logout/$', views.logout_action, name='logout_action'),
    url(r'^index/$', views.index, name='index'),
    url(r'^bookslist/$', views.bookslist,name='bookslist'),
    url(r'^record/$', views.record_page,name='record_page'),
    url(r'^record/delete(?P<record_id>[0-9]+)$', views.delete_waiting,name='delete_waiting'),
    url(r'^book/(?P<book_id>[0-9]+)$', views.book_page,name='book_page'),
    url(r'^record/borrow$', views.borrow_action,name='borrow_action'),
    url(r'^bookslist/search/$', views.search_action,name='search_action'),
    url(r'^info/$', views.info, name='info'),

]