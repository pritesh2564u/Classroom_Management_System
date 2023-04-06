from django.urls import path
from django.urls.resolvers import URLPattern
from django.conf import settings
from django.conf.urls.static import static

from . import views

urlpatterns=[
    path('register', views.register, name='register.html'),
    path('login', views.login, name='login.html'),
    path('logout', views.logout, name='logout'),
    path('home', views.view_class, name='/home.html'),
    path('create_class', views.create_class, name='/create_class'),
    path('join_class', views.join_class, name='/join_class'),
    path('<join_code>/display_class', views.view_assignments),
    path('<join_code>/display_class/classwork', views.classwork),
    path('<join_code>/display_class/people', views.display_people),
    path('<join_code>/display_class/post_assignment', views.post_assignment, name='/post_assignment'),
    path('<join_code>/display_class/<id>/submit_assignment', views.submit_assignment, name='submit_assignment.html'),
    path('<join_code>/display_class/<id>', views.view_assignment),
    path('<join_code>/display_class', views.display_class, name="display_class"),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)