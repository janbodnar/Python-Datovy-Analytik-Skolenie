# Charts 

Matplotlib is a Python library for creating charts. Matplotlib can be used  
in Python scripts, the Python and IPython shell, the Jupyter notebook,  
web application servers, and for GUI toolkits.  

    $ sudo pip install matplotlib


## Scatter chart

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


## Horizontal barchart

```python
#!/usr/bin/python

from matplotlib import pyplot as plt
from matplotlib import style

style.use('ggplot')

x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
y = [543, 31, 5, 5, 22, 5, 37, 31, 27, 4, 6, 15, 49, 19, 7]

fig, ax = plt.subplots()

oprs = ('Katarakta',
        'PPV /vitrektómia/',
        'Serkláž',
        'Operácia glaukómu',
        'Blefaroplastika',
        'Pterýgium',
        'Chalaseon',
        'Xantelazma',
        'Cysta+tu papil',
        'Entropium, Ektropium',
        'Elektrokoagulácia',
        'Laser sietnice',
        'Jag laser',
        'Iridotómia',
        'Iné',
        )

ax.barh(x, y, align='center', color='b', alpha=0.5)

ax.set_title('Očné operácie v nemocnici Agel Košice-Šaca za r. 2022')
ax.set_xlabel('Počet operácií')

ax.set_yticks(x, labels=oprs)
ax.invert_yaxis() 
plt.tight_layout()
plt.savefig("chart.png", bbox_inches='tight')
```
