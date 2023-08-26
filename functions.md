# Functions

A function is a mapping of zero or more input parameters to zero or more output parameters.

The advantages of using functions are:

- code organization
- reducing duplication of code
- decomposing complex problems into simpler pieces
- improving clarity of the code
- reuse of code
- information hiding

Functions in Python are first-class citizens. It means that functions have equal  
status with other objects in Python. Functions can be assigned to variables, stored  
in collections, or passed as arguments. This brings additional flexibility to the language.  

[Function definition](#function-definition)  
[Kinds of functions](#kinds-of-functions)  
[Third-party functions](#third-party-functions)  
[Instance, class, plain, inner functions](#instance-class)    
[Function definition](#function-definition)  
[Function definition](#function-definition)  
[Function definition](#function-definition)  
[Function definition](#function-definition)  
[Function definition](#function-definition)  
[Function definition](#function-definition)  

## Function definition

Functions are defined with the `def` keyword.  

```python
#!/usr/bin/python

# fahrenheit.py

def C2F(c):
    return c * 9/5 + 32

print(C2F(100))
print(C2F(0))
print(C2F(30))
```

## Kinds of functions

- built-in readily available
- standard in modules
- custom

```python
#!/usr/bin/python

# three_kinds.py

from math import sqrt

def cube(x):
    return x * x * x    
    
print(abs(-1))
print(cube(9))
print(sqrt(81))
```

## Third-party functions

Third-party functions defined in external modules.  
For instance, the `numpy` module.  

    $ pip install numpy


```python
#!/usr/bin/python

import numpy as np

# generate 10 random integers from 1 to 100
r_vals = np.random.randint(1, 100, 10)
print(r_vals)

# generate 1 random integer from 1 to 10
r_vals2 = np.random.randint(1, 10)
print(r_vals2)

# generate an array of random integers
r_vals3 = np.random.randint(5, size=(2, 4))
print(r_vals3)
```

## Instance, class, plain, inner functions

Functions defined inside classes are member functions. They are  
often called methods.  

```python
#!/usr/bin/python

class Info:

    def say(self):
        print('This is Info class')

class Some:

    @staticmethod
    def f():
        print ("f() static method")

def f():
    print ("f() plain function")

def g():
    def f():
        print ("f() inner function")
    f()


i = Info()
i.say()

Some.f()
f()
g()
```

## Functions are objects 

Object attributes are accessed with the dot operator.  
The `object` is the mother of all objects in Python; every Python  
object implicitly derives from `object`.  

```python
#!/usr/bin/python

# functions in Python are objects

def f():
    """This function prints a message """
    return 'f() function'

print(isinstance(f, object))
print(id(f))
print(f())

print(f.__doc__)
print(f.__name__)
```

---

In Python, everything is an object.  

```python
#!/usr/bin/env python

# object_types.py

import sys

def f():
    pass

print(type(1))
print(type(""))
print(type([]))
print(type({}))
print(type(()))
print(type(object))
print(type(f))
print(type(sys))
```

## Function scope 

Variables defined inside a function have a function scope. They are also  
called local variables.  

```python
#!/usr/bin/python

# fun_scope.py

# a local variable is valid in the 
# function scope

name = "Jack"

def f():
   name = "Robert"
   print("Within function", name)

print("Outside function", name)
f()
```

## Global variables 

Global variables are defined in module.  
Global variables are automatically valid in functions.  
```python
#!/usr/bin/python

name = "Jack"

def f():
   print("Within function", name)

print("Outside function", name)
f()
```

---

 The `global` keyword allows us to modify the variable outside  
 of the current scope.

```python
#!/usr/bin/python

name = "Jack"

def f():
    
   global name 
   name = "Robert"
   print ("Within function", name)


print("Outside function", name)
f()
print("Outside function", name)
```

## The pass keyword 

The `pass` keyword is used to define functions that are not yet implemented.  

```python
#!/usr/bin/python

def f():
    pass

def g():
    pass
  
def h():
    return 'h fun'

print(f())
print(g())
print(h())

print(f.__name__)
print(g.__name__)
print(h.__name__)
```

## Returning values 

The `return` keyword is used to return values from functions.  
A function returns `None` if no keyword is defined.  

```python
#!/usr/bin/python

# returning.py

def showMessage(msg):

    print(msg)


def cube(x):

    return x * x * x


x = cube(3)
print(x)

showMessage("Computation finished.")
print(showMessage("Ready."))
```

---

We can return multiple values with tuples.  

```python
#!/usr/bin/python

# returning2.py

n = [1, 2, 3, 4, 5]

def stats(x):

    mx = max(x)
    mn = min(x)
    ln = len(x)
    sm = sum(x)

    return mx, mn, ln, sm

mx, mn, ln, sm = stats(n) # deconstruction
print(stats(n))

print(mx, mn, ln, sm)
```

## Arbitrary number of args 

With `*` operator, function can accept arbitrary number of arguments.  

```python
#!/usr/bin/python

# arbitrary_args.py

def sum(*args):
   '''Function returns the sum 
   of all values'''
   
   r = 0
   
   for i in args:
      r += i
      
   return r


print(sum.__doc__)
print(sum(1, 2, 3))
print(sum(1, 2, 3, 4, 5))
```


## Nested functions

Nested/inner functions are functions defined inside other functions.  

```python
#!/usr/bin/python

# nested functions are functions defined inside other
# functions

def myfun():
    print("inside myfun()")

    def greet():
        return "greeting message"

    def welcome():
        return "welcoming message"

    print(greet())
    print(welcome())
    print("inside myfun()")

myfun()
```

## Passing functions as parameters 

Functions can be passed to other functions as parameters. 

```python
#!/usr/bin/python

def inc(x):
    return x + 1

def dec(x):
    return x - 1

def operate(fun, x):

    res = fun(x)
    return res

x = 2

print(operate(inc, x))
print(x)

print(operate(dec, x))
print(x)
```

## Function redefinition

Python allows to redefine existing function definitions.  

```python
#!/usr/bin/python

# redefinition.py

from time import gmtime, strftime


def showMessage(msg):

    print(msg)


showMessage('Ready.')


def showMessage(msg):

    print(strftime('%H:%M:%S', gmtime()))
    print(msg)


showMessage('Processing.')
```

## No function hoisting 

Functions must be defined before being called. Python does not support  
function hoisting like JavaScript.  

```python
#!/usr/bin/python

def f1():
    print("f1()")


f1()
# f2()


def f2():
    print("f2()")
```

## Collection of functions

Python is flexible, it allows to store functions in collections.  

```python
#!/usr/bin/python

# fun_coll.py

def f():
    pass

def g():
    pass
  
def h(f):
    print (id(f))
  
a = (f, g, h)

for i in a:
    print(i)
    
h(f)
h(g)
```




