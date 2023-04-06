from django.db import models
from django.conf import settings

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=20, primary_key=True)
    p_name = models.CharField(max_length=20)
    email = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=20)

    class Meta:
        db_table = 'classapp_user'

    def __str__(self):
        return self.username

class Classroom(models.Model):
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    class_name = models.CharField(max_length=50)
    section = models.CharField(max_length=50, null=True)
    room = models.CharField(max_length=20)
    subject_name = models.TextField()
    join_code = models.CharField(max_length=7)

    class Meta:
        db_table = 'classapp_classroom'

class Teacher(models.Model):
    username = models.ForeignKey(User, on_delete=models.CASCADE)
    classroom = models.ForeignKey(Classroom, on_delete=models.CASCADE)

    class Meta:
        db_table = 'classapp_teacher'

class Student(models.Model):
    username = models.ForeignKey(User, on_delete=models.CASCADE)
    classroom = models.ForeignKey(Classroom, on_delete=models.CASCADE)

    class Meta:
        db_table = 'classapp_student'

class Assignment(models.Model):
    title = models.CharField(max_length=30)
    description = models.TextField()
    classroom = models.ForeignKey(Classroom, on_delete=models.CASCADE)
    points = models.IntegerField()
    assigned = models.DateField(auto_now=True)
    due = models.DateTimeField(null=True)
    slug = models.SlugField(null=True)

    class Meta:
        db_table = 'classapp_assignment'

class Topic(models.Model):
    assignment = models.ForeignKey(Assignment, on_delete=models.CASCADE, null=True)
    files = models.FileField(upload_to='media/', default='empty.txt')

    class Meta:
        db_table = 'classapp_topic'

class Submission(models.Model):
    username = models.ForeignKey(User, on_delete=models.CASCADE)
    assignment = models.ForeignKey(Assignment, on_delete=models.CASCADE)
    file = models.FileField(upload_to='submissions/', null=True)
    submission_time = models.DateTimeField(null=True)

    class Meta:
        db_table = 'classapp_submission'
