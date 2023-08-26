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

## Third-party functions

Third-party functions defined in external modules.  
For instance, the `numpy` module.  

```
$ pip install numpy
```

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
