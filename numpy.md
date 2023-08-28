# NumPy

NumPy is the fundamental package for scientific computing in Python.  
It provides support for large, multi-dimensional arrays and matrices,  
along with a large collection of high-level mathematical functions  
to operate on these arrays.  

NumPy is much faster than the built-in Python list.  

      $ pip install numpy

## The ndarray 

- defines n-dimensional arrays of homogeneous data types
- many operations are performed in compiled code for performance
- has a fixed size at creation, changing the size of an ndarray  
  creates a new array and delete the original
- elements are of the same type
- facilitates advanced mathematical and other types of operations  
  on large numbers of data
- many Python packages are based on NumPy, such as Pandas or Mathplotlib


## The arange function 

The `arange` function returns evenly spaced values within a given interval.  

```python
#!/usr/bin/python

import numpy as np

a = np.arange(6)
print(a)
print(a.shape)

a = np.arange(-10, 10, 2)
print(a)
```

## Array creation

```python
#!/usr/bin/python

import numpy as np

a = np.empty(10)
print(a)

a = np.zeros(10)
print(a)

a = np.arange(100)
print(a)

a = np.random.rand(20)
print(a)

a = np.random.randint(-100, 100, 100)
print(a)
```

## The dtype 

The `dtype` is the desired data type for the array. The default is int32.  

```python
#!/usr/bin/python

import numpy as np

a = np.array([[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]])
print(a)
print(a.shape)
print(a.dtype)

a = np.array([[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]], dtype=np.int64)
print(a)
print(a.shape)
print(a.dtype)
```


