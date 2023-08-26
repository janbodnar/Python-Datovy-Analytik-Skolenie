# Creating web requests 

## The httpx module

HTTPX is an HTTP client for Python 3, which provides sync and async APIs, and support for  
both HTTP/1.1 and HTTP/2. It has similar API to the popular Python requests library.  
HTTPX requires Python 3.6+.

$ pip install httpx

We install the module with the pip command.

The httpx supports asynchronous web requests. With the combination of httpx and asyncio  
modules and async and await keywords, we can generate asynchronous web requests.  
This may lead to considerable increase of efficiency in our programs.

## HTTP

The Hypertext Transfer Protocol (HTTP) is an application protocol for distributed, collaborative,  
hypermedia information systems. HTTP is the foundation of data communication for the World Wide Web.

## Status code 

```python
#!/usr/bin/python

import httpx 

r = httpx.head('http://webcode.me')
print(r.status_code)
```

## Get request 

```python
#!/usr/bin/python

import httpx 

r = httpx.get('http://webcode.me')
print(r.text)
```

## Query params 

```python
#!/usr/bin/python

import httpx 

payload = {'name': 'John Doe', 'occupation': 'gardener'}
r = httpx.get('https://httpbin.org/get', params = payload)
print(r.text)
```
