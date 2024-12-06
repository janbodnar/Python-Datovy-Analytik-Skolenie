# Pandas 

Module for practical, real-world data analysis in Python.

A Pandas DataFrame is a two-dimensional, size-mutable, and potentially heterogeneous tabular data  
structure with labeled axes (rows and columns). It is similar to a spreadsheet or SQL table, making it  
a powerful and flexible data manipulation tool in Python.  

Key Features:

- Columns: Represented as Series, each column can hold data of different types
  (integers, floats, strings, etc.).
- Rows: Each row is identified by an index, allowing for easy data retrieval
   and manipulation.
- Labeled Axes: Both rows and columns have labels, making it easier to
  reference and manipulate data.


## Show empty stocks

```python
import pandas as pd

df = pd.read_csv('products.csv') 

df_empty_stocks = df[df['units_in_stock'] == 0]
print(df_empty_stocks.head().to_string(index=False))
```

## Extract 

```python
import pandas as pd

file_name = 'countries.csv'

# Read the CSV file into a DataFrame
df = pd.read_csv(file_name)

df.drop(columns=['area', 'continent'], inplace=True)
df.iloc[:50].to_csv('countries_3c_50r.csv', index=False)
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

The `axis` parameter in pandas specifies the direction along which a function operates  
on the DataFrame. It can take two values:

- axis=0: Operate along the rows (i.e., apply the function to each column).  
- axis=1: Operate along the columns (i.e., apply the function to each row).  

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
print(type(total_potential_sales))
```


