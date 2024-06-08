# Finplot

## finplot & yfinance

```python
import finplot as fplt
import yfinance

# Download AAPL data
df = yfinance.download('AAPL',  start="2023-01-01", end="2024-06-07", interval='1d')

print(df.head())

fplt.candlestick_ochl(df[['Open', 'Close', 'High', 'Low']])
fplt.show()
```

## Load from CSV

```python
import pandas as pd

import finplot as fplt
df = pd.read_csv(
    'https://raw.githubusercontent.com/plotly/datasets/master/finance-charts-apple.csv')

df['Date'] = pd.to_datetime(df['Date'])
df.set_index('Date', inplace=True)
fplt.candlestick_ochl(df[['AAPL.Open', 'AAPL.Close', 'AAPL.High', 'AAPL.Low']])

fplt.show()
```

## dark theme

```python
import finplot as fplt
import yfinance

df = yfinance.download('MSFT', start="2023-01-01", end="2024-06-07", interval='1d')

# must set before creating plot
w = fplt.foreground = '#eef'
b = fplt.background = fplt.odd_plot_background = '#181a1b'
fplt.candle_bull_color = fplt.volume_bull_color = fplt.candle_bull_body_color = fplt.volume_bull_body_color = '#352'
fplt.candle_bear_color = fplt.volume_bear_color = '#810'
fplt.cross_hair_color = w+'a'

fplt.candlestick_ochl(df[['Open', 'Close', 'High', 'Low']])
fplt.show()
```

## Create grid

```python
import finplot as fplt
import yfinance

df = yfinance.download('MSFT', start="2023-01-01", end="2024-06-07", interval='1d')

# must set before creating plot
w = fplt.foreground = '#eef'
b = fplt.background = fplt.odd_plot_background = '#181a1b'
fplt.candle_bull_color = fplt.volume_bull_color = fplt.candle_bull_body_color = fplt.volume_bull_body_color = '#352'
fplt.candle_bear_color = fplt.volume_bear_color = '#810'
fplt.cross_hair_color = w+'a'

ax = fplt.create_plot()
ax.set_visible(crosshair=False, xaxis=True, yaxis=True, xgrid=True, ygrid=True)

fplt.candlestick_ochl(df[['Open', 'Close', 'High', 'Low']], ax=ax)
fplt.show()
```

## Long-term BTC

```python
from datetime import date
import finplot as fplt
import requests
import pandas as pd

now = date.today().strftime('%Y-%m-%d')
r = requests.get('https://www.bitstamp.net/api-internal/tradeview/price-history/BTC/USD/?step=86400&start_datetime=2011-08-18T00:00:00.000Z&end_datetime=%sT00:00:00.000Z' % now)
df = pd.DataFrame(r.json()['data']).astype({'timestamp':int, 'open':float, 'close':float, 'high':float, 'low':float}).set_index('timestamp')

# plot price
fplt.create_plot('Bitcoin 2011-%s'%now.split('-')[0], yscale='log')
fplt.candlestick_ochl(df['open close high low'.split()])

# monthly separator lines
months = pd.to_datetime(df.index, unit='s').strftime('%m')
last_month = ''
for x,(month,price) in enumerate(zip(months, df.close)):
    if month != last_month:
        fplt.add_line((x-0.5, price*0.5), (x-0.5, price*2), color='#bbb', style='--')
    last_month = month

fplt.show()
```
