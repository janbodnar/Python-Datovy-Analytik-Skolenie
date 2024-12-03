# Sorting 

## Sort by single column

```python
import pandas as pd

df = pd.read_csv('products.csv')

# Sort by 'unit_price'
sorted_df = df.sort_values(by='unit_price')
print(sorted_df)
```
