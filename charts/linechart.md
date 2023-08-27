# Line charts 


A line chart is a type of chart which displays information as a series of data points  
called markers connected by straight line segments.

## Straight line

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
   
year = [1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000, 2010]
unemployment_rate = [9.8, 12, 8, 7.2, 6.9, 7, 6.5, 6.2, 5.5, 6.3]
  
plt.plot(year, unemployment_rate)
plt.title('Unemployment in US')

plt.xlabel('Year')
plt.ylabel('Unemployment rate')

plt.savefig('linechart.png')
```

## Line color and style

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np

x = np.array([1, 2, 3, 4])
y = 2*x + 1

# plt.plot(x, y, 'r-.')
plt.plot(x, y, '-.', color='#00abc0')

# ax.set_ylim(ymin=0)
# plt.ylim(ymin=0)
plt.ylim(bottom=0)
plt.title('Line chart')

plt.xlabel('x values')
plt.ylabel('y values')

plt.savefig('linechart3.png')
```

## Curved line

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

## Multiple lines 

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np

# by default it creates 50 elements
x = np.linspace(0, 30)

# np.random.seed(19680801)

fig, ax = plt.subplots()

print(np.sin(x))

ax.plot(x, np.sin(x) + x + np.random.randn(50))
ax.plot(x, np.sin(x) + 0.5 * x + np.random.randn(50))
ax.plot(x, np.sin(x) + 2 * x + np.random.randn(50))
ax.plot(x, np.sin(x) - 0.5 * x + np.random.randn(50))
ax.plot(x, np.sin(x) - 2 * x + np.random.randn(50))
ax.plot(x, np.sin(x) + np.random.randn(50))

ax.set_title('Multiple lines')

plt.savefig('multipleines.png')
```
