from django.http import HttpResponse
from django.template import loader
from django.http import get_object_or_404, render

from .models import Article

def index(request):
    article_list = Article.objects.order_by('-publication')[:3]
    context = { 'article_list': article_list }
    return render(request, 'blog/index.html', context)

def detail(request, article_id):
    article = get_object_or_404(Article, pk=article_id)
    return render(request, 'blog/detail.html', {'article': article})