from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from john_srpasiente.decorators import allowed_users
from django.contrib import messages
from .models import FichaFamilia, Pasiente, Registo, Staff, Diagnosaun
from .forms import FichaFamiliaForm, PasienteForm, RegistoForm, DiagnosaunForm

@login_required
@allowed_users(['admin', 'staff'])
def ficha_list(request):
    fichas = FichaFamilia.objects.all().order_by('-no_ficha')
    context = {
        'title': 'Lista Ficha Familia',
        'fichas': fichas
    }
    return render(request, 'registo/ficha_list.html', context)

@login_required
@allowed_users(['admin', 'staff'])
def ficha_create(request):
    if request.method == 'POST':
        form = FichaFamiliaForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Aumenta Ficha Familia ho sucesso')
            return redirect('ficha-list')
    else:
        form = FichaFamiliaForm()
    context = {
        'title': 'Create Ficha Familia',
        'form': form
    }
    return render(request, 'registo/ficha_form.html', context)

@login_required
@allowed_users(['admin', 'staff'])
def ficha_update(request, pk):
    ficha = FichaFamilia.objects.get(no_ficha=pk)
    if request.method == 'POST':
        form = FichaFamiliaForm(request.POST, instance=ficha)
        if form.is_valid():
            form.save()
            messages.success(request, 'Altera Ficha Familia ho sucesso')
            return redirect('ficha-list')
    else:
        form = FichaFamiliaForm(instance=ficha)
    context = {
        'title': 'Update Ficha Familia',
        'form': form
    }
    return render(request, 'registo/ficha_form.html', context)

@login_required
@allowed_users(['admin', 'staff'])
def ficha_detail(request, pk, pasiente_id=None):
    ficha = FichaFamilia.objects.get(no_ficha=pk)
    pasientes = Pasiente.objects.filter(ficha_familia=ficha).prefetch_related('registo_set')
    registo_form = RegistoForm()
    
    registered_patients = Registo.objects.filter(
        pasiente__in=pasientes,
        status__in=['Pendente', 'Konsulta Hela']
    ).values_list('pasiente_id', flat=True)
    
    if request.method == 'POST':
        if 'registo' in request.POST:
            registo_form = RegistoForm(request.POST)
            if registo_form.is_valid():
                registo = registo_form.save(commit=False)
                registo.pasiente_id = request.POST.get('pasiente_id')
                registo.save()
                messages.success(request, 'Registo aumenta ho susesu')
                return redirect('ficha-detail', pk=pk)
        elif pasiente_id:
            pasiente = Pasiente.objects.get(id=pasiente_id)
            form = PasienteForm(request.POST, instance=pasiente)
            if form.is_valid():
                form.save()
                messages.success(request, 'Altera Pasiente ho sucesso')
                return redirect('ficha-detail', pk=pk)
        else:
            form = PasienteForm(request.POST)
            if form.is_valid():
                pasiente = form.save(commit=False)
                pasiente.ficha_familia = ficha
                pasiente.save()
                messages.success(request, 'Aumenta Pasiente ho sucesso')
                return redirect('ficha-detail', pk=pk)
    else:
        if pasiente_id:
            pasiente = Pasiente.objects.get(id=pasiente_id)
            form = PasienteForm(instance=pasiente)
        else:
            form = PasienteForm()

    context = {
        'title': f'Ficha Familia: {ficha.no_ficha}',
        'ficha': ficha,
        'pasientes': pasientes,
        'form': form,
        'editing_pasiente': pasiente_id,
        'registo_form': registo_form,
        'registered_patients': registered_patients
    }
    return render(request, 'registo/ficha_detail.html', context)

@login_required
@allowed_users(['admin', 'staff'])
def pasiente_delete(request, pk):
    pasiente = Pasiente.objects.get(id=pk)
    ficha = pasiente.ficha_familia
    if request.method == 'POST':
        pasiente.delete()
        messages.error(request, 'Pasiente delete ho susesu')
        return redirect('ficha-detail', pk=ficha.no_ficha)
    context = {
        'title': 'Delete Pasiente',
        'pasiente': pasiente,
        'ficha': ficha
    }
    return render(request, 'registo/pasiente_delete.html', context)

@login_required
@allowed_users(['admin', 'doutor'])
def my_patients(request):
    staff = Staff.objects.get(user=request.user)
    registrations = Registo.objects.filter(
        doctor=staff,
        status__in=['Pendente', 'Konsulta Hela']
    ).order_by('data_registo')
    
    diagnoses = Diagnosaun.objects.filter(diagnose_by=staff).order_by('-data_diagnosaun')
    
    context = {
        'title': f'Pasiente Pendente Doutor {staff.nome}',
        'registrations': registrations,
        'diagnoses': diagnoses,
    }
    return render(request, 'registo/my_patients.html', context)

@login_required
@allowed_users(['admin', 'doutor'])
def diagnose_patient(request, pk):
    registo = Registo.objects.get(id=pk)
    staff = Staff.objects.get(user=request.user)
    
    if registo.doctor != staff:
        messages.error(request, 'Ita boot la iha permisaun atu diagnose pasiente ne')
        return redirect('my-patients')
        
    if request.method == 'POST':
        form = DiagnosaunForm(request.POST)
        if form.is_valid():
            diagnosaun = form.save(commit=False)
            diagnosaun.registo = registo
            diagnosaun.diagnose_by = staff
            diagnosaun.save()
            
            # Update registo status
            registo.status = 'Konsulta Hotu ona'
            registo.save()
            
            messages.success(request, 'Diagnosaun aumenta ho susesu')
            return redirect('my-patients')
    else:
        form = DiagnosaunForm()
    
    context = {
        'title': f'Diagnose Pasiente: {registo.pasiente.nome}',
        'registo': registo,
        'form': form
    }
    return render(request, 'registo/diagnose_form.html', context)

@login_required
@allowed_users(['admin', 'doutor'])
def update_consultation_status(request, pk):
    registo = Registo.objects.get(id=pk)
    staff = Staff.objects.get(user=request.user)
    
    if registo.doctor != staff:
        messages.error(request, 'Ita boot la iha permisaun atu altera status pasiente ne')
        return redirect('my-patients')
    
    registo.status = 'Konsulta Hela'
    registo.save()
    messages.success(request, 'Status pasiente altera ho susesu')
    return redirect('my-patients')

@login_required
@allowed_users(['admin', 'staff', 'doutor'])
def patient_history(request, pk):
    pasiente = Pasiente.objects.get(id=pk)
    diagnoses = Diagnosaun.objects.filter(
        registo__pasiente=pasiente
    ).order_by('-data_diagnosaun')
    
    context = {
        'title': f'Istoria Diagnosa {pasiente.nome}',
        'pasiente': pasiente,
        'diagnoses': diagnoses
    }
    return render(request, 'registo/patient_history.html', context)
