# Pandas 

Module for practical, real-world data analysis in Python.

*DataFrame* is a data structure that organizes data into a 2-dimensional  
table of rows and columns, much like a spreadsheet.  

## Show df without the index

```python
import pandas as pd

df = pd.read_csv('products.csv') 
print(df.to_string(index=False))
```

## Show df without header

```python
import pandas as pd

df = pd.read_csv('products.csv') 
print(df.head().to_string(header=False))
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

## Random sample

Return a set of random rows or columns.  

```python
import pandas as pd

df = pd.read_csv("military_spending.csv")

print(df.sample(3, axis=0)) # random rows
print(df.sample(3, axis=1)) # random cols
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

## Converters

In pandas, the `converters` parameter in the `pd.read_csv` function allows you to specify  
a custom function to convert the values of a specific column when reading a CSV file. This is  
especially useful when you need to apply custom data transformations during the loading process,  
such as converting strings to Decimal or parsing custom date formats.  

```python
import pandas as pd
from decimal import Decimal

products_df = pd.read_csv('products.csv')

def to_decimal(value):
    return Decimal(value)

# Load the products dataset with converters for specific columns
products_df = pd.read_csv('products.csv', converters={
    'unit_price': to_decimal,
})

print(products_df.dtypes)
print(products_df['unit_price'].mean())
```

The `data.csv` file:  

```
id,name,join_date
1,John Doe,12-04-2023
2,Jane Smith,11-03-2023
3,Bob Johnson,10-02-2023
```

Using a converter to parse the custom datetime format into datetime object.  

```python
import pandas as pd
from datetime import datetime

# Define a function to convert custom date format
def parse_date(value):
    return datetime.strptime(value, '%d-%m-%Y')

# Load the dataset with a converter for the 'join_date' column
df = pd.read_csv('data.csv', converters={'join_date': parse_date})

print(df)
print(df.dtypes)  # Check the data types to ensure join_date is datetime
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
