# Bar charts

A bar chart presents grouped data with rectangular bars with lengths proportional  
to the values that they represent. The bars can be plotted vertically or horizontally.

## Vertical barchart

```python
#!/usr/bin/python

from matplotlib import pyplot as plt
from matplotlib import style

style.use('ggplot')

x = [0, 1, 2, 3, 4, 5]
y = [46, 38, 29, 22, 13, 11]

fig, ax = plt.subplots()

ax.bar(x, y, align='center')

ax.set_title('Olympic Gold medals in London')
ax.set_ylabel('Gold medals')
ax.set_xlabel('Countries')

ax.set_xticks(x)
ax.set_xticklabels(("USA", "China", "UK", "Russia", 
    "South Korea", "Germany"))

plt.savefig('vbarchart.png')
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
plt.savefig("hbarchart.png", bbox_inches='tight')
```

## Stacked bar chart

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np

# data from https://allisonhorst.github.io/palmerpenguins/

species = (
    'Adelie\n $\\mu=$3700.66g',
    "Chinstrap\n $\\mu=$3733.09g",
    "Gentoo\n $\\mu=5076.02g$",
)
weight_counts = {
    'Below': np.array([70, 31, 58]),
    'Above': np.array([82, 37, 66]),
}
width = 0.5

fig, ax = plt.subplots()
bottom = np.zeros(3)

print( weight_counts.items())

for boolean, weight_count in weight_counts.items():
    p = ax.bar(species, weight_count, width, label=boolean, bottom=bottom)
    bottom += weight_count

ax.set_title('Number of penguins with above average body mass')
ax.legend(loc='upper right')

plt.savefig('stackedbar.png')
```
