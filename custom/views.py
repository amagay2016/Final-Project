from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from john_srpasiente.decorators import allowed_users
from .models import Categoria
from .forms import CategoriaForm

@login_required
@allowed_users(['admin'])
def categoria_list(request):
    categorias = Categoria.objects.all()
    context = {
        'title': 'Lista Categorias',
        'categorias': categorias
    }
    return render(request, 'categoria_list.html', context)

@login_required
@allowed_users(['admin'])
def categoria_create(request):
    if request.method == 'POST':
        form = CategoriaForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('categoria-list')
    else:
        form = CategoriaForm()
    context = {
        'title': 'Aumenta Categoria',
        'form': form
    }
    return render(request, 'categoria_form.html', context)

@login_required
@allowed_users(['admin'])
def categoria_update(request, pk):
    categoria = Categoria.objects.get(id=pk)
    if request.method == 'POST':
        form = CategoriaForm(request.POST, instance=categoria)
        if form.is_valid():
            form.save()
            return redirect('categoria-list')
    else:
        form = CategoriaForm(instance=categoria)
    context = {
        'title': 'Atualiza Categoria',
        'form': form
    }
    return render(request, 'categoria_form.html', context)

@login_required
@allowed_users(['admin'])
def categoria_delete(request, pk):
    categoria = Categoria.objects.get(id=pk)
    if request.method == 'POST':
        categoria.delete()
        return redirect('categoria-list')
    context = {
        'title': 'Hamoos Categoria',
        'categoria': categoria
    }
    return render(request, 'categoria_delete.html', context)
