# Priklady



## Opakovanie

Dataset: `countries.csv`

- list all countries in Europe
- print total world population
- extract 3 cols (name, capital, population) and 50 rows into `countries_3c_50r.csv`
- print all continents
- calculate all population in Europe
- list countries with population > 300 mil
- list countries with population < 10 mil
- list top 10 European countries with largest populations
- list the smallest country by area
- list the three smallest countries by area
- list the country with largest population
- sum populations of all continents


## Write chart to Excel 

```python
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

# Generate random data
x = np.random.randint(100, size=(100))
y = np.random.randint(100, size=(100))
colors = np.random.randint(100, size=(100))
sizes = 10 * np.random.randint(100, size=(100))

# Create scatter plot
plt.scatter(x, y, c=colors, s=sizes, alpha=0.5, cmap='nipy_spectral')
plt.colorbar()

# Save the chart as an image
plt.savefig('scatter_plot.png')

# Show the plot
plt.show()

# Create a Pandas DataFrame
df = pd.DataFrame({
    'x': x,
    'y': y,
    'colors': colors,
    'sizes': sizes
})

# Write the DataFrame to an Excel file with the image
with pd.ExcelWriter('chart_with_data.xlsx', engine='xlsxwriter') as writer:
    df.to_excel(writer, sheet_name='Data', index=False)

    # Access the XlsxWriter workbook and worksheet objects
    workbook = writer.book
    worksheet = writer.sheets['Data']

    # Insert the image into the worksheet
    worksheet.insert_image('E2', 'scatter_plot.png')
```





Filter males in Legal & Finance

```python
import pandas as pd

# Read data from the CSV file
employees_df = pd.read_csv('employees.csv')

# Filter for males in the Legal and Finance teams
filtered_df = employees_df[(employees_df['Gender'] == 'Male') &
                           (employees_df['Team'].isin(['Legal', 'Finance']))]

print(filtered_df)
```


## Converters

Float to Decimal

```python
import pandas as pd
from decimal import Decimal

# Define the conversion function
def to_decimal(value):
    return Decimal(value)

# Load the products dataset with converters for specific columns
products_df = pd.read_csv('products.csv', converters={
    'unit_price': to_decimal,
})

# Calculate the mean using the Decimal type
mean_val = sum(products_df['unit_price']) / len(products_df)

print(products_df.dtypes)
print(type(mean_val))
print("Mean unit price:", mean_val)
```



## Sort by multiple columns 

```python
import pandas as pd

# Read data from the CSV file
df = pd.read_csv('products.csv')

# Sort the DataFrame by category and units_in_stock
df_sorted = df.sort_values(by=['category', 'units_in_stock'], ascending=[True, False])

# Display the sorted DataFrame
print(df_sorted)
```



## Most common values

```python
from collections import Counter

grades_numeric = [1, 2, 1, 1, 3, 4, 4, 5, 1, 2, 3, 1, 1, 2, 3]
grades_alpha = ['A', 'B', 'B', 'C', 'C', 'B', 'F', 'FX', 'C', 'D']

# Find the most common elements
counter_numeric = Counter(grades_numeric)
counter_alpha = Counter(grades_alpha)

# Get the most common elements and their counts
most_common_numeric = counter_numeric.most_common()
most_common_alpha = counter_alpha.most_common()

# Extract the second and third most common values
second_most_common_numeric = most_common_numeric[1][0]
third_most_common_numeric = most_common_numeric[2][0]

second_most_common_alpha = most_common_alpha[1][0]
third_most_common_alpha = most_common_alpha[2][0]

print(f"Second most common numeric grade: {second_most_common_numeric}")
print(f"Third most common numeric grade: {third_most_common_numeric}")

print(f"Second most common alphabetic grade: {second_most_common_alpha}")
print(f"Third most common alphabetic grade: {third_most_common_alpha}")
```



## Partitioning

```python
from funcy import split

values = [1, 2, -3, 4, 5, -6, 7, -8, 9, 10]

neg, pos = split(lambda e: e < 0, values)

print(list(neg))
print(list(pos))
```



## Riesenie s std kniznicami

```python
import requests
import csv

# URL to fetch the JSON data
url = "https://webcode.me/users.json"

# Fetch the JSON data from the URL
response = requests.get(url)
data = response.json()

# Extract the list of users
users = data["users"]

# Define the CSV file name
csv_file = "users.csv"

# Write the data to a CSV file
with open(csv_file, mode='w', newline='') as file:
    writer = csv.writer(file)
    # Write the header
    writer.writerow(["id", "first_name", "last_name", "email"])
    # Write the user data
    for user in users:
        writer.writerow([user["id"], user["first_name"], user["last_name"], user["email"]])

print(f"Data has been successfully written to {csv_file}.")
```


## Riesenie s Pandas

```python
import requests
import pandas as pd

# URL to fetch the JSON data
url = "https://webcode.me/users.json"

# Fetch the JSON data from the URL
response = requests.get(url)
data = response.json()

# Extract the list of users
users = data["users"]

# Create a DataFrame from the list of users
df = pd.DataFrame(users)

# Define the CSV file name
csv_file = "users2.csv"

# Write the DataFrame to a CSV file
df.to_csv(csv_file, index=False)

print(f"Data has been successfully written to {csv_file}.")
```


