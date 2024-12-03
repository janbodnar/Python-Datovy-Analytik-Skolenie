# Filter operations


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


