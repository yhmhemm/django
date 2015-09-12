# Create your views here.
from django.shortcuts import render_to_response
'''
def index(req):
    t = loader.get_template('index.html')
    c = Context({})
    
    return HttpResponse(t.render(c))
'''

class Person(object):
    def __init__(self,name,age,sex):
        self.name = name
        self.age = age
        self.sex = sex
        
    def say(self):
        return "I'm" +' ' + self.name
        
def index(reg):
    user = {'name' : 'hu','age':23,'sex':'male'}
    #user = Person('tom',23,'male')
    book_list = ['python','java','php','web']
    
    return render_to_response('index.html',{'title':'my page','user':user,'book_list':book_list})

