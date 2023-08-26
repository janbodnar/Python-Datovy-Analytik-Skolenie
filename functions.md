# Functions

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
