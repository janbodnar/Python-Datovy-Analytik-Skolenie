# Groups

We use the `groupby` function to perform grouping. The returned group  
object is a Python dictionary.  

## Counting groups

Calculate the number of groups and number of rows in each group  
with `nunique`, `ngroups`, and `size`.   

```python
#!/usr/bin/python

import pandas as pd 
  
df = pd.read_csv('products.csv') 
print(df['category'].nunique())

g = df.groupby('category')
print(g.ngroups)

print('----------------------')

print(g.size())
```

## First, last, nth

Take the first, last, nth row from each group. 

```python
#!/usr/bin/python

import pandas as pd 

df = pd.read_csv('products.csv') 
g = df.groupby('category')

print(g.first())
print('----------------------')

print(g.last())
print('----------------------')

print(g.nth(6))
print('----------------------')
```

## Retrieving specific group 

The `get_group` function constructs a DataFrame from the group with the provided name.  

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv('products.csv')
g = df.groupby('category')

res = g.get_group('Seafood')
print(res.to_string(index=False))

print(80 * '-')

res = g.get_group('Beverages')
print(res.to_string(index=False))

print(80 * '-')

res = df[df["category"] == 'Produce']
print(res.to_string(index=False))
```

