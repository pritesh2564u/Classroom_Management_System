# Generated by Django 4.1.5 on 2023-03-03 06:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('classapp', '0009_alter_classroom_owner'),
    ]

    operations = [
        migrations.AlterField(
            model_name='classroom',
            name='owner',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='classapp.user'),
        ),
    ]