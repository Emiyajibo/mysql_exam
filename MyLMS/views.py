# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render
from django.core.paginator import Paginator
from django.core.paginator import EmptyPage
from django.core.paginator import PageNotAnInteger
from . import models
from django.db.models import Q, Count, Sum



# login


def login_page(request):

    return render(request,'login.html',{'line': 'Please input your readername and your password!'})


# login_action


def login_action(request):

    namefield = request.POST.get('namefield', None)
    pwdfield = request.POST.get('pwdfield', None)
    if namefield:
        if pwdfield:
            reader = models.Reader.objects.filter(Name=namefield, Password=pwdfield).first()
            if reader :
                request.session['reader_id'] = reader.id
                request.session.set_expiry(600)
                request.session['reader_name'] = reader.Name
                books = models.Book.objects.all()
                if reader.Active :
                    return index(request)
                else:
                    return render(request, 'login.html',{'line': 'Please Active your account First!'})
    return render(request, 'login.html', {'line': 'Login failure!Please checkout your readername and your password!'})

# register


def signup_page(request):
    return render(request,'signup.html',{'line': 'Please input your readername and your password!'})


# register_action


def signup_action(request):
    namefield = request.POST.get('namefield', None)
    pwdfield = request.POST.get('pwdfield', None)
    scfield = request.POST.get('scfield', None)
    if namefield :
        r = models.Reader.objects.filter(Name=namefield).first()
        if r:
            return render(request, 'signup.html',
                          {'line': 'Signup failure!Readername has been used!'})
        if scfield:
            r = models.Reader.objects.filter(Name=namefield).first()
            if r:
                return render(request, 'signup.html',
                              {'line': 'Signup failure!StudentCard has been used!'})
        if pwdfield:
            r = models.Reader(Name=namefield, Password = pwdfield,StudentCard = scfield)
            r.save()
            return render(request, 'login.html', {'line': 'Signup Success!'})
    return render(request, 'signup.html', {'line': 'Signup failure!Please checkout your readername and your password!'})

# login_out


def logout_action(request):
    try:
        del request.session['reader_id']
    except KeyError:
        pass
    return render(request, 'login.html', {'line': 'You have logged out!'})


# user_page


def index(request):
    if "reader_id" not in request.session:
        return render(request, 'login.html', {'line': 'Please login first!'})

    #read info
    reader = models.Reader.objects.get(pk=request.session["reader_id"])

    #user can borrow book num
    borrow_num = models.Record.objects.filter(Reader=request.session["reader_id"]).filter(Q(Status='BORROWED') | Q(Status='WAITFORCHECK'))
    can_num = 2 - borrow_num.count()

    # add the latest 7 books
    Newbooks = models.Book.objects.all().order_by('-id')[0:7]

    # borrow record
    records = models.Record.objects.filter(Reader=request.session["reader_id"]).values_list('Status').annotate(Count('id'))
    BORROWED = 0
    WAITFORCHECK = 0
    TURNDOWN = 0
    DEMAGE = 0
    RETURNED = 0
    for item in records:
        if item[0] == 'BORROWED':
            BORROWED = item[1]
        if item[0] == 'WAITFORCHECK':
            WAITFORCHECK=item[1]
        if item[0] == 'RETURNED':
            RETURNED = item[1]

    return render(request,'index.html',{'reader':reader,'can_num':can_num,'Newbooks':Newbooks})


# booklist


def bookslist(request):
    if "reader_id" in request.session:
        books = models.Book.objects.all()
        booksall = books.count()
        limit = 13  # record's num perpage
        paginator = Paginator(books, limit)  # object page
        page = request.GET.get('page')  # get page
        try:
            books = paginator.page(page)  # get record perpage
        except PageNotAnInteger:  # if integer
            books = paginator.page(1)  # get page1
        except EmptyPage:  # if empty
            books = paginator.page(paginator.num_pages)
        reader = models.Reader.objects.get(pk=request.session["reader_id"])
        return render(request, 'bookslist.html', {'books': books,'booksall': booksall, 'reader' : reader})
    else:
        return render(request, 'login.html', {'line': 'Please login first!'})


# borrow record


def record_page(request):
    if "reader_id" not in request.session:
        return render(request, 'login.html', {'line': 'Please login first!'})
    records = models.Record.objects.filter(Reader=request.session["reader_id"]).order_by('-Created_time')
    recordsall = records.count()
    limit = 13  # record perpage
    paginator = Paginator(records, limit)
    page = request.GET.get('page')
    try:
        records = paginator.page(page)
    except PageNotAnInteger:
        records = paginator.page(1)
    except EmptyPage:
        records = paginator.page(paginator.num_pages)
    return render(request, 'record_page.html', {'records': records,'recordsall': recordsall,'line':"(●'◡'●) Your Borrow Record As Follow :" })


# user


def delete_waiting(request,record_id):
    models.Record.objects.filter(pk=record_id).delete()
    records = models.Record.objects.filter(Reader=request.session["reader_id"])
    recordsall = records.count()
    return render(request, 'record_page.html', {'records': records,'recordsall': recordsall,'line':"(●'◡'●) Delete the borrow request sucessfully:" })




def book_page(request,book_id):
    if "reader_id" not in request.session:
        return render(request, 'login.html', {'line': 'Please login first!'})
    book = models.Book.objects.get(pk=book_id)
    return render(request,'book_page.html',{'book':book})




def borrow_action(request):

    if "reader_id" not in request.session:
        return render(request, 'login.html', {'line': 'Please login first!'})
    Bookid = request.POST.get('book_id', None)
    book = models.Book.objects.get(pk=Bookid)
    # limit 2 books one time
    records = models.Record.objects.filter(Reader=request.session["reader_id"]).filter(Q(Status='BORROWED')|Q(Status='WAITFORCHECK'))
    if records.count() > 1:
        return render(request, 'book_page.html',
                      {'book': book, 'line': "You have already borrowed or tried to borrow Two book!"})
    # limit borrow the same book
    BookISBN = request.POST.get('book_ISBN', None)
    for record in records:
        if BookISBN == record.Book.ISBN:
            return render(request, 'book_page.html', {'book': book,'line':"You have borrowed or tried to borrow this book!"})

    book = models.Book.objects.get(pk=Bookid)
    reader = models.Reader.objects.get(pk=request.session["reader_id"])
    if book :
        r = models.Record(Book=book, Reader=reader)
        r.save()
    records = models.Record.objects.filter(Reader=request.session["reader_id"])
    return render(request, 'record_page.html', {'records': records , 'line':"(●'◡'●) Now you can bring the book and find Libarian to check out:"})




def search_action(request):

    if "reader_id" in request.session:
        seach_info = request.POST.get('title', None)
        if seach_info:
            books = models.Book.objects.filter(Q(Title__icontains=seach_info)|Q(Author__icontains=seach_info)|Q(ISBN__icontains=seach_info)|Q(Position__icontains=seach_info))

        else:
            books = models.Book.objects.all()
        booksall = books.count()
        limit = 13
        paginator = Paginator(books, limit)
        page = request.GET.get('page')
        try:
            books = paginator.page(page)
        except PageNotAnInteger:
            books = paginator.page(1)
        except EmptyPage:
            books = paginator.page(paginator.num_pages)
        reader = models.Reader.objects.get(pk=request.session["reader_id"])
        return render(request, 'bookslist.html', {'books': books,'booksall': booksall, 'reader' : reader})
    else:
        return render(request, 'login.html', {'line': 'Please login first!'})


def info(request):
    if "reader_id" not in request.session:
        return render(request, 'login.html', {'line': 'Please login first!'})
    reader = models.Reader.objects.get(pk=request.session["reader_id"])
    return render(request,'settings.html',{'reader':reader})
    pass

