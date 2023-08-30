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









