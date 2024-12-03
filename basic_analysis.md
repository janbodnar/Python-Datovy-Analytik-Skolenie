# Functional data analysis

Python has different names of functions that are common in functional programming.  

[Element access](#element-access)  
[Aggregates](#aggregates)  
[Any/all functions](#any/all-functions)  
[Equality](#equality)  
[Partitioning](#partitioning)  
[Filtering](#filtering)  
[Ordering](#ordering)  
[Grouping](#grouping)  
[Projections](#projections)  
[Set operations](#set-operations)  
[The products module](#the-products-module)  

## Element access

```python
from products import get_products

data = get_products()

first = data[0]
last = data[-1]

firstFive = data[0:5]
lastFive = data[-5:]

print(first)
print(last)

print(firstFive)
print(len(firstFive))
print(lastFive)
print(len(lastFive))
```

## Aggregates 

```python
from products import get_products
from operator import attrgetter
from statistics import median, mean

data = get_products()

n = len(data)
print(n)

n = min(data, key=attrgetter('unit_price'))
print(n)

n = max(data, key=attrgetter('unit_price'))
print(n)

n = sum(p.units_in_stock for p in data)
print(n)

n = max(data, key=attrgetter('unit_price'))
print(n)

n = mean(p.unit_price for p in data)
print(n)

n = median(p.unit_price for p in data)
print(n)
```

## Any/all functions 

Are there any empty product stocks?  
Are all values of a list positive?  

```python
from products import get_products

data = get_products()

uis = [p.units_in_stock == 0 for p in data]
print(uis)

if any(uis):
    print(f'There are empty product stocks')
else:
    print(f'There are no empty product stocks')

vals = [-1, 2, 5, -4, 0, 55]
vals2 = [e > 0 for e in vals]

if all(vals):
    print(f'all values are positive')
else:
    print(f'there are negative values present')
```

## Equality

Sorted lists can be compared with `==` operator.  

```python
vals1 = [-1, 2, 0, 1, 4, 3]
vals2 = [-1, 3, 2, 1, 4, 0]

print(vals1 == vals2)

vals1.sort()
vals2.sort()

print(vals1 == vals2)

words1 = ['sky', 'cloud', 'paper', 'small', 'pen', 'rock']
words2 = ['paper', 'cloud', 'small', 'pen', 'sky', 'rock']

print(words1 == words2)

words1.sort()
words2.sort()

print(words1 == words2)
```

Comparing data objects.  

```python
from dataclasses import dataclass


@dataclass(frozen=True)
class User:
    uid: int
    first_name: str
    last_name: str
    occupation: str


users1 = [
    User(1, 'John', 'Doe', 'gardener'),
    User(2, 'Roger', 'Roe', 'driver'),
    User(3, 'Jane', 'Doe', 'teacher'),
    User(4, 'Sofia', 'Green', 'gardener')
]

users2 = [
    User(2, 'Roger', 'Roe', 'driver'),
    User(4, 'Sofia', 'Green', 'gardener'),
    User(3, 'Jane', 'Doe', 'teacher'),
    User(1, 'John', 'Doe', 'gardener')
]

print(users1 == users2)
users2.sort(key=lambda e: e.uid)
print(users1 == users2)
```

Using `all` and `zip` functions.  

```python
from dataclasses import dataclass


@dataclass(frozen=True)
class User:
    uid: int
    first_name: str
    last_name: str
    occupation: str


users1 = [
    User(1, 'John', 'Doe', 'gardener'),
    User(2, 'Roger', 'Roe', 'driver'),
    User(3, 'Jane', 'Doe', 'teacher'),
    User(4, 'Sofia', 'Green', 'gardener')
]

users2 = [
    User(2, 'Roger', 'Roe', 'driver'),
    User(4, 'Sofia', 'Green', 'gardener'),
    User(3, 'Jane', 'Doe', 'teacher'),
    User(1, 'John', 'Doe', 'gardener')
]


res = all(x == y for x, y in zip(users1, users2))
print(res)

users2.sort(key=lambda e: e.uid)

res = all(x == y for x, y in zip(users1, users2))
print(res)
```

Using `reduce` and `map`.  

```python
from dataclasses import dataclass
from functools import reduce

@dataclass(frozen=True)
class User:
    uid: int
    first_name: str
    last_name: str
    occupation: str


users1 = [
    User(1, 'John', 'Doe', 'gardener'),
    User(2, 'Roger', 'Roe', 'driver'),
    User(3, 'Jane', 'Doe', 'teacher'),
    User(4, 'Sofia', 'Green', 'gardener')
]

users2 = [
    User(2, 'Roger', 'Roe', 'driver'),
    User(4, 'Sofia', 'Green', 'gardener'),
    User(3, 'Jane', 'Doe', 'teacher'),
    User(1, 'John', 'Doe', 'gardener')
]


res = reduce(lambda i, j: i and j, map(lambda m, k: m == k, users1, users2), True)
print(res)

users2.sort(key=lambda e: e.uid)

res = reduce(lambda i, j: i and j, map(lambda m, k: m == k, users1, users2), True)
print(res)
```


## Partitioning

## split

```python
from funcy import split

values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

evens, odds = split(lambda e: e % 2 == 0, values)

print(list(evens))
print(list(odds))
```

## split_by

```python
from collections import namedtuple
from funcy import split_by

City = namedtuple('City' , 'id, name population')

c1 = City(1, 'Bratislava', 432000)
c2 = City(2, 'Budapest', 1759000)
c3 = City(3, 'Prague', 1280000)
c4 = City(4, 'Warsaw', 1748000)
c5 = City(5, 'Los Angeles', 3971000)
c6 = City(6, 'Edinburgh', 464000)
c7 = City(7, 'Presov', 82930)
c8 = City(8, 'Kosice', 228000)
c9 = City(9, 'Zilina', 81220)

cities = [c1, c2, c3, c4, c5, c6, c7, c8, c9]
cities.sort(key=lambda c: c.population)

low_pop, high_pop = split_by(lambda c: c.population < 1000_000, cities)
print(list(low_pop))
print(list(high_pop))
```

Implementing `take`, `takewhile`, `skip`, `skipwhile` functions.  

```python
from products import get_products
from itertools import takewhile, dropwhile

# partitioning
# take, takewhile, skip, skipwhile

data = get_products()

n = 15

# take
res = data[:n]
print(res) 

# takewhile
res = takewhile(lambda p: p.units_in_stock != 0, data)
print(list(res))

# skip
res = data[n:]
print(res)

# skipwhile 
res = dropwhile(lambda p: p.units_in_stock != 0, data)
print(list(res))
```

```python
from itertools import batched

signs = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
symbols = ['♣', '♦', '♥', '♠']

res = [f'{sign}{e}' for e in symbols for sign in signs]

batches = batched(res, 13)
for e in batches:
    print(e)
```


## Filtering

Filtering with `filter` function and list comprehensions.  

```python
from products import get_products

data = get_products()

# filter 

res = [p for p in data if p.units_in_stock == 0]
print(res)

print('----------------------------------')

res = filter(lambda p: p.category == 'Beverages', data)
print(list(res))

print('----------------------------------')

res = filter(lambda p: p.category == 'Beverages' and p.units_in_stock > 100, data)
print(list(res))
```

Filter by type with `isinstance`.  

```python
from dataclasses import dataclass

@dataclass(frozen=True)
class City:
    cid: int
    name: str
    population: int

@dataclass(frozen=True)
class User:
    uid: int
    first_name: str
    last_name: str
    occupation: str

data = [City(1, 'Bratislava', 432000), User(2, 'John', 'Doe', 'gardener'), 12, 
    'Peter Howgard', City(2, 'Budapest', 1759000), True, City(3, 'Prague', 1280000)]

cities = [e for e in data if isinstance(e, City)]
print(cities)
```

Filter and count.  

```python
from products import get_products

data = get_products()

res = [p for p in data if p.unit_price > 100]
print(len(res))
```


## Ordering 

Using `sort` and `sorted` functions.  
Sort in-place with `sort` by product name.  

```python


from products import get_products

data = get_products()
data.sort(key=lambda e: e.product_name)

for p in data:
    print(p)
```

Sort in-place with `sort` by product name in descending order.  

```python


from products import get_products

data = get_products()
data.sort(key=lambda e: e.product_name, reverse=True)

for p in data:
    print(p)
```

For sorting, we can use the `itemgetter` and `attrgetter` convenience functions.  

```python
from typing import NamedTuple
from operator import itemgetter, attrgetter
# from dataclasses import dataclass

# @dataclass(frozen=True)
# class City:
#     cid: int
#     name: str
#     population: int

class City(NamedTuple):
    cid: int
    name: str
    population: int

c1 = City(1, 'Bratislava', 432000)
c2 = City(2, 'Budapest', 1759000)
c3 = City(3, 'Prague', 1280000)
c4 = City(4, 'Warsaw', 1748000)
c5 = City(5, 'Los Angeles', 3971000)
c6 = City(6, 'Edinburgh', 464000)
c7 = City(7, 'Berlin', 3671000)

cities = [c1, c2, c3, c4, c5, c6, c7]

sorted_cities = sorted(cities, key=attrgetter('name'))

for city in sorted_cities:
    print(city)

print('---------------------')

sorted_cities = sorted(cities, key=itemgetter(2))

for city in sorted_cities:
    print(city)
```


Sorting by multiple criteria. By category and unit price.  

```python
from products import get_products

data = get_products()
data.sort(key=lambda e: (e.category, e.unit_price))

for p in data:
    print(p)
```

### Sorting by multiple criteria with ascending and descending orders.  

Solution I - using a wrapper class.   

```python
from products import get_products

class negate:
    def __init__(self, obj):
        self.obj = obj

    def __eq__(self, other):
        return other.obj == self.obj

    def __lt__(self, other):
        return other.obj < self.obj


data = get_products()
data.sort(key=lambda e: (e.category, negate(e.unit_price)))

for p in data: 
    print(p)
```

Solution II - sorting data twice. The sorting algorithm is stable.  

```python
from products import get_products
from operator import attrgetter

def multisort(xs, specs):

    for key, reverse in reversed(specs):
        xs.sort(key=attrgetter(key), reverse=reverse)

    return xs

data = get_products()
multisort(data, (('category', False), ('unit_price', True)))

for p in data:
    print(p)
```

## Grouping 

Using `groupby` function from `itertools` module. The data must be sorted.  

```python
from itertools import groupby

vals = [1, 1, 1, 2, 3, 2, 4, 5, 4, 3, 3, 5, 6, 7, 3]
vals.sort()

res = groupby(vals, key=lambda e: e)

for k, g in res:
    print(k, list(g))
```

Group by starting letter.  

```python
from itertools import groupby

words = ['key', 'water', 'war', 'rock', 'cup', 'cloud', 'matter', 'wood',
         'forest', 'falcon', 'foam', 'wry', 'wrath', 'up', 'auto', 'roast',
         'cool', 'computer']
words.sort()

res = [(k, list(g)) for k, g in groupby(words, key=lambda e: e[0])]

for k, g in res:
    print(f'{k}: {g} -> {len(g)}')
```

Grouping a list of tuples.  

```python
from itertools import groupby


cars = [
    ("Audi", "red", 52642),
    ("Mercedes", "blue", 57127),
    ("Skoda", "black", 9000),
    ("Volvo", "red", 29000),
    ("Bentley", "yellow", 350000),
    ("Citroen", "white", 21000),
    ("Hummer", "black", 41400),
    ("Volkswagen", "white", 21600)
]

cars.sort(key=lambda e: e[1])

res = [(k, list(g)) for k, g in groupby(cars, lambda e: e[1])]
for k, g in res:
    print(f'{k}: {g}')
```

Group products by category.  

```python
from itertools import groupby
from products import get_products

data = get_products()
data.sort(key=lambda p: p.category)

res = [(k, list(g)) for k, g in groupby(data, lambda e: e.category)]
for k, g in res:
    print(f'{k}: {len(g)}')
    for p in g:
        print(f'  {p.product_name} {p.unit_price} {p.units_in_stock}')
    print()
```

Group & aggregate.  
Calculate the sum of revenues for each quartal.  

```python
from itertools import groupby


revenues = [
    (1, "Q1", 2340),
    (2, "Q1", 1200),
    (3, "Q1", 980),
    (4, "Q2", 340),
    (5, "Q2", 780),
    (6, "Q3", 2010),
    (7, "Q3", 3370),
    (8, "Q4", 540),
]

res = [(k, list(g)) for k, g in groupby(revenues, lambda e: e[1])]

for k, g in res:
    rs = sum([e[2] for e in g])
    print(f'{k}: {rs}')
```

Grouping by composite key.  
Group users by last name and occupation.  


```python
from itertools import groupby
from dataclasses import dataclass


@dataclass(frozen=True)
class User:
    first_name: str
    last_name: str
    occupation: str


users = [
    User("John", "Doe", "gardener"),
    User("Jane", "Doe", "teacher"),
    User("Roger", "Roe", "driver"),
    User("Peter", "Doe", "teacher"),
    User("Pavol", "Novak", "programmer"),
    User("Albert", "Novak", "teacher"),
    User("Sam", "Novak", "driver"),
    User("Peter", "Horvath", "accountant"),
    User("Lucia", "Horvath", "accountant"),
    User("Michael", "Novak", "programmer"),
]

users.sort(key=lambda e: (e.last_name, e.occupation))

res = [(k, list(g))
       for k, g in groupby(users, lambda u: (u.last_name, u.occupation))]

for k, g in res:
    print(f'{k[0]}, {k[1]}')
    for u in g:
        print(f'  {u.first_name} {u.last_namecl}')
```

Group by boolean expression.  
Group students into two groups by test scores.  

```python
from itertools import groupby
from dataclasses import dataclass


@dataclass(frozen=True)
class User:
    first_name: str
    last_name: str
    score: int


users = [
    User("John", "Doe", 78),
    User("Roger", "Roe", 89),
    User("Peter", "Doe", 90),
    User("Pavol", "Novak", 34),
    User("Albert", "Novak", 66),
    User("Peter", "Horvath", 89),
    User("Lucia", "Horvath", 88),
    User("Michael", "Novak", 99),
]

users.sort(key=lambda e: e.score)

res = [(list(g))
       for k, g in groupby(users, lambda u: u.score > 70)]
failed = res[0]
passed = res[1]

print('failed')
for u in failed:
    print(u)

print('passed')
for u in passed:
    print(u)
```


## Projections

Select/map 

The select/map methods project each element of a sequence into a new form. It selects, projects  
and transforms elements in a collection.  

```python
from dataclasses import dataclass
from decimal import Decimal
from products import get_products

@dataclass(frozen=True)
class Item:
    name: str
    price: Decimal

data = get_products()

res = [p.category for p in data]
print(res)

res = [(p.product_name, p.unit_price) for p in data]
print(res)

res = [Item(p.product_name, p.unit_price) for p in data]
print(res)
```
---

The built-in `map` function.  

```python
nums = [1, 2, 3, 4, 5]

nums_squared = map(lambda x: x*x, nums)

for num in nums_squared:
    print(num)
```

## Set operations

The union, intersection, difference, and distinct set operations.  

```python
from dataclasses import dataclass
from products import get_products

@dataclass(frozen=True)
class User:
    first_name: str
    last_name: str
    occupation: str


users1 = {User('John', 'Doe', 'gardener'), User('Roger', 'Roe', 'driver'),
          User('Peter', 'Howard', 'pilot')}

users2 = {User('John', 'Doe', 'gardener'), User('Jane', 'Doe', 'shopkeeper'),
          User('Lucy', 'Smith', 'teacher')}

res = users1.union(users2)
print(res)

print('------------------------------')

res = users1.intersection(users2)
print(res)

print('------------------------------')

res = users1.difference(users2)
print(res)

print('------------------------------')

vals = [1, 1, 2, 2, 2, 3, 4, 5, 5, 5, 6, 6, 7]
vals2 = set(vals)
print(vals2)
```

## The products module 

```python
from dataclasses import dataclass
from decimal import Decimal

@dataclass(frozen=True)
class Product:
    pid: int
    product_name: str
    category: str
    unit_price: Decimal
    units_in_stock: int


def get_products():

    return [  
        Product(1, "Chai", "Beverages", Decimal('18.00'), 39), 
        Product(2, "Chang", "Beverages", Decimal('19.00'), 17),
        Product(3, "Aniseed Syrup", "Condiments",  Decimal('10.00'), 13),
        Product(4, "Chef Anton's Cajun Seasoning", "Condiments",  Decimal('22.00'), 53),
        Product(5, "Chef Anton's Gumbo Mix", "Condiments", Decimal('21.35'), 0),
        Product(6, "Grandma's Boysenberry Spread", "Condiments",  Decimal('25.00'), 120),
        Product(7, "Uncle Bob's Organic Dried Pears", "Produce",  Decimal('30.00'), 15),
        Product(8, "Northwoods Cranberry Sauce", "Condiments",  Decimal('40.00'), 6),
        Product(9, "Mishi Kobe Niku", "Meat/Poultry",  Decimal('97.00'), 29), 
        Product(10, "Ikura", "Seafood",  Decimal('31.00'), 31),
        Product(11, "Queso Cabrales", "Dairy Products",  Decimal('21.00'), 22),
        Product(12, "Queso Manchego La Pastora", "Dairy Products",  Decimal('38.00'), 86),
        Product(13, "Konbu", "Seafood",  Decimal('6.00'), 24), 
        Product(14, "Tofu", "Produce",  Decimal('23.25'), 35),
        Product(15, "Genen Shouyu", "Condiments",  Decimal('15.50'), 39),
        Product(16, "Pavlova", "Confections",  Decimal('17.45'), 29),
        Product(17, "Alice Mutton", "Meat/Poultry",  Decimal('39.00'), 0),
        Product(18, "Carnarvon Tigers", "Seafood",  Decimal('62.5000'), 42),
        Product(19, "Teatime Chocolate Biscuits", "Confections",  Decimal('9.2000'), 25),
        Product(20, "Sir Rodney's Marmalade", "Confections",  Decimal('81.00'), 40),
        Product(21, "Sir Rodney's Scones", "Confections",  Decimal('10.00'), 3),
        Product(22, "Gustaf's Knäckebröd", "Grains/Cereals",  Decimal('21.00'), 104),
        Product(23, "Tunnbröd", "Grains/Cereals",  Decimal('9.00'), 61),
        Product(24, "Guaraná Fantástica", "Beverages",  Decimal('4.50'), 20),
        Product(25, "NuNuCa Nuß-Nougat-Creme", "Confections",  Decimal('14.00'), 76),
        Product(26, "Gumbär Gummibärchen", "Confections",  Decimal('31.23'), 15),
        Product(27, "Schoggi Schokolade", "Confections",  Decimal('43.90'), 49),
        Product(28, "Rössle Sauerkraut", "Produce",  Decimal('45.60'), 26),
        Product(29, "Thüringer Rostbratwurst", "Meat/Poultry",  Decimal('123.79'), 0),
        Product(30, "Nord-Ost Matjeshering", "Seafood",  Decimal('25.89'), 10),
        Product(31, "Gorgonzola Telino", "Dairy Products",  Decimal('12.50'), 0),
        Product(32, "Mascarpone Fabioli", "Dairy Products",  Decimal('32.00'), 9),
        Product(33, "Geitost", "Dairy Products",  Decimal('2.50'), 112),
        Product(34, "Sasquatch Ale", "Beverages",  Decimal('14.00'), 111),
        Product(35, "Steeleye Stout", "Beverages",  Decimal('18.00'), 20),
        Product(36, "Inlagd Sill", "Seafood",  Decimal('19.00'), 112), 
        Product(37, "Gravad lax", "Seafood",  Decimal('26.00'), 11),
        Product(38, "Côte de Blaye", "Beverages",  Decimal('263.50'), 17),
        Product(39, "Chartreuse verte", "Beverages",  Decimal('18.00'), 69),
        Product(40, "Boston Crab Meat", "Seafood",  Decimal('18.40'), 123),
        Product(41, "Jack'England Clam Chowder", "Seafood",  Decimal('9.65'), 85),
        Product(42, "Singaporean Hokkien Fried Mee", "Grains/Cereals",  Decimal('14.00'), 26),
        Product(43, "Ipoh Coffee", "Beverages",  Decimal('46.00'), 17),
        Product(44, "Gula Malacca", "Condiments",  Decimal('19.45'), 27), 
        Product(45, "Rogede sild", "Seafood",  Decimal('9.50'), 5),
        Product(46, "Spegesild", "Seafood",  Decimal('12.00'), 95), 
        Product(47, "Zaanse koeken", "Confections",  Decimal('9.50'), 36),
        Product(48, "Chocolade", "Confections",  Decimal('12.75'), 15),
        Product(49, "Maxilaku", "Confections",  Decimal('20.00'), 10),
        Product(50, "Valkoinen suklaa", "Confections",  Decimal('16.25'), 65),
        Product(51, "Manjimup Dried Apples", "Produce",  Decimal('53.00'), 20),
        Product(52, "Filo Mix", "Grains/Cereals",  Decimal('7.00'), 38),
        Product(53, "Perth Pasties", "Meat/Poultry",  Decimal('32.80'), 0),
        Product(54, "Tourtière", "Meat/Poultry",  Decimal('7.45'), 21),
        Product(55, "Pâté chinois", "Meat/Poultry",  Decimal('24.00'), 115),
        Product(56, "Gnocchi di nonna Alice", "Grains/Cereals",  Decimal('38.00'), 21),
        Product(57, "Ravioli Angelo", "Grains/Cereals",  Decimal('19.50'), 36),
        Product(58, "Escargots de Bourgogne", "Seafood",  Decimal('13.25'), 62),
        Product(59, "Raclette Courdavault", "Dairy Products",  Decimal('55.00'), 79),
        Product(60, "Camembert Pierrot", "Dairy Products",  Decimal('34.00'), 19),
        Product(61, "Sirop d'érable", "Condiments",  Decimal('28.50'), 113),
        Product(62, "Tarte au sucre", "Confections",  Decimal('49.30'), 17),
        Product(63, "Vegie-spread", "Condiments",  Decimal('43.90'), 24),
        Product(64, "Wimmers gute Semmelknödel", "Grains/Cereals",  Decimal('33.25'), 22),
        Product(65, "Louisiana Fiery Hot Pepper Sauce", "Condiments",  Decimal('21.05'), 76),
        Product(66, "Louisiana Hot Spiced Okra", "Condiments",  Decimal('17.00'), 4),
        Product(67, "Laughing Lumberjack Lager", "Beverages",  Decimal('14.00'), 52),
        Product(68, "Scottish Longbreads", "Confections",  Decimal('12.50'), 6),
        Product(69, "Gudbrandsdalsost", "Dairy Products",  Decimal('36.00'), 26),
        Product(70, "Outback Lager", "Beverages",  Decimal('15.00'), 15),
        Product(71, "Flotemysost", "Dairy Products",  Decimal('21.50'), 26),
        Product(72, "Mozzarella di Giovanni", "Dairy Products",  Decimal('34.80'), 14),
        Product(73, "Röd Kaviar", "Seafood",  Decimal('15.00'), 101), 
        Product(74, "Longlife Tofu", "Produce",  Decimal('10.00'), 4),
        Product(75, "Rhönbräu Klosterbier", "Beverages",  Decimal('7.75'), 125),
        Product(76, "Lakkalikööri", "Beverages",  Decimal('18.00'), 57),
        Product(77, "Original Frankfurter grüne Soße", "Condiments",  Decimal('13.00'), 32)
    ]
```
