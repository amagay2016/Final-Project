# Generated by Django 4.2.6 on 2024-11-25 14:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('custom', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Staff',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=100)),
                ('email', models.EmailField(blank=True, max_length=100, null=True)),
                ('telefone', models.CharField(blank=True, max_length=100, null=True)),
                ('aldeia', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='custom.aldeia')),
                ('pozisaun', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='custom.pozisaun')),
            ],
        ),
    ]
