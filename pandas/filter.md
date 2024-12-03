# Filter operations

*Filtering operations in Pandas refer to the process of selecting a subset of data  
from a DataFrame based on specific criteria. This is a crucial step in data analysis  
for cleaning, exploring, and transforming data. Here are some common functions and  
methods used for filtering data in Pandas, along with brief descriptions:

1. `DataFrame.loc[]`
- **Description**: Access a group of rows and columns by labels or a boolean array.
  Ideal for label-based indexing.
- **Example**: `df.loc[df['column_name'] > 50]`

### 2. `DataFrame.iloc[]`
- **Description**: Access a group of rows and columns by integer positions (integer-based indexing).
- **Example**: `df.iloc[0:5]`  (first five rows)

### 3. `DataFrame.query()`
- **Description**: Query the columns of a DataFrame with a boolean expression. It's a convenient
  method to perform filtering with complex conditions.
- **Example**: `df.query('column_name > 50')`

### 4. `DataFrame[df['column']]`
- **Description**: Basic filtering using boolean indexing to select rows where a condition is true.
- **Example**: `df[df['column_name'] > 50]`

### 5. `DataFrame.isin()`
- **Description**: Filter rows where column values are in a specified list of values.
- **Example**: `df[df['column_name'].isin(['value1', 'value2'])]`

### 6. `DataFrame.str.contains()`
- **Description**: Filter rows where column values (usually strings) contain a specified substring.
- **Example**: `df[df['column_name'].str.contains('substring')]`

### 7. `DataFrame.notnull() / DataFrame.isnull()`
- **Description**: Filter rows where column values are not null (`notnull()`) or are null (`isnull()`).
- **Example**: `df[df['column_name'].notnull()]`

### 8. `DataFrame.groupby().filter()`
- **Description**: Filter groups of rows based on some condition applied to each group.
- **Example**: `df.groupby('group_column').filter(lambda x: len(x) > 10)`

### 9. `DataFrame.apply()`
- **Description**: Apply a function along an axis of the DataFrame. Useful for applying custom filters.
- **Example**: `df[df['column_name'].apply(lambda x: x > 50)]`

### 10. `DataFrame.dropna()`
- **Description**: Remove missing values. Can drop rows or columns with null values.
- **Example**: `df.dropna()` (drops rows with any null values)


## Example Usage

```python
import pandas as pd

# Sample DataFrame
data = {
    'id': [1, 2, 3, 4, 5],
    'product_name': ['A', 'B', 'C', 'D', 'E'],
    'unit_price': [10, 20, 30, 40, 50],
    'units_in_stock': [100, 0, 50, 60, 0]
}
df = pd.DataFrame(data)

# Example 1: Filter rows where unit_price is greater than 25
filtered_df_1 = df[df['unit_price'] > 25]

# Example 2: Filter rows using query method
filtered_df_2 = df.query('unit_price > 25')

# Example 3: Filter rows where units_in_stock is not zero
filtered_df_3 = df[df['units_in_stock'] != 0]

print(filtered_df_1)
print(filtered_df_2)
print(filtered_df_3)
```


## Filter rows by col value

```python
import pandas as pd

# Load the data from the CSV file
df = pd.read_csv('products.csv')

# Filter rows where unit_price is greater than 40
filtered_df = df[df['unit_price'] > 40]
print(len(filtered_df))
print(filtered_df)
```

## Filter rows by multiple conditions

```python
import pandas as pd

# Load the data from the CSV file
df = pd.read_csv('products.csv')

# Filter rows where unit_price is greater than 20 and units_in_stock is less than 50
filtered_df = df[(df['unit_price'] > 20) & (df['units_in_stock'] < 50)]
print(filtered_df)
```

## Filter rows with `isin`

```python
import pandas as pd

# Load the data from the CSV file
df = pd.read_csv('products.csv')

# Filter rows where category is either 'Beverages' or 'Condiments'
filtered_df = df[df['category'].isin(['Beverages', 'Condiments'])]
print(filtered_df)
```

## Filter rows by negation

Use the `~` operator.

```python
import pandas as pd

# Load the data from the CSV file
df = pd.read_csv('products.csv')

# Filter rows where category is not 'Condiments'
filtered_df = df[~df['category'].isin(['Condiments'])]
print(filtered_df)
```

## Filter rows by string matching

```python
import pandas as pd

# Load the data from the CSV file
df = pd.read_csv('products.csv')

# Filter rows where product_name contains 'Che'
filtered_df = df[df['product_name'].str.contains('Che')]
print(filtered_df)
```

## Filter rows based on index

Index values start with 0 by default.  

```python
import pandas as pd

# Load the data from the CSV file
df = pd.read_csv('products.csv')

# Filter rows where index is 0, 1, 5, 6, or 7 (Note: DataFrame index starts from 0)
filtered_df = df.loc[[0, 1, 5, 6, 7]]
print(filtered_df)
```

## Filter rows with query 

```python
import pandas as pd

# Load the data from the CSV file
df = pd.read_csv('products.csv')

# Filter rows where unit_price is greater than 20 and category is equal 
# to Seafood using query method
filtered_df = df.query("unit_price > 20 and category == 'Seafood'")
print(filtered_df)
```

## Filter rows using a function

```python
import pandas as pd

# Load the data from the CSV file
df = pd.read_csv('products.csv')

# Define a function to filter rows
def price_filter(price):
    return price > 40

# Apply the function to filter rows
filtered_df = df[df['unit_price'].apply(price_filter)]
print(filtered_df)
```


