# ccxt

The `ccxt` is a JavaScript/Python/PHP library for cryptocurrency trading and  
e-commerce. It supports many crypto exchange markets and merchant APIs.  

It provides quick access to market data for storage, analysis, visualization,  
indicator development, algorithmic trading, strategy backtesting and bot  
programming.

Most exchanges provide both public and private APIs. For the private API, we  
need to provide the API keys that we generate in our exchange account.  


`$ pip install ccxt`

We install the module.

## Python ccxt exchanges

In the first example, we print all the available exchanges. Note that not all  
exchanges are fully supported and some may not be working.  

```python
import ccxt

print(ccxt.exchanges)
print(len(ccxt.exchanges))
```

We get the available exchanges via the exchanges attribute.

## Exchange status

The status of an exchange is determined with fetch_status.

```python
import asyncio
import ccxt.async_support as ccxt

exchanges = [ccxt.__getattribute__(e)() for e in ccxt.exchanges]

async def status(exchange):

    try:

        data = await exchange.fetch_status()

    except Exception as e:

        data = str(e)
        stat = data[:60] + ('..' if len(data) > 60 else '')
        data = {'status': stat}

    finally: 
        await exchange.close()

    return (exchange.name, data)


async def launch():

    resps = await asyncio.gather(*map(status, exchanges))

    for name, e in resps:
        stat = e['status']
        print(f"{name}: {stat}")

asyncio.run(launch())
```

The program checks the status of all available exchanges.  

```python
import ccxt.async_support as ccxt
```

Since we need to launch dozens of requests, the code is run asynchronously to  
avoid blocking.

```python
async def status(exchange):
```

The status code is determined in the asynchronous status function.

```python
exchanges = [ccxt.__getattribute__(e)() for e in ccxt.exchanges]
```

We build the list of available exchange objects. Since the `ccxt.exchanges`  
returns the list of exchange attributes, we need to call them to get exchange  
objects.

```python
try:

    data = await exchange.fetch_status()
```

We call the fetch_status in the try block.

```python
except Exception as e:

    data = str(e)
    stat = data[:60] + ('..' if len(data) > 60 else '')
    data = {'status': stat}
```

Most exchanges return error codes in JSON format. Some, however, return HTML  
responses. This would clutter our terminal. If the response data is larger than  
60 characters, we shorten it.  

```python
finally: 
    await exchange.close()
```

In the end is it necessary to close the connection to the exchange.

```python
return (exchange.name, data)
```

The function returns the exchange name and the status data for each call.  

```python
async def launch():

    resps = await asyncio.gather(*map(status, exchanges))

    for name, e in resps:
        stat = e['status']
        print(f"{name}: {stat}")
```

We apply the status function on the list of exchanges. We go over the responses  
in a for loop and print the name and status for each exchange.  

```python
asyncio.run(launch())
```

The run function starts the loop and handles the asynchronous operations.

## Fetching ticker price

The `fetch_ticker` function fetches a price ticker. It is a statistical
calculation with the information calculated over the past 24 hours for a
specific symbol.

```python
import asyncio
import ccxt.async_support as ccxt
from pprint import pprint

async def ticker():

    bybit = ccxt.bybit()

    res = await bybit.fetch_ticker('LTC/USDT')
    pprint(res)

    await bybit.close()

asyncio.run(ticker())
```

The program retrieves the ticker information for the `LTC/USDT` symbol on the
Bybit exchange.

```python
pprint(res)
```

The `pprint` function pretty-prints the output.

```
$ ./main.py
{'ask': 88.08,
 'askVolume': 10.5,
 'average': 87.37,
 'baseVolume': 57756.04142,
 'bid': 88.07,
 'bidVolume': 58.67049,
 'change': 1.4,
 'close': 88.07,
 'datetime': None,
 'high': 88.48,
 'info': {'ask1Price': '88.08',
          'ask1Size': '10.5',
          'bid1Price': '88.07',
          'bid1Size': '58.67049',
          'highPrice24h': '88.48',
          'lastPrice': '88.07',
          'lowPrice24h': '84.22',
          'prevPrice24h': '86.67',
          'price24hPcnt': '0.0162',
          'symbol': 'LTCUSDT',
          'turnover24h': '5010476.0735012',
          'usdIndexPrice': '88.11038504',
          'volume24h': '57756.04142'},
 'last': 88.07,
 'low': 84.22,
 'open': 86.67,
 'percentage': 1.62,
 'previousClose': None,
 'quoteVolume': 5010476.0735012,
 'symbol': 'LTC/USDT:USDT',
 'timestamp': None,
 'vwap': 86.7524149909303}
```

The ticker information includes the current (last), open, high, low, close,  
volume values among others.  
 
## Binance symbols

A symbol is a trading pair. It consists of a base asset and a quote asset. Given  
a symbol `BTCBUSD`, `BTC` stands for the base asset and `BUSD` stands for the  
quote asset.  

```python
from datetime import datetime

import ccxt
from rich import box
from rich.console import Console
from rich.table import Table

binance = ccxt.binance()

markets = binance.load_markets()

print(f'Binance has {len(binance.symbols)} symbols')

data = list(ccxt.Exchange.keysort(markets).items())

now = f'{datetime.today()}'
table = Table(title='Binance symbols', box=box.ASCII,
              caption=now, caption_justify='left')

table.add_column('id', style='steel_blue')
table.add_column('symbol')
table.add_column('base', style='cadet_blue')
table.add_column('quote', style='cadet_blue')

for (_, v) in data:
    table.add_row(v['id'], v['symbol'], v['base'], v['quote'])

console = Console()
console.print(table)
```

The program lists all available symbols on the Binance exchange. We use the  
rich's Table to display all data in a neat table.  

```python
binance = ccxt.binance()
```

We get the binance exchange.

```python
markets = binance.load_markets()
```

With load_markets we get all markets on Binance. Different markets (spot,
futures) have different pairs.

```python
data = list(ccxt.Exchange.keysort(markets).items())
```

We sort the data.

```python
now = f'{datetime.today()}'
table = Table(title='Binance symbols', box=box.ASCII,
                caption=now, caption_justify='left')

table.add_column('id', style='steel_blue')
table.add_column('symbol')
table.add_column('base', style='cadet_blue')
table.add_column('quote', style='cadet_blue')
```

The data is dispalyed in a table. The table has four columns.

for (_, v) in data:
    table.add_row(v['id'], v['symbol'], v['base'], v['quote'])
```

We add the data to the table.

```python
console = Console()
console.print(table)
```

The table is printed to the console.

## Fetch balance

The `fetch_balance` function queries for balance and gets the amount of funds
available for trading or funds locked in orders. Since this is private
information, we need to provide the keys.

```python
import asyncio
import os
import ccxt.async_support as ccxt

async def balance():

    binance = ccxt.binance({
        'apiKey': os.getenv('BINANCE_API_KEY'),
        'secret': os.getenv('BINANCE_SECRET_KEY'),
    })

    res = await binance.fetch_balance()
    data = [(coin, balance) for coin, balance in res['total'].items() if balance > 0]

    for name, amount in data:
        print(f'{name:<4} {amount:>18.8f}')

    await binance.close()


asyncio.run(balance())
```

We get all balances greater than zero from Binance.

```python
binance = ccxt.binance({
    'apiKey': os.getenv('BINANCE_API_KEY'),
    'secret': os.getenv('BINANCE_SECRET_KEY'),
})
```

We provide the API and the secret key. The keys are loaded from the environment  
variables.  

```python
res = await binance.fetch_balance()
```

We get all balances.

```python
data = [(coin, balance) for coin, balance in res['total'].items() if balance > 0]
```

With Python list comprehension, we get only balance with amount greater than  
zero.

```python
for name, amount in data:
    print(f'{name:<4} {amount:>18.8f}')
```

We use Python formatting options to display the data neatly. The symbols are  
left-aligned. The amounts are right-aligned. The values are shown with 8 decimal  
places.

## Order book

An order book is a list of current buy orders (bids) and sell orders (asks) for  
a specific asset. An order book lists buy/sell order prices and the amount of  
the units of tokens to buy and sell.  

The bids are represented by green numbers, while the asks by red numbers.  

```python
import asyncio
import ccxt.async_support as ccxt
from pprint import pprint

green = '\033[92m'
red = '\033[91m'
term = '\033[0m'

async def order_book():

    bitrue = ccxt.bitrue()

    order_book = await bitrue.fetch_order_book('ETH/USDT', limit=20)
    bids = order_book['bids']
    asks = order_book['asks']

    for p, a in bids:
        print(f'{green}{p:.2f} {a:>12.5f}{term}')

    print('----------------------')

    for p, a in asks:
        print(f'{red}{p:.2f} {a:>12.5f}{term}')

    await bitrue.close()


asyncio.run(order_book())
```

The program shows the order book for the ETH/USDT symbol on the Bitrue exchange.  

```python
green = '\033[92m'
red = '\033[91m'
term = '\033[0m'
```

We display the values in colour. These are the codes for green, red colours and  
colour termination.  
  
```python
order_book = await bitrue.fetch_order_book('ETH/USDT', limit=20)
```

We retrieve the order book with fetch_order_book. We get the last 20 values.  

```python
bids = order_book['bids']
asks = order_book['asks']
```

From the order book data, we get the bids and asks.  

```python
for p, a in bids:
    print(f'{green}{p:.2f} {a:>12.5f}{term}')

print('----------------------')

for p, a in asks:
    print(f'{red}{p:.2f} {a:>12.5f}{term}')
```

First, we display the bids in green and then the asks in red.  

## My trades

The fetch_my_trades retrieves all trades made by the user.

```python
import os
import asyncio
import ccxt.async_support as ccxt
from datetime import datetime


async def trades():

    binance = ccxt.binance({
        'apiKey': os.getenv('BINANCE_API_KEY'),
        'secret': os.getenv('BINANCE_SECRET_KEY'),
    })

    symbol = 'LTC/BUSD'
    date = '2023-03-20T00:00:00'
    start_time = binance.parse8601(date)

    print(f'Fetching {symbol} trades since {binance.iso8601(start_time)}')
    trades = await binance.fetch_my_trades(symbol, start_time)

    await binance.close()

    print(f'Fetched {len(trades)} trades')

    for trade in trades:

        d = datetime.fromisoformat(trade['datetime'])
        print(f"{d:%m/%d/%Y} {trade['amount']} {trade['side']}")


asyncio.run(trades())
```

The example retrieves all LTC/BUSD trades.

```python
symbol = 'LTC/BUSD'
```

The pair is LTC/BUSD.

```python
date = '2023-03-20T00:00:00'
start_time = binance.parse8601(date)
```

We show all trades from the specified date. The `binance.parse8601` is a helper  
function which transforms the string datetime into the Unix time.  

```python
trades = await binance.fetch_my_trades(symbol, start_time)
```

We get all the LTC/BUSD trades since the datetime with `fetch_my_trades`.

```python
for trade in trades:

    d = datetime.fromisoformat(trade['datetime'])
    print(f"{d:%m/%d/%Y} {trade['amount']} {trade['side']}")
```

We print the retrieved data to the console. We show the date, the amount, and  
the side (buy or sell).  

## Candlestick data

The `fetch_ohlcv` fetches historical candlestick data containing the open, high,  
low, and close price, and the volume of a market.  

```python
import asyncio
import ccxt.async_support as ccxt

from rich import box
from rich.console import Console
from rich.table import Table
from datetime import datetime


async def ohlc():

    binance = ccxt.binance()
    data = await binance.fetch_ohlcv('BTC/USDT', '1d', limit=20)
    await binance.close()

    now = f'{datetime.today()}'
    table = Table(title='Binance - BTC/USDT', box=box.ASCII,
                  caption=now, caption_justify='left')

    table.add_column('Date', justify='center', style='steel_blue')
    table.add_column('Open')
    table.add_column('High')
    table.add_column('Low')
    table.add_column('Close')
    table.add_column('Volume', justify='right', style='cadet_blue')

    for e in data:

        d = datetime.utcfromtimestamp(e[0]/1000.0)
        table.add_row(f'{d:%m/%d/%Y}', f'{e[1]:.2f}', f'{e[2]:.2f}',
                      f'{e[3]:.2f}', f'{e[4]:.2f}', f'{e[5]:.5f}')

    console = Console()
    console.print(table)

asyncio.run(ohlc())
```

The example retrieves candlestick data for `BTC/USDT` on Binance for the last 20
days.

```
data = await binance.fetch_ohlcv('BTC/USDT', '1d', limit=20)
```

We fetch the data. The timeframe is 1 day and the limit is 20 values.
