from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from datetime import datetime
from registo.models import Pasiente, Registo
from staff.models import Staff

@login_required
def dashboard(request):
    today = datetime.now().date()
    
    context = {
        'title': 'Dashboard | Sistema Rejistrasaun Pasiente',
        'total_patients': Pasiente.objects.count(),
        'pending_consultations': Registo.objects.filter(status='Pendente').count(),
        'total_consultations': Registo.objects.count(),
        'total_doctors': Staff.objects.filter(pozisaun=1).count(),
        'today_consultations': Registo.objects.filter(
            data_registo=today,
            status__in=['Pendente', 'Konsulta Hela']
        ).select_related('pasiente', 'doctor')
    }
    return render(request, 'dashboard.html', context)