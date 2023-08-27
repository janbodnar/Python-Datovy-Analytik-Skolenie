# Charts 

Matplotlib is a Python library for creating charts. Matplotlib can be used  
in Python scripts, the Python and IPython shell, the Jupyter notebook,  
web application servers, and for GUI toolkits.  

    $ sudo pip install matplotlib


## Scatter chart

A scatter chart is a type of plot or mathematical diagram using  
Cartesian coordinates to display values for typically two variables for a set of data.

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

plt.show()
```

---

Two datasets

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

plt.savefig('scatter2.png')
```

## Line chart 

A line chart is a type of chart which displays information as a series of data points  
called markers connected by straight line segments.

```python
#!/usr/bin/python

import numpy as np
import matplotlib.pyplot as plt

t = np.arange(0.0, 3.0, 0.01)
s = np.sin(2.5 * np.pi * t)
plt.plot(t, s)
 
plt.xlabel('time (s)')
plt.ylabel('voltage (mV)')

plt.title('Sine Wave')
plt.grid(True)

plt.savefig('linechart.png')
```

---

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
   
year = [1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000, 2010]
unemployment_rate = [9.8, 12, 8, 7.2, 6.9, 7, 6.5, 6.2, 5.5, 6.3]
  
plt.plot(year, unemployment_rate)
plt.title('Unemployment in US')

plt.xlabel('Year')
plt.ylabel('Unemployment rate')

plt.savefig('linechart2.png')
```



## Piechart 

A pie chart is a circular chart which is divided into slices to illustrate numerical proportion.

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
 
labels = ['Oranges', 'Pears', 'Plums', 'Blueberries']
quantity = [38, 45, 24, 10]

colors = ['yellowgreen', 'gold', 'lightskyblue', 'lightcoral']

plt.pie(quantity, labels=labels, colors=colors, autopct='%1.1f%%', 
    shadow=True, startangle=90)

plt.axis('equal')

plt.savefig('piechart.png')
```

## Subplots

Subplots are created with `subplot` function.  

```python
#!/usr/bin/python

import numpy as np
import matplotlib.pyplot as plt

# x, y coordinates on sine and cosine curves
x = np.arange(0, 12*np.pi, 0.1)
f_sin = np.sin(x)
f_cos = np.cos(x)

# first subplot with height 2 and width 1
plt.subplot(2, 1, 1)

plt.plot(x, f_sin)
plt.title('Sine')

# second subplot
plt.subplot(2, 1, 2)
plt.plot(x, f_cos)
plt.title('Cosine')

plt.savefig('subplots.png')
```

---

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np

x = np.array([0, 1, 2, 3])
y = np.array([6, 8, 2, 11])

plt.subplot(2, 3, 1)
plt.plot(x, y)

x = np.array([0, 1, 2, 3])
y = np.array([15, 25, 35, 45])

plt.suptitle('Subplots')

plt.subplot(2, 3, 2)
plt.plot(x, y)

x = np.array([0, 1, 2, 3])
y = np.array([2, 9, 11, 11])

plt.subplot(2, 3, 3)
plt.plot(x, y)

x = np.array([0, 1, 2, 3])
y = np.array([11, 22, 33, 55])

plt.subplot(2, 3, 4)
plt.plot(x, y)

x = np.array([0, 1, 2, 3])
y = np.array([13, 18, 11, 10])

plt.subplot(2, 3, 5)
plt.plot(x, y)

x = np.array([0, 1, 2, 3])
y = np.array([10, 20, 30, 40])

plt.subplot(2, 3, 6)
plt.plot(x, y)

plt.savefig('subplots2.png')
```






