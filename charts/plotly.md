# Plotly


*Plotly* is an open-source graphing library that enables the creation of  
interactive, publication-quality graphs online. It's widely used in data  
analysis, data visualization, and machine learning to create detailed and  
interactive charts, dashboards, and plots.  

### Key Features:
1. *Interactivity*: Plotly plots are highly interactive, allowing users to  
   hover, zoom, and filter data points.  
2. *Integration*: Works seamlessly with popular data science languages like  
   Python, R, and JavaScript.  
3. *Versatility*: Supports a wide range of plot types, including line charts,  
   scatter plots, bar charts, heatmaps, 3D plots, and more.  
4. *Customizability*: Offers extensive customization options to tailor  
   visualizations to specific needs.  
5. *Ease of Use*: Provides user-friendly APIs that simplify the creation of  
   complex visualizations.  

### Common Usage:

1. *Data Visualization*:
   - Creating interactive line charts, bar charts, and scatter plots to analyze  
     trends and relationships.  
   - Generating 3D scatter plots and surface plots for multidimensional data  
     analysis.  

2. *Dashboards*:
   - Building dynamic and interactive dashboards to monitor business metrics,  
     scientific data, or personal projects.  
   - Using Dash, Plotly's web application framework, to combine Plotly graphs  
     with interactive controls.  

3. *Geographical Plots*:
   - Creating choropleth maps to visualize geographical data, such as population  
     density or election results.  
   - Generating scatter plots on maps to show location-based data points.  

4. *Statistical Analysis*:  
   - Visualizing statistical data through histograms, box plots, and violin  
     plots to understand distributions.  
   - Creating heatmaps to identify correlations in datasets.   

5. *Machine Learning*:  
   - Plotting results of machine learning models, such as decision boundaries  
     and confusion matrices.  
   - Visualizing feature importance and model performance metrics.  

6. *Scientific Research*:  
   - Creating detailed plots for scientific publications and presentations.  
   - Sharing interactive visualizations with collaborators and the broader  
     scientific community.  

```python
import plotly.express as px
import pandas as pd

# Sample data
data = {'Year': [2010, 2011, 2012, 2013, 2014],
        'Sales': [100, 200, 300, 400, 500]}

# Create a DataFrame
df = pd.DataFrame(data)

# Create a line chart
fig = px.line(df, x='Year', y='Sales', title='Sales Over Time')

# Show the plot
fig.show()
```

## Average unit price by category - bar chart

```python
import pandas as pd
import plotly.express as px
from decimal import Decimal

df = pd.read_csv('products.csv')

# Convert unit_price to Decimal for accurate calculations
df['unit_price'] = df['unit_price'].apply(Decimal)

# Calculate average unit price by category
avg_unit_price_by_category = df.groupby('category')['unit_price'].mean().reset_index()

# Create a bar chart
fig = px.bar(avg_unit_price_by_category, x='category', y='unit_price',
             title='Average Unit Price by Category',
             labels={'unit_price': 'Average Unit Price ($)', 'category': 'Category'},
             color='unit_price', color_continuous_scale='Viridis')

# Show the plot
fig.show()
```


## Units in stock - line chart

```python
import pandas as pd
import plotly.express as px
from decimal import Decimal

df = pd.read_csv('products.csv')

# Convert unit_price to Decimal for accurate calculations
df['unit_price'] = df['unit_price'].apply(Decimal)

# Create a line chart
fig = px.line(df, x='product_name', y='units_in_stock', title='Units in Stock Over Products',
              labels={'product_name': 'Product Name', 'units_in_stock': 'Units in Stock'},
              markers=True)

fig.show()
```

## Total units in stock by category - pie chart 

```python
import pandas as pd
import plotly.express as px
from decimal import Decimal

df = pd.read_csv('products.csv')

# Calculate total units in stock by category
total_units_by_category = df.groupby('category')['units_in_stock'].sum().reset_index()

# Create a pie chart
fig = px.pie(total_units_by_category, values='units_in_stock', names='category',
             title='Distribution of Total Units in Stock by Category',
             color_discrete_sequence=px.colors.sequential.RdBu)

fig.show()
```

## Products by Category and Units in Stock - treemap

```python
import pandas as pd
import plotly.express as px
from decimal import Decimal

# Read the CSV file
df = pd.read_csv('products.csv')

# Convert unit_price to Decimal for accurate calculations
df['unit_price'] = df['unit_price'].apply(Decimal)

# Create a treemap
fig = px.treemap(df, path=['category', 'product_name'], values='units_in_stock',
                 title='Hierarchical View of Products by Category and Units in Stock',
                 color='unit_price', color_continuous_scale='Blues')

fig.show()
```

## Total units in stock by category - scatter chart 

```python
import pandas as pd
import plotly.express as px
from decimal import Decimal

df = pd.read_csv('products.csv')

# Convert unit_price to Decimal for accurate calculations
df['unit_price'] = df['unit_price'].apply(Decimal)

# Group by category and sum the units in stock
category_units = df.groupby('category')['units_in_stock'].sum().reset_index()

# Create a scatter plot
fig = px.scatter(category_units, x='category', y='units_in_stock',
                 title='Total Units in Stock by Category',
                 labels={'units_in_stock': 'Total Units in Stock', 'category': 'Category'},
                 size='units_in_stock', color='category', hover_name='category')

fig.show()
```

## Candlestics for BTC price

```python
import pandas as pd
import plotly.graph_objects as go
import requests

# Define the Binance API endpoint and parameters
url = "https://api.binance.com/api/v3/klines"
params = {
    'symbol': 'BTCUSDT',
    'interval': '1d',
    'limit': 30
}

# Fetch data from Binance API
response = requests.get(url, params=params)
data = response.json()

# Process the data to extract OHLC (open, high, low, close) prices
df = pd.DataFrame(data, columns=[
    'timestamp', 'open', 'high', 'low', 'close', 'volume', 'close_time',
    'quote_asset_volume', 'number_of_trades', 'taker_buy_base_asset_volume',
    'taker_buy_quote_asset_volume', 'ignore'
])

# Convert the 'open', 'high', 'low', and 'close' columns to numeric
df['open'] = pd.to_numeric(df['open'])
df['high'] = pd.to_numeric(df['high'])
df['low'] = pd.to_numeric(df['low'])
df['close'] = pd.to_numeric(df['close'])

# Convert timestamp to date
df['timestamp'] = pd.to_datetime(df['timestamp'], unit='ms')

# Create a candlestick chart
fig = go.Figure(data=[go.Candlestick(
    x=df['timestamp'],
    open=df['open'],
    high=df['high'],
    low=df['low'],
    close=df['close']
)])

# Update layout for better readability
fig.update_layout(
    title='Bitcoin (BTC) Candlestick Chart Over the Last 30 Days',
    xaxis_title='Date',
    yaxis_title='Price (USDT)',
    xaxis_rangeslider_visible=False
)

# Show the plot
fig.show()
```


