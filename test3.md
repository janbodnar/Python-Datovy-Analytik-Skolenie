# Priklady

## NBS kurzovy listok


```python
import csv
import httpx
from io import StringIO 

url = 'https://nbs.sk/export/sk/exchange-rate/2024-09-12/csv'

resp = httpx.get(url)
csv_data = resp.text
csv_data2 = csv_data.replace('\ufeff', '')

f = StringIO(csv_data2)

reader = csv.DictReader(f, delimiter=';')

for row in reader:
    print(row['Dátum'])
    print(f"1 euro is {row['USD']} USD")
    print(f"1 euro is {row['JPY']} JPY")
    print(f"1 euro is {row['CZK']} CZK")
    print(f"1 euro is {row['HUF']} HUF")
    print(f"1 euro is {row['GBP']} GBP")
```

## web scrape & write to PostgreSQL

```python
from selectolax.parser import HTMLParser
import httpx
import psycopg

def parse_data(url):

    r = httpx.get(url)
    html = r.text

    tree = HTMLParser(html)

    trs = tree.css('tr')
    countries = []

    for tr in trs:

        tds = []

        for e in tr.iter():
            tds.append(e.text())
        countries.append(tds)

    return countries


def save_data_db(countries):

    cs = "dbname='testdb' user='postgres' password='postgres'"

    with psycopg.connect(cs) as con:
            
        with con.cursor() as cur:

            cur.execute('DROP TABLE IF EXISTS countries')
            cur.execute('CREATE TABLE countries(id serial PRIMARY KEY, name VARCHAR(255), population INTEGER)')
            cur.executemany('INSERT INTO countries(id, name, population) VALUES(%s, %s, %s)', countries[1:])
                 

url = 'https://webcode.me/countries.html' 
countries = parse_data(url)

save_data_db(countries)
```


## web scrape

get nth row of the table.  

```python
from selectolax.parser import HTMLParser

import httpx

url = 'https://webcode.me/countries.html'
r = httpx.get(url)

html = r.text

tree = HTMLParser(html)

trs = tree.css('tr')
tr = tree.css_first('tbody tr:nth-child(1)')

for td in tr.iter():
    print(td.text())
```

Parse all countries into a list  

```python
from selectolax.parser import HTMLParser

import httpx

url = 'https://webcode.me/countries.html'
r = httpx.get(url)

html = r.text

tree = HTMLParser(html)

trs = tree.css('tr')
countries = []

for tr in trs:

    tds = []

    for e in tr.iter():
        # print(e.text())
        tds.append(e.text())
    countries.append(tds)

print(countries)
```

## CSV to Excel

```python
import csv
from openpyxl import Workbook

users = []

fname = 'users.csv'

with open(fname, 'r') as f:

    reader = csv.reader(f)

    for row in reader:
        users.append(row)


book = Workbook()
sheet = book.active

for row in users:
    if row[0] == 'first_name':
        sheet.append(row)
    else:
        sheet.append((row[0], row[1], int(row[2])))

book.save('users.xlsx')
```


## generate data

```python
from faker import Faker
import csv 

fname = 'users.csv'

faker = Faker()

with open(fname, 'w') as f:

    writer = csv.writer(f, lineterminator='\n')

    writer.writerow(('first_name', 'last_name', 'salary'))

    for _ in range(500):
        first_name = faker.first_name()
        last_name = faker.last_name()
        salary = faker.random_int(min=800, max=4000, step=50)

        writer.writerow((first_name, last_name, salary))
```

## load data

```python
import csv
from dataclasses import dataclass

@dataclass
class User:
    first_name: str
    last_name: str
    salary: int


users = []
fname = 'users.csv'

with open(fname, 'r') as f:

    reader = csv.reader(f)
    next(reader)

    for row in reader:
        u = User(row[0], row[1], int(row[2]))
        users.append(u)

# print(users[:10])

users_w = [user for user in users if user.last_name.startswith('W')]
print(users_w[:5])
print(len(users_w))

sum_of_sal = sum(u.salary for u in users)
print(sum_of_sal)

print(sum([1, 2, 3, 4]))
```

## Parsing arguments

```python
import argparse
import csv
from dataclasses import dataclass

@dataclass
class User:
    first_name: str
    last_name: str
    salary: int


fname = 'users.csv'

def read_data():

    users = []

    with open(fname, 'r') as f:

        reader = csv.reader(f)
        next(reader)

        for row in reader:
            u = User(row[0], row[1], int(row[2]))
            users.append(u)

    return users


def parse_args():

    parser = argparse.ArgumentParser()
    parser.add_argument('-b', type=int, help='show first n users')
    parser.add_argument('-t', type=int, help='show last n users')
    parser.add_argument('-ts', type=int, help='show salaries of top n best earning users')

    args = parser.parse_args()

    return args.b, args.t, args.ts


users = read_data()
begin, tail, ts = parse_args()

if begin:
    print(users[:begin])

if tail:
    print(users[-tail:])

if ts:
    sorted_users = sorted(users, reverse=True, key=lambda user: user.salary)
    print(sorted_users[:ts])
```

Riesenia:  

```
import pandas as pd

file_name = 'countries.csv'

df = pd.read_csv(file_name)

smallest_area_country = df.loc[df['area'].idxmin()]
print(smallest_area_country)


min_area = df['area'].min()
smallest_area_country = df.query('`area` == @min_area')
print(smallest_area_country)

top_three_smallest_areas = df.nsmallest(3, 'area') 
print("Top three countries with the smallest area:") 
print(top_three_smallest_areas)
```



