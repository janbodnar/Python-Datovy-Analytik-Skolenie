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

## Polar projection

A `projection` refers to the method by which we transform the representation of data points from a  
certain coordinate system to another.  

A polar projection maps data that is defined in terms of radius and angle (polar coordinates) onto  
a two-dimensional plane. This is particularly useful for visualizing data that has a clear relationship  
with a central point or exhibits radial symmetry.  

A few examples:

1. **Cyclical Data**: Data that repeats in cycles, such as hours in a day, days in a week, or seasons in  
   a year, can be effectively represented using polar projection. For instance, temperature or weather  
   patterns over a year can be plotted on a polar graph to show cyclical trends.  

4. **Directional Data**: Data that involves directions or angles, such as wind direction and speed, can be  
   displayed using polar projection. This is often used in meteorology.  

6. **Radial Symmetry Data**: Data that exhibits radial symmetry, meaning it has properties that are invariant  
   under rotation about a central point, can be well-represented using polar projection. Examples include  
   patterns in flowers or snowflakes.  

9. **Acoustic Fields**: In acoustics, polar plots are often used to display the directional response of
    a microphone or speaker.  

11. **Antenna Radiation Patterns**: In telecommunications, polar plots are used to represent antenna radiation patterns,
    showing the directionality of the antenna's performance.

 
```python
import matplotlib.pyplot as plt
import numpy as np

# Let's assume these are your weather data points
directions = np.array([0, 45, 90, 135, 180, 225, 270, 315])  # wind directions in degrees
speeds = np.array([5, 10, 15, 20, 25, 20, 15, 10])  # wind speeds

# Convert degrees to radians
directions_rad = np.deg2rad(directions)

# Create a polar plot
plt.figure(figsize=(6,6))
ax = plt.subplot(111, polar=True)
ax.plot(directions_rad, speeds, 'o-', linewidth=2)

# Set the direction of the zero angle to North
ax.set_theta_zero_location('N')

# Set the clockwise direction
ax.set_theta_direction(-1)

# Set labels and title
ax.set_xlabel('Wind Speed')
ax.set_title('Wind Speed vs Direction')

plt.show()

```







