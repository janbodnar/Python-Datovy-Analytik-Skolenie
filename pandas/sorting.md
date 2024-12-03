# Sorting 

## Basic Functions for Sorting in Pandas

1. *`sort_values()`*:
   - *Description*: Sorts the DataFrame by the values of one or more columns.
   - *Parameters*:
     - *`by`*: Column(s) to sort by.
     - *`ascending`*: Whether to sort ascending (True, default) or descending (False).
     - *`inplace`*: Whether to modify the DataFrame in place.
   - *Example*: `df.sort_values(by='column_name')`

2. *`sort_index()`*:
   - *Description*: Sorts the DataFrame by its index.
   - *Parameters*:
     - *`axis`*: Axis to sort along (0 or 'index' for rows, 1 or 'columns' for columns).
     - *`ascending`*: Whether to sort ascending (True, default) or descending (False).
     - *`inplace`*: Whether to modify the DataFrame in place.
   - *Example*: `df.sort_index()`


```python
import pandas as pd

# Sample DataFrame
data = {
    'id': [1, 2, 3, 4, 5],
    'product_name': ['Chai', 'Chang', 'Aniseed Syrup', 'Chef Anton\'s Cajun Seasoning', 'Chef Anton\'s Gumbo Mix'],
    'unit_price': [18.0, 19.0, 10.0, 22.0, 21.35],
    'units_in_stock': [39, 17, 13, 53, 0]
}
df = pd.DataFrame(data)

# Sorting by column 'unit_price'
sorted_by_value = df.sort_values(by='unit_price')

## Sort by single column

```python
import pandas as pd

df = pd.read_csv('products.csv')

# Sort by 'unit_price'
sorted_df = df.sort_values(by='unit_price')
print(sorted_df)
```

## Sort by multiple columns

```python
import pandas as pd

# Load the data from the CSV file
df = pd.read_csv('products.csv')

# Sort by 'category' and then by 'unit_price'
sorted_df = df.sort_values(by=['category', 'unit_price'])
print(sorted_df)
```

## Sort in desceding order

```python
import pandas as pd

df = pd.read_csv('products.csv')

# Sort by 'unit_price' in descending order
sorted_df = df.sort_values(by='unit_price', ascending=False)
print(sorted_df)
```

## Sort by index

```python
import pandas as pd

# Load the data from the CSV file and set 'id' as the index
df = pd.read_csv('products.csv', index_col='id')

# Sort by index
sorted_df = df.sort_index()
print(sorted_df)
```

## Custom sort order

```python
import pandas as pd

df = pd.read_csv('products.csv')

# Define custom sort order for 'category'
category_order = ['Condiments', 'Beverages', 'Produce', 'Meat/Poultry', 'Seafood', 'Dairy Products', 'Confections']
df['category'] = pd.Categorical(df['category'], categories=category_order, ordered=True)

# Sort by 'category' with custom order
sorted_df = df.sort_values(by='category')
print(sorted_df)
```

