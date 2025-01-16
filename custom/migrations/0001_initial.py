# Generated by Django 4.2.6 on 2024-11-25 14:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Categoria',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('categoria', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Pozisaun',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pozisaun', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Suco',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('suco', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Aldeia',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('aldeia', models.CharField(max_length=20)),
                ('suco', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='custom.suco')),
            ],
        ),
    ]
