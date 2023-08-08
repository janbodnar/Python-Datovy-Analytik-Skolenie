# Functional data analysis

In Python, we can have different names of functions that are common in functional programming.  

[Element access](#element-access)  
[Aggregates](#aggregates)
[Any/all functions](#any/all-functions)  
[Partitioning](#partitioning)  
[Filtering](#filtering)  
[Ordering](#ordering)  
[Projections](#projections)  
[Set operations](#set-operations)
[The products module](#the-products-module)  

## Element access

```python
#!/usr/bin/python

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
#!/usr/bin/python

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
#!/usr/bin/python

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

## Partitioning

Implementing `take`, `takewhile`, `skip`, `skipwhile` functions.  

```python
#!/usr/bin/python

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

## Filtering

Filtering with `filter` function and list comprehensions.  

```python
#!/usr/bin/python

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
#!/usr/bin/python

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


## Ordering 

Using `sort` and `sorted` functions.  
Sort in-place with `sort` by product name.  

```python
#!/usr/bin/python

from products import get_products

data = get_products()
data.sort(key=lambda e: e.product_name)

for p in data:
    print(p)
```

Sort in-place with `sort` by product name in descending order.  

```python
#!/usr/bin/python

from products import get_products

data = get_products()
data.sort(key=lambda e: e.product_name, reverse=True)

for p in data:
    print(p)
```

For sorting, we can use the `itemgetter` and `attrgetter` convenience functions.  

```python
#!/usr/bin/python

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
#!/usr/bin/python

from products import get_products

data = get_products()
data.sort(key=lambda e: (e.category, e.unit_price))

for p in data:
    print(p)
```

### Sorting by multiple criteria with ascending and descending orders.  

Solution I - using a wrapper class.   

```python
#!/usr/bin/python

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
#!/usr/bin/python

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

## Projections

Select/map 

The select/map methods project each element of a sequence into a new form. It selects, projects  
and transforms elements in a collection.  

```python
#!/usr/bin/python

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
#!/usr/bin/python

nums = [1, 2, 3, 4, 5]

nums_squared = map(lambda x: x*x, nums)

for num in nums_squared:
    print(num)
```

## Set operations

The union, intersection, difference, and distinct set operations.  

```python
#!/usr/bin/python

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

@dataclass(frozen=True)
class Product:
    pid: int
    product_name: str
    category: str
    unit_price: float
    units_in_stock: int


def get_products():

    return [  
        Product(1, "Chai", "Beverages", 18.0000, 39), 
        Product(2, "Chang", "Beverages", 19.0000, 17),
        Product(3, "Aniseed Syrup", "Condiments", 10.0000, 13),
        Product(4, "Chef Anton's Cajun Seasoning", "Condiments", 22.0000, 53),
        Product(5, "Chef Anton's Gumbo Mix", "Condiments", 21.3500, 0),
        Product(6, "Grandma's Boysenberry Spread", "Condiments", 25.0000, 120),
        Product(7, "Uncle Bob's Organic Dried Pears", "Produce", 30.0000, 15),
        Product(8, "Northwoods Cranberry Sauce", "Condiments", 40.0000, 6),
        Product(9, "Mishi Kobe Niku", "Meat/Poultry", 97.0000, 29), 
        Product(10, "Ikura", "Seafood", 31.0000, 31),
        Product(11, "Queso Cabrales", "Dairy Products", 21.0000, 22),
        Product(12, "Queso Manchego La Pastora", "Dairy Products", 38.0000, 86),
        Product(13, "Konbu", "Seafood", 6.0000, 24), 
        Product(14, "Tofu", "Produce", 23.2500, 35),
        Product(15, "Genen Shouyu", "Condiments", 15.5000, 39),
        Product(16, "Pavlova", "Confections", 17.4500, 29),
        Product(17, "Alice Mutton", "Meat/Poultry", 39.0000, 0),
        Product(18, "Carnarvon Tigers", "Seafood", 62.5000, 42),
        Product(19, "Teatime Chocolate Biscuits", "Confections", 9.2000, 25),
        Product(20, "Sir Rodney's Marmalade", "Confections", 81.0000, 40),
        Product(21, "Sir Rodney's Scones", "Confections", 10.0000, 3),
        Product(22, "Gustaf's Knäckebröd", "Grains/Cereals", 21.0000, 104),
        Product(23, "Tunnbröd", "Grains/Cereals", 9.0000, 61),
        Product(24, "Guaraná Fantástica", "Beverages", 4.5000, 20),
        Product(25, "NuNuCa Nuß-Nougat-Creme", "Confections", 14.0000, 76),
        Product(26, "Gumbär Gummibärchen", "Confections", 31.2300, 15),
        Product(27, "Schoggi Schokolade", "Confections", 43.9000, 49),
        Product(28, "Rössle Sauerkraut", "Produce", 45.6000, 26),
        Product(29, "Thüringer Rostbratwurst", "Meat/Poultry", 123.7900, 0),
        Product(30, "Nord-Ost Matjeshering", "Seafood", 25.8900, 10),
        Product(31, "Gorgonzola Telino", "Dairy Products", 12.5000, 0),
        Product(32, "Mascarpone Fabioli", "Dairy Products", 32.0000, 9),
        Product(33, "Geitost", "Dairy Products", 2.5000, 112),
        Product(34, "Sasquatch Ale", "Beverages", 14.0000, 111),
        Product(35, "Steeleye Stout", "Beverages", 18.0000, 20),
        Product(36, "Inlagd Sill", "Seafood", 19.0000, 112), 
        Product(37, "Gravad lax", "Seafood", 26.0000, 11),
        Product(38, "Côte de Blaye", "Beverages", 263.5000, 17),
        Product(39, "Chartreuse verte", "Beverages", 18.0000, 69),
        Product(40, "Boston Crab Meat", "Seafood", 18.4000, 123),
        Product(41, "Jack'England Clam Chowder", "Seafood", 9.6500, 85),
        Product(42, "Singaporean Hokkien Fried Mee", "Grains/Cereals", 14.0000, 26),
        Product(43, "Ipoh Coffee", "Beverages", 46.0000, 17),
        Product(44, "Gula Malacca", "Condiments", 19.4500, 27), 
        Product(45, "Rogede sild", "Seafood", 9.5000, 5),
        Product(46, "Spegesild", "Seafood", 12.0000, 95), 
        Product(47, "Zaanse koeken", "Confections", 9.5000, 36),
        Product(48, "Chocolade", "Confections", 12.7500, 15),
        Product(49, "Maxilaku", "Confections", 20.0000, 10),
        Product(50, "Valkoinen suklaa", "Confections", 16.2500, 65),
        Product(51, "Manjimup Dried Apples", "Produce", 53.0000, 20),
        Product(52, "Filo Mix", "Grains/Cereals", 7.0000, 38),
        Product(53, "Perth Pasties", "Meat/Poultry", 32.8000, 0),
        Product(54, "Tourtière", "Meat/Poultry", 7.4500, 21),
        Product(55, "Pâté chinois", "Meat/Poultry", 24.0000, 115),
        Product(56, "Gnocchi di nonna Alice", "Grains/Cereals", 38.0000, 21),
        Product(57, "Ravioli Angelo", "Grains/Cereals", 19.5000, 36),
        Product(58, "Escargots de Bourgogne", "Seafood", 13.2500, 62),
        Product(59, "Raclette Courdavault", "Dairy Products", 55.0000, 79),
        Product(60, "Camembert Pierrot", "Dairy Products", 34.0000, 19),
        Product(61, "Sirop d'érable", "Condiments", 28.5000, 113),
        Product(62, "Tarte au sucre", "Confections", 49.3000, 17),
        Product(63, "Vegie-spread", "Condiments", 43.9000, 24),
        Product(64, "Wimmers gute Semmelknödel", "Grains/Cereals", 33.2500, 22),
        Product(65, "Louisiana Fiery Hot Pepper Sauce", "Condiments", 21.0500, 76),
        Product(66, "Louisiana Hot Spiced Okra", "Condiments", 17.0000, 4),
        Product(67, "Laughing Lumberjack Lager", "Beverages", 14.0000, 52),
        Product(68, "Scottish Longbreads", "Confections", 12.5000, 6),
        Product(69, "Gudbrandsdalsost", "Dairy Products", 36.0000, 26),
        Product(70, "Outback Lager", "Beverages", 15.0000, 15),
        Product(71, "Flotemysost", "Dairy Products", 21.5000, 26),
        Product(72, "Mozzarella di Giovanni", "Dairy Products", 34.8000, 14),
        Product(73, "Röd Kaviar", "Seafood", 15.0000, 101), 
        Product(74, "Longlife Tofu", "Produce", 10.0000, 4),
        Product(75, "Rhönbräu Klosterbier", "Beverages", 7.7500, 125),
        Product(76, "Lakkalikööri", "Beverages", 18.0000, 57),
        Product(77, "Original Frankfurter grüne Soße", "Condiments", 13.0000, 32)
    ]
```
