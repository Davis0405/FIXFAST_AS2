# Generated by Django 5.0.7 on 2024-09-06 05:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0006_configuracioncorreo'),
    ]

    operations = [
        migrations.RenameField(
            model_name='configuracioncorreo',
            old_name='email_host_password',
            new_name='smtp_password',
        ),
    ]
