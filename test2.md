# Samples


```python
import httpx
from selectolax.parser import HTMLParser

url = 'https://nrf.com/research-insights/top-retailers/top-100-retailers/top-100-retailers-2019'
resp = httpx.get(url)

text = resp.text

tree = HTMLParser(text)
root = tree.root
table = tree.css_first('table')

print(table)

data = []

for e in table.iter():
    data.append(e.text())

for e in data:
    print(e)
```


## Parse title 

```python
from selectolax.parser import HTMLParser
import httpx 
import argparse


aparser = argparse.ArgumentParser()

aparser.add_argument('-t', type=str)
aparser.add_argument('--title', type=str)
args = aparser.parse_args()

url = args.t

if url == None:
    url = args.title

r = httpx.get(url)
html = r.text

tree = HTMLParser(html)

title = tree.css_first('title')
print(title.text())
```




```SQL
WITH top_salaries AS (
    SELECT DISTINCT salary
    FROM employees
    ORDER BY salary DESC
    LIMIT 10
)
SELECT e.first_name, e.last_name, e.salary, SUM(e.salary) OVER (PARTITION BY e.salary) as salary_sum
FROM employees e
INNER JOIN top_salaries ts
ON e.salary = ts.salary
ORDER BY e.salary DESC;
```

```SQL
WITH top_salaries AS (
    SELECT DISTINCT salary
    FROM employees
    ORDER BY salary DESC
    LIMIT 10
)
SELECT e.first_name, e.last_name, e.salary
FROM employees e
INNER JOIN top_salaries ts
ON e.salary = ts.salary
ORDER BY e.salary DESC;
```


```SQL
SELECT AVG(salary) AS median
FROM (
  SELECT salary, 
         ROW_NUMBER() OVER (ORDER BY salary) - 1 AS rn,
         COUNT(*) OVER () - 1 AS cnt
  FROM employees
) t
WHERE rn IN (FLOOR(cnt / 2), CEILING(cnt / 2));
```


## generate employees.csv

```SQL
CREATE TABLE employees(id SERIAL PRIMARY KEY, first_name VARCHAR(255), 
	last_name VARCHAR(255), occupation VARCHAR(255), salary INT);
```

```python
import faker
import random 
import csv

n_rows = random.randint(20_000, 50_000)

fname = 'employees.csv'
faker = faker.Faker()

with open(fname, 'w') as f:

    writer = csv.writer(f, lineterminator='\n')

    writer.writerow(['Id', 'First name', 'Last name', 'Occupation', 'Salary'])

    for i in range(n_rows):

        uid = i 
        first_name = faker.first_name()
        last_name = faker.last_name()
        occupation = faker.job()
        salary = random.randrange(850, 12_000, 50)

        writer.writerow([uid, first_name, last_name, occupation, salary])
```



## namedtuple

```python
from collections import namedtuple


City = namedtuple('City', 'id name population')

c1 = City(1, 'Bratislava', 432000)
c2 = City(2, 'Budapest', 1759000)
c3 = City(3, 'Prague', 1280000)
c4 = City(4, 'Warsaw', 1748000)
c5 = City(5, 'Los Angeles', 3971000)
c6 = City(6, 'Edinburgh', 464000)
c7 = City(7, 'Berlin', 3671000)

cities = [c1, c2, c3, c4, c5, c6, c7]

cities.sort(key=lambda e: e.population)

for city in cities:
    print(city)

n = min(cities, key=lambda e: e.population)
print(n)

n = max(cities, key=lambda e: e.population)
print(n)
```


## Basic statistics

```
[
    {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "salary": 2380
    },
    {
        "name": "Roger Roe",
        "email": "roger.roe@example.com",
        "salary": 980
    },
    {
        "name": "Paul Novak",
        "email": "paul.novak@example.com",
        "salary": 1050
    },
    {
        "name": "Lucia Williams",
        "email": "lucia.williams@example.com",
        "salary": 1970
    },
    {
        "name": "Peter Novotny",
        "email": "peter.novotny@example.com",
        "salary": 2230
    },
    {
        "name": "Samuel Green",
        "email": "samuel.green@example.com",
        "salary": 890
    },
    {
        "name": "Saul Peterson",
        "email": "saul.peterson@example.com",
        "salary": 990
    },
    {
        "name": "Walter Smith",
        "email": "walter.smith@example.com",
        "salary": 1180
    },
    {
        "name": "Paul Smith",
        "email": "paul.smith@example.com",
        "salary": 2130
    },
    {
        "name": "Martin Meszaros",
        "email": "martin.meszaros@example.com",
        "salary": 890
    }
]
```


```python
import statistics
import json
from dataclasses import dataclass

@dataclass
class User:
    name: str
    email: str
    salary: int

# json.load(file object)

users = []
fname = 'users.json'

with open(fname) as f:

    rows = json.load(f)
    
    for row in rows:
        users.append(User(**row))
        # users.append(User(row['name'], row['email'], row['salary']))



print(users)

salaries = [user.salary for user in users]
print(salaries)

smean = statistics.mean(salaries)
print(smean)

stdev = statistics.stdev(salaries)
print(stdev)

var = statistics.variance(salaries)
print(var)

median = statistics.median(salaries)
print(median)

median_low = statistics.median_low(salaries)
print(median_low)

median_high = statistics.median_high(salaries)
print(median_high)
```






## Correletion

```
Name,Age,Income($)
Rob,27,60000
Michael,29,66000
Mohan,29,61000
John,28,60000
Peter,42,150000
Roman,39,155000
David,41,160000
Andrea,38,162000
Brad,36,156000
Angelina,35,130000
Donald,37,137000
Tom,26,45000
Arnold,27,48000
Jared,28,51000
Stark,29,49500
Ranbir,32,53000
Stefan,40,65000
Patrik,41,63000
Nick,43,94000
Alia,39,80000
Sid,41,112000
Abdul,39,58000
```



```python
import statistics
import csv
from dataclasses import dataclass

@dataclass
class User:
    name: str
    age: int
    income: int


users = []

fname = 'data.csv'
with open(fname) as f:

    next(f)

    reader = csv.reader(f)

    for row in reader:
        users.append(User(*row))


print(users)

ages = [int(user.age) for user in users]
incomes = [int(user.income) for user in users] 

print(ages)
print(incomes)

cor = statistics.correlation(ages, incomes)
print(cor)
```

## Sample Solutions


## Task 1
```sql
SELECT * FROM products ORDER BY id;
Task 2
```

```sql
SELECT product_name, unit_price
FROM products
WHERE unit_price > 50
ORDER BY unit_price DESC;
```

## Task 3
```sql
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category
ORDER BY category;
```

## Task 4
```sql
SELECT product_name, category, units_in_stock
FROM products
WHERE units_in_stock < 10
ORDER BY units_in_stock ASC;
```

## Task 5
```sql
SELECT category, ROUND(SUM(unit_price * units_in_stock), 2) AS total_value
FROM products
GROUP BY category
ORDER BY total_value DESC;
```

## Task 6
``` sql
SELECT category, ROUND(AVG(unit_price), 2) AS avg_price
FROM products
GROUP BY category
HAVING COUNT(*) > 5
ORDER BY avg_price DESC;
```

## Task 7

```sql
SELECT product_name, category
FROM products
WHERE product_name LIKE 'C%'
ORDER BY product_name;
```

## Task 8

```sql
SELECT product_name, category
FROM products
WHERE units_in_stock = 0
ORDER BY category, product_name;
```

## Task 9
```sql
SELECT product_name, category, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 5;
```

## Task 10 (with Setup)

```sql
-- Add supplier_id column to products
ALTER TABLE products ADD COLUMN supplier_id INTEGER;
```

```sql
-- Create suppliers table
CREATE TABLE suppliers (
    supplier_id INTEGER PRIMARY KEY,
    supplier_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);
```

```sql
-- Insert sample suppliers
INSERT INTO suppliers (supplier_id, supplier_name, country) VALUES
(1, 'Tokyo Traders', 'Japan'),
(2, 'Nordic Imports', 'Norway'),
(3, 'Southern Foods', 'USA');
```

```sql
-- Assign some supplier_ids to products (example)
UPDATE products SET supplier_id = 1 WHERE id IN (9, 10, 13); -- Japanese products
UPDATE products SET supplier_id = 2 WHERE id IN (36, 37);
UPDATE products SET supplier_id = 3 WHERE id IN (40, 41);
```

```sql
SELECT p.product_name, p.unit_price, s.supplier_name
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id
WHERE s.country = 'Japan'
ORDER BY p.unit_price DESC;
```

Teaching Tips
Difficulty Progression: Start with Tasks 1-4 (basic SELECT and WHERE), move to 5-6 (aggregation),  
then 7-9 (pattern matching and limits), and finish with 10 (joins).  
Encourage Exploration: Ask students to modify queries (e.g., change thresholds or sort order)    
to see how results change.  
Bonus Challenge: After Task 10, ask them to find the total inventory value for Japanese suppliers.  

