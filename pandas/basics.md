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

## Random sample

Return a set of random rows or columns.  

```python
import pandas as pd

df = pd.read_csv("military_spending.csv")

print(df.sample(3, axis=0)) # random rows
print(df.sample(3, axis=1)) # random cols
```


## Basic information

```python
import pandas as pd

df = pd.read_csv('products.csv') 
print(df.info())
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

for a specific column:

```python
import pandas as pd

filename = 'mock_data2.csv'
df = pd.read_csv(filename)

print('basic stats for Entries')
summary_entries = df['entries'].describe()

print(summary_entries)
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

## The inplace attribute

The `inplace` attribute is used in various functions to determine whether the operation    
should modify the original DataFrame or return a new DataFrame with the changes applied.   
 
`inplace=True`: Modifies the original DataFrame directly. No new DataFrame is returned.   
`inplace=False` (default): Returns a new DataFrame with the changes applied, leaving the   
  original DataFrame unchanged

```python
import pandas as pd

file_name = 'countries.csv'

df = pd.read_csv(file_name)

df2 = df.query("continent == 'Europe'")
print(df2)

# df.query("continent == 'Europe'", inplace=True)
# print(df)
```


## Rename column

```python
import pandas as pd

df = pd.read_csv('products.csv') 

df2 = df.rename(columns={'id': 'product_id'})
print(df2.head().to_string(index=False))
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

## Missing values

The `data2.csv` file: 

```
Name,Age,City
Alex,10,New York
Ronald,18,
Jane,,Los Angeles
Laura,25,Chicago
```

```python
import pandas as pd

# Load the dataset from a CSV file
df = pd.read_csv('data2.csv')
print("Original DataFrame:")
print(df)

# Fill missing values with a specific value
df_filled = df.fillna({'Age': 0, 'City': 'Unknown'})
print("\nDataFrame after filling missing values:")
print(df_filled)

# Drop rows with any missing values
df_dropped = df.dropna()
print("\nDataFrame after dropping rows with missing values:")
print(df_dropped)
```


