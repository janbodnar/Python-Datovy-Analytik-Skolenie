# Pandas 

Module for practical, real-world data analysis in Python.

*DataFrame* is a data structure that organizes data into a 2-dimensional  
table of rows and columns, much like a spreadsheet.  

## Show dataframe without the index

```python
import pandas as pd

df = pd.read_csv('products.csv') 
print(df.to_string(index=False))
```

## Show rows with even idx

```python
import pandas as pd

df = pd.read_csv('products.csv')

res = df[df.index % 2 == 0]
print(res.to_string(index=True))
```

## Basic stats 

```python
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

## Axis 

```python
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

## Random sample

Return a set of random rows or columns.  

```python
import pandas as pd

df = pd.read_csv("military_spending.csv")

print(df.sample(3, axis=0))
```

## Sorting 

Sorting by multiple columns.  

```python
import pandas as pd

df = pd.read_csv('products.csv')
print(df.sort_values(['category', 'unit_price', 'units_in_stock'], ascending=[True, False, True]).to_string())
```

## The to_csv function

The `to_csv` function writes the dataframe to CSV.  

```python
import pandas as pd

df = pd.read_csv('products.csv')

res = df[df.index % 2 == 0]
res.to_csv('products2.csv', index=False)
```

## Data type inference

Pandas infers the data type for each column in a DataFrame by inspecting the  
data in that column. It analyzes the values and determines the most appropriate  
data type based on the content. For example, if a column contains only integers,  
it will infer the data type as int64. If a column contains text, it will infer the  
data type as object (which is the pandas equivalent for string data).

```python
import pandas as pd

products_df = pd.read_csv('products.csv')
print(products_df.dtypes)
```

## Transform to dictionary

```python
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

## Total sales

```python
import pandas as pd
from decimal import Decimal

# Define a function to convert strings to Decimal
def to_decimal(value):
    return Decimal(value)

# Load the products dataset with converters for specific columns
products_df = pd.read_csv('products.csv', converters={
    'unit_price': to_decimal,
    'units_in_stock': to_decimal
})

# Calculate potential total sales for each product
products_df['total_sales'] = products_df['unit_price'] * products_df['units_in_stock']

# Calculate the total potential sales
total_potential_sales = products_df['total_sales'].sum()
print("Total Potential Sales: $", total_potential_sales)
```
