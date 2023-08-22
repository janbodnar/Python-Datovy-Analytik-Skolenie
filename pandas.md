# Pandas 

Module for practical, real-world data analysis in Python.

## The head/tail functions

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
