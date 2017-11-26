# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from models import Book,Reader,Record,FineStatistic,AddbyISBN
from datetime import datetime,date
from django.forms import TextInput, ModelForm
from suit.widgets import SuitDateWidget
from . import models
from django.db.models import Sum

import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import json
import urllib2

class RecordInline(admin.TabularInline):
    model = Record
    fk_name = "Reader"

class BooksAdmin(admin.ModelAdmin):
    #ModelAdmin.save_as¶
    save_as=True
    actions_on_top = True
    actions_on_bottom = False
    search_fields = ('Title', 'ISBN','id')
    list_filter = ('Pub_Time', 'Position', 'Available')
    list_display = ('id','Title','Author','ISBN','Publisher','Pages','Pub_Time','Price','Position','Available')
    #list_editable = ('ISBN',)
    list_display_links = ('Title',)

    def make_available(modeladmin, request, queryset):
        queryset.update(Available=True)
    make_available.short_description = "Mark selected Books as Available"
    def make_unavailable(modeladmin, request, queryset):
        queryset.update(Available=False)
    make_unavailable.short_description = "Mark selected Books as Unavailable"
    actions = [make_available,make_unavailable]

admin.site.register(Book,BooksAdmin)

class ReadersAdmin(admin.ModelAdmin):
    actions_on_top = True
    actions_on_bottom = False
    list_display = ('id','Name','StudentCard','Password','Active')
    search_fields = ('id', 'Name')
    list_filter = ('Active',)
    inlines = [
        RecordInline,
    ]
    def make_active(self, request, queryset):
        queryset.update(Active=True)
        self.message_user(request, "Mark selected Readers Active successfully. ")
    make_active.short_description = "Mark selected Readers as Active "
    def make_inactive(self, request, queryset):
        queryset.update(Active=False)
        self.message_user(request, "Mark selected Readers Inactive successfully. ")
    make_inactive.short_description = "Mark selected Readers as Inactive "
    actions = [make_active, make_inactive]

admin.site.register(Reader,ReadersAdmin)


class RecordsAdmin(admin.ModelAdmin):
    actions_on_top = True
    actions_on_bottom = False
    list_display = ('id','Reader','Book','Created_time','Modified_time','Status','Fine')
    list_display_links = ('id','Reader','Book','Status')
    search_fields = ('id', 'Reader__Name','Reader__id','Book__Title','Book__ISBN','Book__id')
    list_filter = ( 'Modified_time', 'Status','Book__Available')
    #list_editable  = ('Status',)
    fields = ( 'Reader','Book','Status',)

    def make_borrow(self, request, queryset):
        num = 0
        for record in queryset:
            if record.Status != 'BORROWED':
                b = record.Book
                if b.Available :
                    b.Available = False
                    b.save()
                    record.Status='BORROWED'
                    record.save()
                    num = num+1
                else:
                    record.Status = 'WAITFORCHECK'
                    record.save()
        self.message_user(request, "%s record(s) been Mark BORROWED and others remain ." % (num))
    make_borrow.short_description = "Mark BORROWED if book is Availible "

    def make_return(self, request, queryset):
        num = 0
        for record in queryset:
            if record.Status == 'BORROWED':
                b = record.Book
                b.Available = True
                b.save()
                nowtime = datetime.now()
                lasttime = datetime.strptime(str(record.Modified_time)[0:19],"%Y-%m-%d %H:%M:%S")
                fine = (nowtime - lasttime).days - 14
                if fine >0 :
                    if fine >record.Book.Price :
                        record.Fine = record.Book.Price
                    else :
                        record.Fine = fine

                record.Status = 'RETURNED'
                record.save()
                num = num+1
        self.message_user(request, "%s record(s) been Mark Return and Calculate the Fine." % (num))

    make_return.short_description = "Mark RETURNED if book is Borrowed"

    def make_turndown(modeladmin, request, queryset):
        queryset.filter(Status = 'WAITFORCHECK').update(Status = 'TURNDOWN')

    make_turndown.short_description = "TURNDOWN All the REQUEST"

    def make_demage(self, request, queryset):
        num = 0
        for record in queryset:
            if record.Status == 'BORROWED':
                record.Status = 'DEMAGE'
                record.Fine = record.Book.Price
                record.save()
                num = num+1

        self.message_user(request, "%s record(s) been Mark Demage and Calculate the Fine." % (num))

    make_demage.short_description = "Mark Demage and Calculate the Fine if book is Borrowed "

    actions = [make_borrow,make_return,make_turndown,make_demage]

    def suit_row_attributes(self, obj):
        class_map = {
            'TURNDOWN': 'black',
            'BORROWED': 'warning',
            'WAITFORCHECK': 'info',
            'RETURNED': 'success',
            'DEMAGE':'error'
        }
        css_class = class_map.get(obj.Status)
        if css_class:
            return {'class': css_class}

admin.site.register(Record,RecordsAdmin)

class FineStatisticsForm(ModelForm):
    class Meta:
        widgets = {
            'Reader': TextInput(attrs={'class': 'input-medium'}),
            'Begin_time': SuitDateWidget,
            'End_time': SuitDateWidget,
        }



class FineStatisticsAdmin(admin.ModelAdmin):
    actions_on_top = True
    actions_on_bottom = False
    list_display = ('id','Begin_time','End_time','Reader','TotalFine')
    #list_editable = ('Begin_time','End_time','Reader')
    form = FineStatisticsForm
    def make_totalfine(self, request, queryset):
        num = 0
        for fine in queryset:
            num = num+1
            btime = date(2000, 1, 1)
            etime = date(2050, 12, 31)
            record = models.Record.objects.all()
            if fine.Reader:
                record = record.filter(Reader=fine.Reader)

            if fine.Begin_time:
                btime = str(fine.Begin_time)[0:10]
            if fine.End_time:
                etime = str(fine.End_time)[0:10]
            record = record.filter(Modified_time__range=[btime, etime])
            t =  record.aggregate(Sum('Fine'))['Fine__sum']
            if  t :
                fine.Totalfine = t
            else:
                fine.Totalfine = 0
            fine.save()
        self.message_user(request, "%s Fine statistics' TotalFine successfully been calculater/updates." % (num))

    make_totalfine.short_description = "update the totalfine"
    actions = [make_totalfine]

admin.site.register(FineStatistic,FineStatisticsAdmin)


class AddbyISBNsAdmin(admin.ModelAdmin):

    save_as = True
    actions_on_top = True
    actions_on_bottom = False
    list_display = ('id','ISBN','Price','Position','Number')
    list_editable = ('ISBN','Price','Position','Number')
    def make_AddbyISBN(self, request, queryset):
        for adds in queryset:
            html = urllib2.urlopen(r'https://api.douban.com/v2/book/isbn/' + adds.ISBN)  # 连接字符串组成JSON请求
            hjson = json.loads(html.read())
            num = int(adds.Number)
            pubdate = hjson['pubdate'].split('-')
            pub_year,pub_month,pub_day = [2000,1,1]
            if pubdate[0]:
                pub_year = pubdate[0]
            if pubdate[1]:
                pub_month = pubdate[1]
            if len(pubdate)>2:
                pub_day = pubdate[2]
            print date(int(pub_year), int(pub_month), int(pub_day))
            print num
            print hjson['author']
            for i in range(num):
                book = Book(Title = hjson['title'],Author = hjson['author'][0],ISBN=adds.ISBN,Publisher = hjson['publisher'],
                            Pub_Time =date(int(pub_year), int(pub_month), int(pub_day)),Pages = hjson['pages'],
                            Description=hjson['summary']+"\n"+hjson['author_intro'],Position = adds.Position,Price = adds.Price)
                book.save()
            self.message_user(request, "%s copy(ies) of 《%s》 successfully add to the Book List." % (num, hjson['title']) )


    make_AddbyISBN.short_description = "AddbyISBN"
    actions = [make_AddbyISBN]


admin.site.register(AddbyISBN,AddbyISBNsAdmin)






