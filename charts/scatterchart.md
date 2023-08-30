# Scatter charts


A scatter chart is a type of plot or mathematical diagram using  
Cartesian coordinates to display values for typically two variables for a set of data.

## Simple example

```python
#!/usr/bin/python

import matplotlib.pyplot as plt

x_axis = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
y_axis = [5, 16, 34, 56, 32, 56, 32, 12, 76, 89]

plt.title('Prices over 10 years')
plt.scatter(x_axis, y_axis, color='darkblue', marker='x', label='item 1')

plt.xlabel('Time (years)')
plt.ylabel('Price (dollars)')

plt.grid(True)
plt.legend()

plt.savefig('scatter.png')
```


## Random values 

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(1, 40, 40)
y = np.random.randint(-50, 50, 40)

plt.scatter(x, y)

plt.title('Scatter chart')
plt.savefig('scatter.png')
```

## Size of markers 

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(1, 40, 40)
y = np.random.randint(-50, 50, 40)
s = np.random.randint(2, 85, 40)

plt.scatter(x, y, sizes=s)

plt.title('Scatter chart')
plt.savefig('scatter.png')
```

## Two datasets

```python
#!/usr/bin/python

import matplotlib.pyplot as plt

x_axis1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
y_axis1 = [5, 16, 34, 56, 32, 56, 32, 12, 76, 89]

x_axis2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
y_axis2 = [53, 6, 46, 36, 15, 64, 73, 25, 82, 9] 

plt.title('Prices over 10 years')

plt.scatter(x_axis1, y_axis1, color='darkblue', marker='x', label='item 1')
plt.scatter(x_axis2, y_axis2, color='darkred', marker='x', label='item 2')

plt.xlabel('Time (years)')
plt.ylabel('Price (dollars)')

plt.grid(True)
plt.legend()

plt.savefig('scatter.png')
```

## Colors, transparency

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np

x = np.random.randint(100, size=(100))
y = np.random.randint(100, size=(100))
colors = np.random.randint(100, size=(100))
sizes = 10 * np.random.randint(100, size=(100))

plt.scatter(x, y, c=colors, s=sizes, alpha=0.5, cmap='nipy_spectral')
plt.colorbar()

plt.savefig('scatter5.png')
```

