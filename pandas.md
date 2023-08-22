# Pandas 

Module for practical, real-world data analysis in Python.

*DataFrame* is a data structure that organizes data into a 2-dimensional  
table of rows and columns, much like a spreadsheet.  

## Simple example 

Create a small dataframe and show the columns, values, index, shape and size properties.  

```python
#!/usr/bin/python

import pandas as pd

data = [['Alex', 10], ['Ronald', 18], ['Jane', 33]]
df = pd.DataFrame(data, columns=['Name', 'Age'])

print(df)

print(df.columns)
print(df.values)
print(df.index)

print('----------------')

print(df.shape)
print(df.size)
```

## Change index

By default, the index starts from zero.  

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv("military_spending.csv") 
df.index = df.index + 1

print(df)
```

## Custom index

Create a custom index.  

```python
#!/usr/bin/python

import pandas as pd

data = {'country': ['Brazil', 'Russia', 'India', 'China', 'South Africa'],
        'capital': ['Brasilia', 'Moscow', 'New Dehli', 'Beijing', 'Pretoria'],
        'area': [8.516, 17.10, 3.286, 9.597, 1.221],
        'population': [200.4, 143.5, 1252, 1357, 52.98]}

df = pd.DataFrame(data)
print(df)

print('------------------------------')

df.index = ['BR', 'RU', 'IN', 'CH', 'SA']
print(df)
```

## No header/index 

How to turn off header and index.  

```python
#!/usr/bin/python

import pandas as pd 
  
df = pd.read_csv("military_spending.csv") 

# print(df)
print(df.to_string(header=False, index=False))
```

## The head/tail functions

The functions return the first/last n rows.  

```python
#!/usr/bin/python

import pandas as pd 
  
df = pd.read_csv("military_spending.csv") 

print(df.head(4))

print('*******************************************')

print(df.tail(4))
```

## Counting

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv("employees.csv")

print(df.count())
print(f'Number of columns: {len(df.columns)}')

print(df.shape)
```

## The describe function

The  `describe` function generates descriptive statistics.  
Descriptive statistics include those that summarize the central tendency,  
dispersion and shape of a dataset's distribution, excluding NaN values. 


```python
#!/usr/bin/python

import pandas as pd

s1 = pd.Series([1, 2, 3, 4, 5, 6, 7, 8])
s2 = pd.Series([12, 23, 31, 14, 11, 61, 17, 18])

data = {'Vals 1': s1, 'Vals 2': s2}
df = pd.DataFrame(data)

print(df.describe())
```

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

## Selections 

### The loc function 

Selecting rows with slicing syntax  

```python
#!/usr/bin/python

import pandas as pd
import numpy as np

df = pd.read_csv('military_spending.csv')

print(df[2:12:1].to_string(index=False))
```


Selecting columns with labels  

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv("military_spending.csv") 

print(df.columns)
print(df.loc[:, [' Country']].to_string(index=False))
```

### The take function 

With `take` function we can select columns by index.  

```python
#!/usr/bin/python

import pandas as pd
import numpy as np

df = pd.read_csv('military_spending.csv')
df_c = df.take([1, 2, 3], axis=1)

print(df_c.to_string(index=False))
```


### The iloc function

Selecting columns with indexes  

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv("military_spending.csv") 

print(df.iloc[:, [1, 2, 3]].to_string(index=False))
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

