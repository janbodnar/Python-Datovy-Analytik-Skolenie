# Charts 

Matplotlib is a Python library for creating charts. Matplotlib can be used  
in Python scripts, the Python and IPython shell, the Jupyter notebook,  
web application servers, and for GUI toolkits.  

    $ sudo pip install matplotlib


## Set limits of axes 

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 1000)

plt.xlim(-1, 11)
plt.ylim(-1.5, 1.5);
plt.plot(x, np.sin(x))

plt.savefig('limits.png')
```

## Predefined styles

```python
#!/usr/bin/python

import numpy as np
import matplotlib.pyplot as plt

t = np.arange(0.0, 3.0, 0.01)
s = np.sin(2.5 * np.pi * t)

# plt.style.use('dark_background')
# plt.style.use('ggplot')
plt.style.use('fivethirtyeight')

plt.plot(t, s)
# print(plt.rcParams['axes.prop_cycle'])

plt.xlabel('time (s)')
plt.ylabel('voltage (mV)')

plt.title('Sine Wave')
plt.tight_layout()
plt.savefig('style1.png')
```

## Legend 

Displaying legend with expressions.  

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(-5, 5, 50)
y1 = 2**x + 1
y2 = 2*x + 5

plt.plot(x, y1, label=r'$x^{2} + 1$')
plt.plot(x, y2, label=r'2x + 5')

plt.title('Lines with legend')
plt.legend(title='Lines')
plt.savefig('legends.png')
```

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

## Histogram

```python
#!/usr/bin/python

import numpy as np
import matplotlib.pyplot as plt

mu, sigma = 100, 15
x = mu + sigma * np.random.randn(10000)

n, bins, patches = plt.hist(x, 50, density=True, facecolor='#280098', alpha=0.75)

plt.xlabel('IQ')
plt.ylabel('Probability')
plt.title('Distribution of IQ')

plt.text(60, .025, r'$\mu=100,\ \sigma=15$')

plt.axis([40, 160, 0, 0.03])

plt.savefig('histogram.png')
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






