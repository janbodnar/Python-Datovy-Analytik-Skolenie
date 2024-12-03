# Groups

Grouping data is a powerful operation in Pandas, typically used for split-apply-combine analysis.  
It allows you to split your data into groups based on some criteria, apply a function to each group  
independently, and then combine the results back into a DataFrame.  
 
The `groupby` function in Pandas is a powerful tool used for group-wise operations. It allows you to  
split your data into groups based on some criteria, apply a function to each group independently, and  
then combine the results back into a DataFrame or Series. This is often referred to as the  
*split-apply-combine* paradigm.

Key Components:

- Splitting: Divides the data into groups based on the values in one or more columns.  
- Applying: Applies a function to each group independently. Functions can be aggregation functions  
  (e.g., mean, sum, min, max), transformations, or other custom functions.  
- Combining: Combines the results of the function applications back into a `DataFrame` or `Series`.   

## Aggregate Functions in Pandas

Aggregate functions in Pandas are used to perform various calculations on data grouped by specific  
criteria. These functions summarize and reduce data, providing insights into the dataset's characteristics.  
Common aggregate functions include:

- **Mean (`mean`)**: Calculates the average value of the data.
- **Sum (`sum`)**: Computes the total sum of the data values.
- **Count (`count` or `size`)**: Counts the number of non-null data points.
- **Minimum (`min`)**: Finds the smallest value in the data.
- **Maximum (`max`)**: Finds the largest value in the data.
- **Median (`median`)**: Determines the middle value in the sorted data.
- **Standard Deviation (`std`)**: Measures the dispersion of the data points from the mean.
- **Variance (`var`)**: Measures the spread of data points.

These functions are crucial for data analysis, as they help in understanding the distribution,  
central tendency, and variability of the data. They can be applied to individual columns or groups  
of data within a DataFrame.




## Counting groups

Calculate the number of groups and number of rows in each group  
with `nunique`, `ngroups`, and `size`.   

```python
#!/usr/bin/python

import pandas as pd 
  
df = pd.read_csv('products.csv') 
print(df['category'].nunique())

g = df.groupby('category')
print(g.ngroups)

print('----------------------')

print(g.size())
```

## Groupby and calculate mean

```python
import pandas as pd

# Load the data from the CSV file
df = pd.read_csv('products.csv')

# Select only numeric columns for the mean calculation
numeric_columns = ['unit_price', 'units_in_stock']

# Group by 'category' and calculate mean for numeric columns
grouped = df.groupby('category')[numeric_columns].mean()

print(grouped)
```



## Group by multiple columns

```python
import pandas as pd

# Sample DataFrame
df = pd.read_csv('products.csv')

# Group by 'category' and 'product_name' and calculate sum of units_in_stock
grouped = df.groupby(['category', 'product_name']).sum()
print(grouped[['units_in_stock']])
```

## Aggregates with multiple functions

```python
import pandas as pd

# Sample DataFrame
df = pd.read_csv('products.csv')

# Group by 'category' and aggregate with multiple functions
grouped = df.groupby('category').agg({'unit_price': ['mean', 'min', 'max'], 'units_in_stock': 'sum'})
print(grouped)
```



## First, last, nth

Take the first, last, nth row from each group. 

```python
#!/usr/bin/python

import pandas as pd 

df = pd.read_csv('products.csv') 
g = df.groupby('category')

print(g.first())
print('----------------------')

print(g.last())
print('----------------------')

print(g.nth(6))
print('----------------------')
```

## Iterage over groups 

```python
import pandas as pd

# Sample DataFrame
df = pd.read_csv('products.csv')

# Group by 'category' and iterate through groups
grouped = df.groupby('category')

for name, group in grouped:
    print(f"Category: {name}")
    print(group)

    print('--------------------------------\n')
```

## Retrieving specific group 

The `get_group` function constructs a DataFrame from the group with the provided name.  

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv('products.csv')
g = df.groupby('category')

res = g.get_group('Seafood')
print(res.to_string(index=False))

print(80 * '-')

res = g.get_group('Beverages')
print(res.to_string(index=False))

print(80 * '-')

res = df[df["category"] == 'Produce']
print(res.to_string(index=False))
```

## The describe function 

The `describe` function gives basic statistics for numerical values.  

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv('products.csv')
g = df.groupby('category')

print(g[['unit_price', 'units_in_stock']].describe())
```


## Aggregate functions from numpy


```python
import pandas as pd
import numpy as np

# Load the data from the CSV file
df = pd.read_csv('products.csv')

# Group by 'category'
g = df.groupby('category')

# Get the group for 'Beverages'
res = g.get_group('Beverages')[['unit_price', 'units_in_stock']]

# Variance
print("Variance:")
print(res.agg(np.var))
print('----------------------------')

# Standard Deviation
print("Standard Deviation:")
print(res.agg(np.std))
print('----------------------------')

# Mean
print("Mean:")
print(res.agg(np.mean))
print('----------------------------')

# Median
print("Median:")
print(res.agg(np.median))
print('----------------------------')

# Maximum
print("Maximum:")
print(res.agg(np.max))
print('----------------------------')

# Minimum
print("Minimum:")
print(res.agg(np.min))
print('----------------------------')

# Sum
print("Sum:")
print(res.agg(np.sum))
print('----------------------------')

# Count
print("Count:")
print(res.agg(np.size))
print('----------------------------')

# Range (custom function)
def np_range(x):
    return np.max(x) - np.min(x)

print("Range:")
print(res.agg(np_range))
print('----------------------------')

# Percentiles (25th, 50th, and 75th percentiles)
print("25th Percentile:")
print(res.agg(lambda x: np.percentile(x, 25)))
print('----------------------------')

print("75th Percentile:")
print(res.agg(lambda x: np.percentile(x, 75)))
print('----------------------------')
```

### Aggregates

- *Variance (`np.var`)*: Measures the dispersion of the data points.
- *Standard Deviation (`np.std`)*: Measures the average distance of the 
   data points from the mean.
- *Mean (`np.mean`)*: Calculates the average value.
- *Median (`np.median`)*: Finds the middle value in the sorted data.
- *Maximum (`np.max`)*: Finds the highest value.
- *Minimum (`np.min`)*: Finds the lowest value.
- *Sum (`np.sum`)*: Calculates the total sum of the values.
- *Count (`np.size`)*: Counts the number of data points.
- *Range (custom function)*: Calculates the difference between the maximum 
   and minimum values.
- *Percentiles (`np.percentile`)*: Calculates specific percentiles of the data 
  (e.g., 25th and 75th percentiles).

These additional aggregations provide a comprehensive view of the data's  
distribution and central tendency, helping you perform detailed data analysis.  


## Group & filter by product count

```python
import pandas as pd

df = pd.read_csv('products.csv')

# Group by 'category'
grouped = df.groupby('category')

# Filter groups with more than 11 products and create a new DataFrame
filtered_groups = grouped.filter(lambda x: len(x) > 11)

# Iterate through each group that meets the filter condition
for name, group in filtered_groups.groupby('category'):
    print(f"Category: {name}")
    print(group)
    print("\n")
```

## Group by price and filter the sum

```python
#!/usr/bin/python

import pandas as pd

df = pd.read_csv('products.csv')
g = df.groupby('category')

res = g.filter(lambda e: e['unit_price'].sum() > 300)
df2 = res.groupby('category')[['unit_price', 'units_in_stock']].sum()
df2.columns=['Sum of price', 'sum of units']
print(df2)

print('---------------------------------')

res = g.filter(lambda e: e['unit_price'].sum() <= 300)
df2 = res.groupby('category')[['unit_price', 'units_in_stock']].sum()
df2.columns=['Sum of price', 'sum of units']
print(df2)
```

## Apply custom function

The custom function is applied to each group using the apply method, which calculates  
the difference in `unit_price` for each category.

The output will display the difference between the maximum and minimum unit prices within each  
category, giving you insight into the price range for each category. The result is a `Series` with  
the category names as the index and the computed differences as values.  

```python
import pandas as pd

df = pd.read_csv('products.csv')

# Define a custom function to apply to each group
def custom_function(group):
    return group['unit_price'].max() - group['unit_price'].min()

# Group by 'category' and apply custom function
result = df.groupby('category').apply(custom_function)
print(result)
```



