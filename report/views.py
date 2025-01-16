from django.shortcuts import render
from django.db.models import Count
from registo.models import Pasiente
from .forms import DateRangeForm

def report_dashboard(request):
    # Count patients by gender
    gender_counts = Pasiente.objects.values('sexo').annotate(count=Count('id'))

    # Count patients by profession
    profession_counts = Pasiente.objects.values('profisaun__profisaun').annotate(count=Count('id'))

    # Prepare data for Chart.js
    gender_labels = [entry['sexo'] for entry in gender_counts]
    gender_data = [entry['count'] for entry in gender_counts]

    profession_labels = [entry['profisaun__profisaun'] for entry in profession_counts]
    profession_data = [entry['count'] for entry in profession_counts]

    # Handle date range filtering
    date_form = DateRangeForm(request.GET or None)
    patients = Pasiente.objects.all()
    if date_form.is_valid():
        start_date = date_form.cleaned_data.get('start_date')
        end_date = date_form.cleaned_data.get('end_date')
        if start_date:
            patients = patients.filter(registo__data_registo__gte=start_date)
        if end_date:
            patients = patients.filter(registo__data_registo__lte=end_date)

    context = {
        'title': 'Dashboard Relatoriu',
        'gender_labels': gender_labels,
        'gender_data': gender_data,
        'profession_labels': profession_labels,
        'profession_data': profession_data,
        'date_form': date_form,
        'patients': patients,
    }
    return render(request, 'report/report_dashboard.html', context)
