# Create your views here.
from blog.models import Employee
from django.shortcuts import render_to_response

def index(req):
    emps = Employee.objects.all()
    return render_to_response('index.html',{'emps':emps})
