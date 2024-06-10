# Samples


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

median_low = statistics.median(salaries)
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
