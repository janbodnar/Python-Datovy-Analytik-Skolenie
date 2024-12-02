# Import data

## Stocks from Yahoo

```python
import yfinance as yf
import pandas as pd

# Define the ticker symbol
ticker_symbol = 'AAPL'

# Get data on this ticker
ticker_data = yf.Ticker(ticker_symbol)

# Get the historical prices for this ticker
df = ticker_data.history(period='1y')

# Ensure the date contains only the date part
df.index = df.index.date

# Display the DataFrame
print(df.head())
```
