from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from john_srpasiente.decorators import allowed_users
from .models import Staff
from .forms import StaffForm, UserProfileForm
from django.contrib.auth.models import User, Group
from django.contrib import messages

@login_required
@allowed_users(['admin'])
def staff_list(request):
    staffs = Staff.objects.all()
    password_status = {}
    for staff in staffs:
        if staff.user:
            password_status[staff.id] = staff.user.check_password('password_123')
    
    context = {
        'title': 'Lista Staff',
        'staffs': staffs,
        'password_status': password_status
    }
    return render(request, 'staff_list.html', context)

@login_required
@allowed_users(['admin'])
def staff_create(request):
    if request.method == 'POST':
        form = StaffForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('staff-list')
    else:
        form = StaffForm()
    context = {
        'title': 'Aumenta Staff',
        'form': form
    }
    return render(request, 'staff_form.html', context)

@login_required
@allowed_users(['admin'])
def staff_update(request, pk):
    staff = Staff.objects.get(id=pk)
    if request.method == 'POST':
        form = StaffForm(request.POST, request.FILES, instance=staff)
        if form.is_valid():
            form.save()
            messages.success(request, 'Staff Altera ho susesu')
            return redirect('staff-list')
    else:
        form = StaffForm(instance=staff)
    context = {
        'title': 'Atualiza Staff',
        'form': form
    }
    return render(request, 'staff_form.html', context)

@login_required
@allowed_users(['admin'])
def staff_delete(request, pk):
    staff = Staff.objects.get(id=pk)
    if request.method == 'POST':
        if staff.user:
            staff.user.delete()
        staff.delete()
        return redirect('staff-list')
    context = {
        'title': 'Hamoos Staff',
        'staff': staff
    }
    return render(request, 'staff_delete.html', context)

@login_required
@allowed_users(['admin'])
def staff_create_user(request, pk):
    staff = Staff.objects.get(id=pk)
    if not staff.user:
        if staff.pozisaun.pozisaun.lower() == 'doutor':
            group_name = 'doutor'
        elif staff.pozisaun.pozisaun.lower() == 'diretor':
            group_name = 'diretor'
        else:
            group_name = 'staff'
        latest_user = User.objects.filter(username__regex=f'^{group_name}[0-9]{{2}}$').order_by('-username').first()
        
        if latest_user:
            current_num = int(latest_user.username[-2:])
            new_num = current_num + 1
        else:
            new_num = 1
        username = f"{group_name}{new_num:02d}"
        
        user = User.objects.create_user(
            username=username,
            password='password_123'
        )
        
        user.groups.add(Group.objects.get(name=group_name))
        staff.user = user
        staff.save()
        messages.success(request, f'User account created for {staff.nome} with username: {username}')
    else:
        messages.error(request, 'User account already exists')
    return redirect('staff-list')

@login_required
@allowed_users(['admin'])
def staff_reset_password(request, pk):
    staff = Staff.objects.get(id=pk)
    if staff.user and not staff.user.check_password('password_123'):
        staff.user.set_password('password_123')
        staff.user.save()
        messages.success(request, f'Password reset for {staff.nome} to default password')
    else:
        messages.error(request, 'Password reset not needed or user account does not exist')
    return redirect('staff-list')

@login_required
def user_profile(request):
    if request.method == 'POST':
        user_form = UserProfileForm(request.POST, instance=request.user)
        staff_form = StaffForm(request.POST, request.FILES, instance=request.user.staff)
        
        if user_form.is_valid() and staff_form.is_valid():
            user = user_form.save()
            if user_form.cleaned_data.get('password'):
                user.set_password(user_form.cleaned_data['password'])
                user.save()
            staff_form.save()
            messages.success(request, 'Profile updated successfully')
            return redirect('user-profile')
    else:
        user_form = UserProfileForm(instance=request.user)
        staff_form = StaffForm(instance=request.user.staff)
    
    context = {
        'title': 'My Profile',
        'user_form': user_form,
        'staff_form': staff_form
    }
    return render(request, 'user_profile.html', context)