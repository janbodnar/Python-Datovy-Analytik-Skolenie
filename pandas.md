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
print(df.size
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

frame = pd.DataFrame(data)
print(frame)

print('------------------------------')

frame.index = ['BR', 'RU', 'IN', 'CH', 'SA']
print(frame)
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

## Random sample

Return a set of random rows or columns.  

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv("military_spending.csv")

print(df.sample(3, axis=0))
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

