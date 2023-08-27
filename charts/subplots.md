# Subplots 

It is possible to place multiple charts in a plot via subplots.  
Subplots are created with `subplot` or `subplots` functions.   

The `subplots` creates a figure and a grid of subplots with a single call, 
while providing reasonable control over how the individual plots are created. 

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
