# Piechart

A pie chart is a circular chart which is divided into slices to illustrate numerical proportion.  
The default starting angle is 0 and the chart is drawn counterclockwise.  


## Simple example

The starting angle is set with `startangle` option.  

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
 
labels = ['FreeBSD', 'NetBSD', 'Linux', 'Window', 'Apple']
quantity = [4, 3, 12, 6, 2]

colors = ['yellowgreen', 'gold', 'lightskyblue', 'lightcoral', 'orange']
plt.pie(quantity, labels=labels, colors=colors, startangle=90)

plt.axis('equal')
plt.savefig('piechart.png')
```

## Slice values 

The slice values are displayed with `autopct` option. Shadow can be set with `shadow`.  

```python
#!/usr/bin/python

import matplotlib.pyplot as plt

labels = ['FreeBSD', 'NetBSD', 'Linux', 'Window', 'Apple']
quantity = [4, 3, 12, 6, 2]

plt.pie(quantity, labels=labels, autopct='%1.1f%%',
        textprops={'fontsize': 10}, shadow=True)
plt.axis('equal')
plt.legend(title='Operating systems')

plt.savefig('piechart2.png')
```

## Explodes 

```python
#!/usr/bin/python

import matplotlib.pyplot as plt
 
labels = ['FreeBSD', 'NetBSD', 'Linux', 'Window', 'Apple']
quantity = [4, 3, 12, 6, 2]
explodes = [0.2, 0, 0, 0, 0]

plt.pie(quantity, labels=labels, explode=explodes, autopct='%1.1f%%')
plt.axis('equal')

plt.savefig('piechart3.png')
```

