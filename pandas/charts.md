# Charts

## Monthly sales

```python
import pandas as pd
import matplotlib.pyplot as plt

# Step 1: Create a DataFrame
data = {
    'Month': ['January', 'February', 'March', 'April', 'May', 'June', 
              'July', 'August', 'September', 'October', 'November', 'December'],
    'Sales': [450, 750, 1050, 1350, 1650, 1950, 
              2250, 2550, 2850, 3150, 3450, 3750]
}

df = pd.DataFrame(data)

# Step 2: Plot the data
plt.figure(figsize=(10, 5))
plt.plot(df['Month'], df['Sales'], marker='o', linestyle='-', color='b')

# Step 3: Customize the chart
plt.title('Monthly Sales Data')
plt.xlabel('Month')
plt.ylabel('Sales ($)')
plt.grid(True)
plt.xticks(rotation=45)  # Rotate month labels for better readability

# Step 4: Display the chart
plt.tight_layout()  # Adjust layout to make room for rotated labels
plt.show()
```

## Line chart for unit price trend over product Ids

```python
import pandas as pd
import matplotlib.pyplot as plt

# Read the CSV file
df = pd.read_csv('products.csv')

# Display the DataFrame to verify the data
print("DataFrame:")
print(df)

# Plot a line chart for unit price trend over product IDs
plt.figure(figsize=(10, 5))
plt.plot(df['id'], df['unit_price'], marker='o', linestyle='-', color='green')
plt.xlabel('Product ID')
plt.ylabel('Unit Price ($)')
plt.title('Unit Price Trend Over Product IDs')
plt.grid(True)
plt.tight_layout()
plt.show()
```

## Barchart for unit price of each product

```python
import pandas as pd
import matplotlib.pyplot as plt

# Read the CSV file
df = pd.read_csv('products.csv')

# Plot a horizontal bar chart for unit price of each product
plt.figure(figsize=(12, 14))  # Increase the figure size for better readability
plt.barh(df['product_name'], df['unit_price'], color='skyblue', height=0.9)
plt.xlabel('Unit Price ($)', fontsize=14)  # Increase font size for axis labels
plt.ylabel('Product Name', fontsize=14)  # Increase font size for axis labels
plt.title('Unit Price of Each Product', fontsize=12)  # Increase font size for title
plt.xticks(fontsize=10)  # Increase font size for x-axis tick labels
plt.yticks(fontsize=7)  # Increase font size for y-axis tick labels
plt.grid(axis='x', linestyle='--', alpha=0.7)  # Add grid lines for better readability
plt.tight_layout()

# plt.show()
plt.savefig('barchart.png')
```

## Distributions of units in stock by category

```python
import pandas as pd
import matplotlib.pyplot as plt
from decimal import Decimal

# Read the CSV file
df = pd.read_csv('products.csv')

# Convert unit_price to Decimal
df['unit_price'] = df['unit_price'].apply(Decimal)

# Group by category and sum the units in stock
category_units_in_stock = df.groupby('category')['units_in_stock'].sum()

# Plot a pie chart for the distribution of units in stock by category
plt.figure(figsize=(8, 8))
category_units_in_stock.plot(kind='pie', autopct='%1.1f%%', startangle=140, colors=plt.cm.Paired.colors)
plt.title('Distribution of Units in Stock by Category')
plt.ylabel('')  # Hide the y-label for the pie chart
plt.tight_layout()
plt.show()
```

## Potential sales with pie chart

```python
import pandas as pd
import matplotlib.pyplot as plt

# Read the CSV file
df = pd.read_csv('products.csv')

# Calculate potential sales for each product
df['potential_sales'] = df['unit_price'] * df['units_in_stock']

# Group by category and sum the potential sales
category_potential_sales = df.groupby('category')['potential_sales'].sum()

# Plot a pie chart for the distribution of potential sales by category
plt.figure(figsize=(8, 8))
category_potential_sales.plot(kind='pie', autopct='%1.1f%%', startangle=140, colors=plt.cm.Paired.colors)
plt.title('Distribution of Potential Sales by Category')
plt.ylabel('')  # Hide the y-label for the pie chart
plt.tight_layout()
plt.show()
```


## Horizontal bar chart from HTML table

```python
import pandas as pd
import matplotlib.pyplot as plt

url = 'https://webcode.me/users.html'

# Read the HTML table into a DataFrame
df = pd.read_html(url)[0]
print(df.columns)
df.rename(columns={'Id': 'id', 'First Name': 'first_name', 'Last Name': 'last_name',
          'Occupation': 'occupation', 'Salary ($)': 'salary'}, inplace=True)

# Create full names using Pandas' vectorized string operations
df['full_name'] = df['first_name'] + ' ' + df['last_name']
print(df['full_name'])

# Plot the horizontal bar chart
plt.figure(figsize=(12, 14))
plt.barh(df['full_name'], df['salary'], color='skyblue', height=0.9)
plt.xlabel('Salary ($)', fontsize=14)
plt.ylabel('Full Name', fontsize=14)  # Update y-label
plt.title('Salaries', fontsize=16)
plt.yticks(fontsize=10)

# Add grid lines for better readability
plt.grid(axis='x', linestyle='--', alpha=0.7)
plt.tight_layout()

# Save the plot as a PNG file
plt.savefig('barchart.png')
# plt.show()
```

## Horizontal bar with values 

```python
import pandas as pd
import matplotlib.pyplot as plt

url = 'https://webcode.me/users.html'

# Read the HTML table into a DataFrame
df = pd.read_html(url)[0]
print(df.columns)

# Rename the columns for easier access
df.rename(columns={'Id': 'id', 'First Name': 'first_name', 'Last Name': 'last_name',
                   'Occupation': 'occupation', 'Salary ($)': 'salary'}, inplace=True)

# Create full names using Pandas' vectorized string operations
df['full_name'] = df['first_name'] + ' ' + df['last_name']
print(df['full_name'])

# Plot the horizontal bar chart
plt.figure(figsize=(12, 14))
bars = plt.barh(df['full_name'], df['salary'], color='skyblue', height=0.9)
plt.xlabel('Salary ($)', fontsize=14)
plt.ylabel('Full Name', fontsize=14)
plt.title('Salaries', fontsize=16)
plt.yticks(fontsize=10)

# Add numbers to each bar
plt.bar_label(bars, fmt='%d', fontsize=10, label_type='edge')

# Add grid lines for better readability
plt.grid(axis='x', linestyle='--', alpha=0.7)
plt.tight_layout()

# Save the plot as a PNG file (optional)
# plt.savefig('barchart.png')

# Show the plot
plt.show()
```


