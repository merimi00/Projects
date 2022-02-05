#Python Requests Tutorial: Request Web Pages, Download Images, POST Data, Read JSON, and More
#https://www.youtube.com/watch?v=tb8gHvYlCFs

import requests

r = requests.get('https://xkcd.com/200/')
'''
print(r)
print(dir(r))
print(help(r))
print(r.content)
'''


t = requests.get('https://imgs.xkcd.com/comics/bill_nye.png')
with open('comic.png', 'wb') as f:
    f.write(t.content)

#print(t.status_code)
#print(r.headers)

payload = {'page': 2, 'count': 25}
payload2 = {'username': 'corey', 'password': 'testing'}
u = requests.get('http://httpbin.org/get', params=payload)
#u = requests.get('http://httpbin.org/post', data= payload2)
dict = u.json
#print(u.text, u.url, 
#rint(dict)


'''authentification test'''
v = requests.get('http://httpbin.org/basic-auth/merimi/test', auth=('merimi','test'))
#print(v.text)

'''timeout'''
w = requests.get('http://httpbin.org/delay/2', timeout=3)
#print(w)


#Python Tutorial: OS Module - Use Underlying Operating System Functionality
#https://www.youtube.com/watch?v=tJxcKyFMTGo

import os
from datetime import datetime
#print(dir(os))
'''
print(os.getcwd())
os.chdir('/Users/famer/Dekstop')
print(os.getcwd())
'''
#os.mkdir('test')
#os.rmdir('test')
#print(os.listdir())


#os.rename('test.py', 'tutoRequest&Os.py')

'''
mod_time = os.stat('test.py').st_mtime
print(datetime.fromtimestamp(mod_time))
'''


'''
for dirpath, dirnames, filenames in os.walk(os.getcwd()):
    print(dirpath, dirnames, filenames)
'''

print(os.environ.get('HOME'))

print(os.path.isfile('/t/E'), dir(os.path))


