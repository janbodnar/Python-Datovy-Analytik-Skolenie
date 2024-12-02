# Basics

The basic operations in Pandas.  


## Simple example 

Create a small dataframe and show the columns, values, index, shape and size properties.  

```python
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

## Basic information

```python
import pandas as pd

df = pd.read_csv('products.csv') 
print(df.info())
```

## Export to CSV

```python
import pandas as pd

data = [['Alex', 10], ['Ronald', 18], ['Jane', 33]]
df = pd.DataFrame(data, columns=['Name', 'Age'])

df.to_csv('users.csv', index=False)
```

## Change index

By default, the index starts from zero.  

```python
import pandas as pd

df = pd.read_csv("military_spending.csv") 
df.index = df.index + 1

print(df)
```

## Custom index

Create a custom index.  

```python
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
import pandas as pd 
  
df = pd.read_csv("military_spending.csv") 

# print(df)
print(df.to_string(header=False, index=False))
```

## The head/tail functions

The functions return the first/last n rows.  

```python
import pandas as pd 
  
df = pd.read_csv("military_spending.csv") 

print(df.head(4))

print('*******************************************')

print(df.tail(4))
```

## Add column

```python
import pandas as pd

data = [['Alex', 10], ['Ronald', 18], ['Jane', 33]]
df = pd.DataFrame(data, columns=['Name', 'Age'])

# Add column
df['Favourite colour'] = ['red', 'blue', 'black']

print(df.head())
```

## Add column at the beginning

```python
import pandas as pd

data = [['Alex', 10], ['Ronald', 18], ['Jane', 33]]
df = pd.DataFrame(data, columns=['Name', 'Age'])

# Create a Series and convert it to a DataFrame with a proper column name
ids = pd.Series([1, 2, 3], name='id')
df = pd.concat([ids, df], axis=1)

print(df.head())
```

## Sort by column

```python
import pandas as pd

df = pd.read_csv('military_spending.csv') 

sorted = df.sort_values(by=' Country', ascending=False)
print(sorted)
```

## Drop column

```python
import pandas as pd

df = pd.read_csv('products.csv') 

df2 = df.drop(columns=['id'])
print(df2.head().to_string(index=False))
```

## Counting

```python
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
import pandas as pd

s1 = pd.Series([1, 2, 3, 4, 5, 6, 7, 8])
s2 = pd.Series([12, 23, 31, 14, 11, 61, 17, 18])

data = {'Vals 1': s1, 'Vals 2': s2}
df = pd.DataFrame(data)

print(df.describe())
```
