# NumPy

NumPy is the fundamental package for scientific computing in Python.  
It provides support for large, multi-dimensional arrays and matrices,  
along with a large collection of high-level mathematical functions  
to operate on these arrays.  

NumPy is much faster than the built-in Python list.  

`pip install numpy`

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
import numpy as np

a = np.arange(6)
print(a)
print(a.shape)

a = np.arange(-10, 10, 2)
print(a)
```

## Array creation

```python
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

## Matrix

```python
import numpy as np

a = np.array([[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]])
print(a)

a = np.zeros((3, 3, 4))
print(a)

a = np.full((3, 3), 1)
print(a)

a = np.random.rand(3, 3, 3)
print(a)
```

## Summation along axis 

```python
import numpy as np

x = np.array([[1, 2, 3],[4, 5, 6], [7, 8, 9]])

print(x)

print(np.sum(x))  
print(np.sum(x, axis=0))  
print(np.sum(x, axis=1))
```

## The dtype 

The `dtype` is the desired data type for the array. The default is int32.  

```python
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

# NumPy functions make it easy to compute statistical measures.

```python
import numpy as np

# Sample data
data = [10, 20, 30, 40, 50]

# Calculate mean, median, and standard deviation
mean_value = np.mean(data)
median_value = np.median(data)
std_deviation = np.std(data)

print("Mean:", mean_value)
print("Median:", median_value)
print("Standard Deviation:", std_deviation)
```

## Creating and Manipulating Arrays

NumPy arrays are powerful for handling large datasets and performing  
vectorized operations.

```python
import numpy as np

# Creating an array
arr = np.array([1, 2, 3, 4, 5])

# Basic array operations
arr_squared = arr ** 2
arr_sum = np.sum(arr)
arr_mean = np.mean(arr)

print("Original array:", arr)
print("Squared array:", arr_squared)
print("Sum of array:", arr_sum)
print("Mean of array:", arr_mean)
```


## Array vs list

Some operators (*) work differently, some are not implemented for lists (+, -).   

```python
import numpy as np

vals = [1, 2, 3, 4, 5]
nvals = np.array([1, 2, 3, 4, 5])

print(len(vals))
print(len(nvals))

print(sum(vals))
print(sum(nvals))

print(vals)
print(nvals)

print(vals * 2)
print(nvals * 2)

# print(vals + 1)
print(nvals + 1)
print(nvals - 2)
```

## The arange vs linspace

    np.arange(start, stop, step)
    np.linspace(start,stop,number)

```python
#!/usr/bin/python

import numpy as np

a = np.arange(1, 20, 2)
print(a)

b = np.linspace(1, 100, 100)
print(b)

c = np.linspace(1, 100, 200)
print(c)
```

## Filtering 

```python
import numpy as np

a = np.array([-3, -2, 0, 1, -4, 2, 5, 7])

f1 = a > 0
print(a[f1])

f2 = a < 0
print(a[f2])
```



## Indexing 

Single elements 

```python
import numpy as np

a = np.arange(10)

print(a)
print(a[0])
print(a[2])
print(a[-1])
```

Two-dimensional array

```python
import numpy as np

a = np.arange(10)
a.shape = (2, 5) 

# single elements
print(a)
print(a[1, 3])
print(a[1, -1])

print('------------------')

# first and second row
print(a[0])
print(a[1])

print('------------------')

# first and second column
print(a[:,0])
print(a[:,1])
```


## Array math

```python
import numpy as np

x = np.array([[1, 2, 3], [4, 5, 6]])
y = np.array([[7, 8, 9], [10, 11, 12]])

# Elementwise sum; both produce the array
print(x + y)
print(np.add(x, y))

print("----------------------------")

# Elementwise difference
print(x - y)
print(np.subtract(x, y))

print("----------------------------")

# Elementwise product
print(x * y)
print(np.multiply(x, y))

print("----------------------------")

# Elementwise division
print(x / y)
print(np.divide(x, y))

print("----------------------------")

# Elementwise square root
print(np.sqrt(x))
```

## Basic stats 

```python
import numpy as np

a = np.array([[30,65,70], [80,95,20], [40,90,60]]) 

print(a)

print('median:')

print(np.median(a))
print(np.median(a, axis = 0))
print(np.median(a, axis = 1))

print('mean:')
print(np.mean(a))
print(np.mean(a, axis = 0))
print(np.mean(a, axis = 1))

print('average:')
print(np.mean(a))
print(np.mean(a, axis = 0))
print(np.mean(a, axis = 1))

print('Standard deviance')
print(np.std([1,2,3,4]))

print('Variance')
print(np.var([1,2,3,4]))
```

## NumPy with mathplotlib

```python
import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(1, 15, 15, dtype=np.int32)
y = np.random.randint(1, 50, 15)

print(x)
print(y)

plt.scatter(x, y)

plt.xticks(range(1, 16))
# plt.xlim([0, 20])
plt.ylim([0, 60])
plt.savefig('chart.png')
```

## NumPy with Pandas

```python
import pandas as pd
import numpy as np

# Sample DataFrame
data = {
    'category': ['A', 'A', 'B', 'B', 'C', 'C'],
    'value': [10, 20, 30, 40, 50, 60]
}
df = pd.DataFrame(data)

# Group by 'category' and calculate aggregations using NumPy
grouped = df.groupby('category')['value']

# Calculating variance, standard deviation, mean, median
variance = grouped.agg(np.var)
std_deviation = grouped.agg(np.std)
mean_value = grouped.agg(np.mean)
median_value = grouped.agg(np.median)

print("Variance:\n", variance)
print("Standard Deviation:\n", std_deviation)
print("Mean:\n", mean_value)
print("Median:\n", median_value)
```


