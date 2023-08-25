# Pandas 

Module for practical, real-world data analysis in Python.

*DataFrame* is a data structure that organizes data into a 2-dimensional  
table of rows and columns, much like a spreadsheet.  

## Basic stats 

```python
#!/usr/bin/python

import pandas as pd
import numpy as np

df = pd.DataFrame(np.arange(0, 1200, 2), columns=['A'])

print(f'mean: {df.values.mean()}')
print(f'std: {df.values.std()}')
print(f'min: {df.values.min()}')
print(f'max: {df.values.max()}')
print(f'sum: {df.values.sum()}')
```

---

```python
#!/usr/bin/python

import pandas as pd
import numpy as np

rng = np.random.default_rng()
sample = rng.integers(low=0, high=12000, size=100) 

df = pd.DataFrame(sample, columns=['A'])

print(f"sum: {sum(df['A'])}")
print(f"min: {min(df['A'])}")
print(f"max: {max(df['A'])}")
print(f"len: {len(df['A'])}")
```


## Random sample

Return a set of random rows or columns.  

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv("military_spending.csv")

print(df.sample(3, axis=0))
```

## Sorting 

Sorting by multiple columns.  

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv('products.csv')
print(df.sort_values(['category', 'unit_price', 'units_in_stock'], ascending=[True, False, True]).to_string())
```

## The to_csv function

The `to_csv` function writes the dataframe to CSV.  

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv('products.csv')

res = df[df.index % 2 == 0]
res.to_csv('products2.csv', index=False)
```

## Transform to dictionary

```python
#!/usr/bin/python

import pandas as pd 

data = [['Alex', 10], ['Ronald', 18], ['Jane', 33]]
df = pd.DataFrame(data, columns=['Name', 'Age'])

# df = pd.read_csv("military_spending.csv") 

print('list')
print(df.to_dict(orient='list'))

print('************************************')

print('series')
print(df.to_dict(orient='series'))

print('************************************')

print('dict')
print(df.to_dict(orient='dict'))

print('************************************')

print('split')
print(df.to_dict(orient='split'))

print('************************************')

print('records')
print(df.to_dict(orient='records'))

print('************************************')

print('index')
print(df.to_dict(orient='index'))

print('************************************')

print('tight')
print(df.to_dict(orient='tight'))
```

