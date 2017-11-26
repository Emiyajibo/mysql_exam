# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2017-11-26 11:26
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AddbyISBN',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='AddRecord_ID')),
                ('ISBN', models.CharField(default='', max_length=32)),
                ('Number', models.IntegerField(default=1)),
                ('Price', models.DecimalField(decimal_places=2, default=35.0, max_digits=4)),
                ('Position', models.CharField(default='A-101', max_length=8)),
            ],
        ),
        migrations.CreateModel(
            name='Book',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='Book_ID')),
                ('Available', models.BooleanField(default=1)),
                ('Title', models.CharField(default='', max_length=64)),
                ('Author', models.CharField(default='', max_length=32)),
                ('ISBN', models.CharField(default='', max_length=32)),
                ('Publisher', models.CharField(default='', max_length=32)),
                ('Pub_Time', models.DateField(null=True)),
                ('Pages', models.IntegerField(null=True)),
                ('Description', models.TextField(null=True)),
                ('Position', models.CharField(default='A-101', max_length=8)),
                ('Price', models.DecimalField(decimal_places=2, default=35, max_digits=4)),
            ],
        ),
        migrations.CreateModel(
            name='FineStatistic',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='Fine_ID')),
                ('Begin_time', models.DateField(blank=True, null=True)),
                ('End_time', models.DateField(blank=True, null=True)),
                ('TotalFine', models.DecimalField(decimal_places=2, default=0, max_digits=8, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Reader',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='Reader_ID')),
                ('Name', models.CharField(max_length=16, unique=True)),
                ('StudentCard', models.CharField(max_length=16, unique=True)),
                ('Password', models.CharField(max_length=16)),
                ('Active', models.BooleanField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Record',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='Record_ID')),
                ('Created_time', models.DateTimeField(auto_now_add=True)),
                ('Modified_time', models.DateTimeField(auto_now=True)),
                ('Fine', models.DecimalField(decimal_places=2, default=0, max_digits=4)),
                ('Status', models.CharField(choices=[('WAITFORCHECK', 'WAITFORCHECK'), ('BORROWED', 'BORROWED'), ('RETURNED', 'RETURNED'), ('TURNDOWN', 'TURNDOWN'), ('DEMAGE', 'DEMAGE')], default='WAITFORCHECK', max_length=16)),
                ('Book', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='The_Book', to='MyLMS.Book')),
                ('Reader', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='MyLMS.Reader')),
            ],
        ),
        migrations.AddField(
            model_name='finestatistic',
            name='Reader',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='MyLMS.Reader'),
        ),
    ]
