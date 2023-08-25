# Selections 

## The loc function 

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

Selecting with conditions  

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv("employees.csv")

data = df.loc[(df['Salary'] > 10000) & (df['Salary'] < 50000)]
print(data.head(15).to_string(index=False))
```

## The take function 

With `take` function we can select columns by index.  

```python
#!/usr/bin/python

import pandas as pd
import numpy as np

df = pd.read_csv('military_spending.csv')
df_c = df.take([1, 2, 3], axis=1)

print(df_c.to_string(index=False))
```


## The iloc function

Selecting columns with indexes  

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv("military_spending.csv") 

print(df.iloc[:, [1, 2, 3]].to_string(index=False))
```

---

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv("employees.csv")

# integer-location based indexing for selection by position.
# Multiple row and column selections using iloc and DataFrame

print(df.iloc[0:6])  # first six rows of dataframe
print('--------------------------------------')

print(df.iloc[:, 0:2])  # first two columns of data frame with all rows
print('--------------------------------------')

# 1st, 4th, 7th, 25th row + 1st 6th 8th column
print(df.iloc[[0, 3, 6, 24], [0, 5, 7]])
print('--------------------------------------')

# first 5 rows and 5th, 6th, 7th columns of data frame (county -> phone1).
print(df.iloc[:5, 5:8])
print('--------------------------------------')
```

---

Computing the mean for all columns/rows and for a specific column/row

```python
#!/usr/bin/python

import pandas as pd
import numpy as np

df = pd.DataFrame(np.arange(12).reshape(3, 4), columns=['A', 'B', 'C', 'D'])
df.index = df.index + 1
print(df)

print('----------------------------------------')

print(df.mean(axis=1))

print('----------------------------------------')

print(df.mean(axis=0))

print('----------------------------------------')

print(df['A'].mean())

print('----------------------------------------')

print(df.iloc[2].mean())

print('----------------------------------------')
```

## The isin function

Check if the a column is equal to one of the given options.  

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv("employees.csv")

res = df.loc[df['Team'].isin(['Marketing', 'Finance'])]
print(res.to_string(index=False))
```

---

The OR selection is similar to the `isin` function.  

```python
#!/usr/bin/env python

import pandas as pd

df = pd.read_csv('employees.csv')

res = df.loc[df['Team'] == 'Finance']
print(res.head(10))

print('---------------------------------')

res = df[(df['Team'] == 'Finance') | (df['Team'] == 'Legal')]
print(res.tail(10))
```



## The drop function 

The `drop` function removes the given columns or rows.  

```python
#!/usr/bin/python

import pandas as pd
import numpy as np

df = pd.DataFrame(np.arange(16).reshape(4, 4), columns=['A', 'B', 'C', 'D'])
df.index = df.index + 1
print(df)

print('----------------------------------------')

df2 = df.drop(['A', 'B'], axis=1)
print(df2)

print('----------------------------------------')

df3 = df.drop([2, 3], axis=0)
print(df3)
```
