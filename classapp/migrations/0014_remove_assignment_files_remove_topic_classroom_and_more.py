# Generated by Django 4.1.5 on 2023-03-29 05:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('classapp', '0013_assignment_files'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='assignment',
            name='files',
        ),
        migrations.RemoveField(
            model_name='topic',
            name='classroom',
        ),
        migrations.RemoveField(
            model_name='topic',
            name='name',
        ),
        migrations.AddField(
            model_name='topic',
            name='assignment',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='classapp.assignment'),
        ),
        migrations.AddField(
            model_name='topic',
            name='files',
            field=models.FileField(default='empty.txt', upload_to='documents/'),
        ),
    ]