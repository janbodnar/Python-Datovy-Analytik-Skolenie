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


