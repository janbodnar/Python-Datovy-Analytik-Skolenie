# Import data


## From XML

```python
import pandas as pd

# URL of the XML file
url = "https://webcode.me/users.xml"

# Read the XML data into a DataFrame
df = pd.read_xml(url)

# Display the DataFrame
print(df)
```

## From JSON

```python
import pandas as pd
import requests

# URL of the JSON file
url = "https://webcode.me/users.json"

# Fetch the JSON data
response = requests.get(url)
json_data = response.json()

# Normalize the JSON data into a flat table
df = pd.json_normalize(json_data['users'])

# Display the DataFrame
print(df)
```

---

```python
import pandas as pd

# URL of the JSON file
url = "https://webcode.me/users.json"

# Read the JSON data into a DataFrame
df_json = pd.read_json(url)

# Flatten the DataFrame
df = pd.json_normalize(df_json['users'])

# Display the DataFrame
print(df)
```


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

## BTC from Binance

```python
import pandas as pd
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

# Convert the data to a Pandas DataFrame
df = pd.DataFrame(data, columns=['Open Time', 'Open', 'High', 'Low', 'Close', 'Volume', 
                                 'Close Time', 'Quote Asset Volume', 'Number of Trades', 
                                 'Taker Buy Base Asset Volume', 'Taker Buy Quote Asset Volume', 'Ignore'])
df['Open Time'] = pd.to_datetime(df['Open Time'], unit='ms')
df.set_index('Open Time', inplace=True)

# Display the DataFrame
print(df.loc[:,['Open', 'High', 'Low', 'Close', 'Volume']])
```

