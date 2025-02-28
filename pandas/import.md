# Import data


## XML to DataFrame

```python
import pandas as pd

# URL of the XML file
url = "https://webcode.me/users.xml"

# Read the XML data into a DataFrame
df = pd.read_xml(url)

# Display the DataFrame
print(df)
```

## JSON to DataFrame

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

---

JSON file to DataFrame

```python
import pandas as pd

file_name = 'users.json'
df_json = pd.read_json(file_name)

# Flatten the DataFrame
df = pd.json_normalize(df_json['users'])

# Display the DataFrame
print(df)
```

## HTML table to DataFrame

```python
import pandas as pd

# URL of the HTML page containing the table
url = "https://webcode.me/users.html"

# Read the HTML table into a DataFrame
df_list = pd.read_html(url)

# The function returns a list of DataFrames, so we select the first one
df = df_list[0]

# Display the DataFrame
print(df)
```

## Excel to DataFrame

```python
import pandas as pd

file_name = "users.xlsx"

df = pd.read_excel(file_name)
print(df)
```

## CSV to Excel

```python
import pandas as pd

# URL of the CSV file
url = 'https://webcode.me/users.csv'

# Read the CSV content into a pandas DataFrame
data = pd.read_csv(url)

# Write the DataFrame to Excel
data.to_excel('users2.xlsx')

print("Data inserted successfully.")
```


## PostgreSQL to DataFrame

```python
import pandas as pd

# Create the connection string
cs = 'postgresql://postgres:s$cret@localhost/testdb'

# Execute a query to fetch data from the 'users' table
query = "SELECT * FROM users"
df = pd.read_sql_query(query, cs)

print(df)
```


The `.env` file:

```.env
DATABASE_URL=postgresql://postgres:s$cret@localhost/testdb
```

```python
import pandas as pd
from decouple import config

# pip install python-decouple

# Load the connection string from the .env file
cs = config('DATABASE_URL')

# Execute a query to fetch data from the 'users' table
query = "SELECT * FROM users"
df = pd.read_sql_query(query, cs)

# Display the first 15 rows of the DataFrame
print(df.head(15).to_string(index=False))
```

## CSV to SQLite

```python
import pandas as pd
import sqlite3

# URL of the CSV file
url = 'https://webcode.me/users.csv'

# Read the CSV content into a pandas DataFrame
data = pd.read_csv(url)

# Connect to the SQLite database (or create it if it doesn't exist)
with sqlite3.connect('test.db') as con:

    # Write the DataFrame to the users2 table in the SQLite database
    data.to_sql('users2', con, if_exists='replace', index=False)

    print("Data inserted successfully.")
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

