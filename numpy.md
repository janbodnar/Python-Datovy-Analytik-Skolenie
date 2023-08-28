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
