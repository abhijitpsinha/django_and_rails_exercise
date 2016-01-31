from __future__ import unicode_literals

from django.db import models

class Author(models.Model):
    first_name  = models.CharField(max_length=100)
    last_name   = models.CharField(max_length=100)

    def __str__(self):
        return self.first_name + ' ' + self.last_name

class Category(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Article(models.Model):
    title              = models.CharField(max_length=300)
    publication        = models.DateField('date published')
    body               = models.TextField
    hero_image_url     = models.CharField(max_length=300)
    optional_image_url = models.CharField(max_length=300)
    author             = models.ForeignKey(Author, on_delete=models.CASCADE)
    category           = models.ForeignKey(Category, on_delete=models.CASCADE)

    def __str__(self):
        return (self.title[:75] + '..') if len(self.title) > 75 else self.title