from django.contrib import admin

# Register your models here.
from .models import *
admin.site.register(User)
admin.site.register(Classroom)
admin.site.register(Teacher)
admin.site.register(Student)
admin.site.register(Assignment)
admin.site.register(Topic)
admin.site.register(Submission)