from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.http import HttpResponse
from classapp.models import User, Classroom, Student, Teacher, Assignment, Topic, Submission
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from helpers import random_str
from itertools import chain
from datetime import datetime
from django.template.defaultfilters import slugify
from django.urls import reverse
from django.utils import timezone
from datetime import datetime

# Create timezone-aware datetime object
now = timezone.now()

# Convert timezone-aware datetime object to UTC
now_utc = now.astimezone(timezone.utc)

# Create your views here.
def register(request):
    if request.method == 'POST':
        if request.POST.get('username') and request.POST.get('p_name') and request.POST.get('email') and request.POST.get('password'):
            u = User()
            u.username = request.POST.get('username')
            u.p_name = request.POST.get('p_name')
            u.email = request.POST.get('email')
            u.password = request.POST.get('password')
            if User.objects.filter(username=u.username).exists():
                messages.success(request, "Username already exists.")
                return redirect("/register")
            u.save()
            messages.success(request, "You are registered successfully")
            return redirect('/login')        
    
    else:
        return render(request, "register.html")
    
def login(request):
    if request.method == 'POST':
        try:
            Userdetails = User.objects.get(username=request.POST['username'],password=request.POST['password'])
            request.session['username'] = Userdetails.username
            return redirect('/home')
        except User.DoesNotExist as e:
            messages.info(request, "Email or password is invalid...")
            
    return render(request, 'login.html')

def logout(request):
    try:
        del request.session['username']
    except:
        return render(request, 'login.html')
    return render(request, 'register.html')

def create_class(request):
    if request.method == 'POST':
        class_name = request.POST.get('class_name')
        section = request.POST.get('section')
        room = request.POST.get('room')
        subject_name = request.POST.get('subject_name')
        join_code = random_str()
        current_username = request.session.get('username')
        current_user = User.objects.get(username=current_username)
        while Classroom.objects.filter(join_code=join_code).exists():
            join_code = random_str()
        classroom = Classroom.objects.create(owner=current_user, class_name=class_name, section=section, room=room, subject_name=subject_name, join_code=join_code)
        classroom.save()
        teacher = Teacher.objects.create(username=current_user, classroom=classroom)
        teacher.save()
        return redirect('/home')
    
    else:
        return render(request, 'create_class.html')

def view_class(request):
    current_username = request.session.get('username')
    current_user = User.objects.get(username=current_username)
    s = Student.objects.filter(username=current_user)
    t = Teacher.objects.filter(username=current_user)
    classrooms = list(chain(s, t))
    return render(request, 'home.html', {
        "classrooms": classrooms
    })

def join_class(request):
    try:
        join_code = request.POST.get('join_code')
        classroom = Classroom.objects.get(join_code=join_code)
        current_username = request.session.get('username')
        current_user = User.objects.get(username=current_username)
        student = Student.objects.create(username=current_user, classroom=classroom)
        student.save()
        return redirect('/home')
    except Classroom.DoesNotExist:
        return render(request, 'join_class.html', {'error_message': 'Invalid join code'})


def display_class(request, join_code):
    return render(request, "display_class.html", {
        "classroom" : Classroom.objects.get(join_code=join_code),
    })

def display_assignment(request, join_code):
    return render(request, "post_assignment.html", {
        "classroom" : Classroom.objects.get(join_code=join_code)
    })

def post_assignment(request, join_code):
    if request.method == 'POST':
        title = request.POST.get('title')
        description = request.POST.get('description')
        points = request.POST.get('points')
        date_time_obj = datetime.strptime(request.POST.get('due'), '%Y-%m-%dT%H:%M')
        current_classroom = Classroom.objects.get(join_code=join_code)
        slug = slugify(request.POST['title'])
        assignment = Assignment.objects.create(title=title, description=description,points=points, classroom=current_classroom, due=date_time_obj, slug=slug)
        assignment.save()
        for file in request.FILES.getlist('files'):
            topic = Topic.objects.create(assignment=assignment, files=file)
            topic.save()
        return redirect(reverse('display_class', args=[join_code]))
    
    else:
        return render(request, "post_assignment.html", {
            "classroom" : Classroom.objects.get(join_code=join_code)
        })
    
def view_assignments(request, join_code, submission_status=None):
    classroom = Classroom.objects.get(join_code=join_code)
    assignments = Assignment.objects.filter(classroom=classroom)
    role = ""
    current_username = request.session.get('username')
    current_user = User.objects.get(username=current_username)
    try:
        tc = Teacher.objects.get(classroom=classroom, username=current_user)
        role = "teacher"
    except Teacher.DoesNotExist:
        tc = Student.objects.get(classroom=classroom, username=current_user)
        role = "student"
    assignment_data = []
    submission = None
    for assignment in assignments:
        topics = Topic.objects.filter(assignment=assignment)
        topic_data = []
        for topic in topics:
            topic_data.append({
                "file_url": topic.files.url,
                "filename": topic.files.name,
            })
        submission = Submission.objects.filter(assignment=assignment, username=current_user)
        assignment_data.append({
            "assignment": assignment,
            "topics": topic_data,
            "submission" : submission
        })
        
    return render(request, "display_class.html", {
        "assignments": assignment_data,
        "classrooms": Classroom.objects.get(join_code=join_code),
        "role" : role,
        "submission": submission
    })

def view_assignment(request, join_code, id):
    classroom = Classroom.objects.get(join_code=join_code)
    assignment = Assignment.objects.get(classroom=classroom, id=id)
    role = ""
    current_username = request.session.get('username')
    current_user = User.objects.get(username=current_username)
    try:
        tc = Teacher.objects.get(classroom=classroom, username=current_user)
        role = "teacher"
    except Teacher.DoesNotExist:
        tc = Student.objects.get(classroom=classroom, username=current_user)
        role = "student"
    topics = Topic.objects.filter(assignment=assignment)
    submission = Submission.objects.filter(assignment=assignment, username=current_user)
    context = {
        "assignment": assignment,
        "classroom": Classroom.objects.get(join_code=join_code),
        "role": role,
        "topics": topics,
        "submission": submission,
    }
    return render(request, "view_assignment.html", context)

def classwork(request, join_code):
    classroom = Classroom.objects.get(join_code=join_code)
    assignments = Assignment.objects.filter(classroom=classroom)
    role = ""
    current_username = request.session.get('username')
    current_user = User.objects.get(username=current_username)
    try:
        tc = Teacher.objects.get(classroom=classroom, username=current_user)
        role = "teacher"
    except Teacher.DoesNotExist:
        tc = Student.objects.get(classroom=classroom, username=current_user)
        role = "student"
    assignment_data = []
    for assignment in assignments:
        topics = Topic.objects.filter(assignment=assignment)
        topic_data = []
        for topic in topics:
            topic_data.append({
                "file_url": topic.files.url,
                "filename": topic.files.name,
            })
        submission = Submission.objects.filter(assignment=assignment, username=current_user)
        assignment_data.append({
            "assignment": assignment,
            "topics": topic_data,
            "submission" : submission
        })
    return render(request, "classwork.html", {
        "assignments": assignment_data,
        "classrooms": Classroom.objects.get(join_code=join_code),
        "role" : role,
        "submission": submission
    })

def display_people(request, join_code):
    classroom = Classroom.objects.get(join_code=join_code)
    s = Student.objects.filter(classroom=classroom)
    t = Teacher.objects.filter(classroom=classroom)
    return render(request, "people.html", {
        "classroom" : classroom,
        "students" : s,
        "teachers" : t
    })

def submit_assignment(request, join_code, id):
    classroom = Classroom.objects.get(join_code=join_code)
    current_username = request.session.get('username')
    current_user = User.objects.get(username=current_username)
    assignment = Assignment.objects.get(id=id)
    if request.method == 'POST':
        file = request.FILES.get('file')
        submission_time = timezone.now()
        submission = Submission.objects.create(username=current_user, assignment=assignment, file=file, submission_time=submission_time)
        submission.save()
        if submission_time > assignment.due:
            submission_status = "Turned in"
        else:
            submission_status = "Done late"
        return redirect(reverse('display_class', args=[join_code]), submission_status=submission_status, submission_time=submission_time)
    
    else:
        return render(request, "submit_assignment.html", {
            "classroom" : Classroom.objects.get(join_code=join_code),
        })