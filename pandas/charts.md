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

## Line chart for unit price trend over product IDs

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


