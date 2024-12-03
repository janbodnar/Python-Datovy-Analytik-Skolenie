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

```
## import pandas as pd

# Load the data from the CSV file
df = pd.read_csv('products.csv')

# Filter rows where category is either 'Beverages' or 'Condiments'
filtered_df = df[df['category'].isin(['Beverages', 'Condiments'])]
print(filtered_df)
```
