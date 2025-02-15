# Generated by Django 4.2.6 on 2024-11-26 02:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('custom', '0002_profisaun'),
        ('staff', '0004_staff_espesializasaun'),
    ]

    operations = [
        migrations.CreateModel(
            name='FichaFamilia',
            fields=[
                ('no_ficha', models.CharField(max_length=5, primary_key=True, serialize=False, unique=True)),
                ('chefe_familia', models.CharField(max_length=100)),
                ('aldeia', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='custom.aldeia')),
            ],
        ),
        migrations.CreateModel(
            name='Pasiente',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=100)),
                ('sexo', models.CharField(choices=[('Mane', 'Mane'), ('Feto', 'Feto')], max_length=10)),
                ('hela_fatin', models.CharField(blank=True, max_length=20, null=True)),
                ('ficha_familia', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='registo.fichafamilia')),
                ('profisaun', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='custom.profisaun')),
            ],
        ),
        migrations.CreateModel(
            name='Registo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('data_registo', models.DateField(auto_now_add=True)),
                ('categoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='custom.categoria')),
                ('pasiente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='registo.pasiente')),
            ],
        ),
        migrations.CreateModel(
            name='Diagnosaun',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('data_diagnosaun', models.DateField(auto_now_add=True)),
                ('diagnosaun', models.TextField()),
                ('diagnose_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='staff.staff')),
                ('registo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='registo.registo')),
            ],
        ),
    ]
