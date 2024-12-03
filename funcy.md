# funcy 


## Filtering

```python
from funcy import filter

vals = [1, -3, 4, 0, -9, 11, 5, -6]

filtered = filter(lambda e: e > 0, vals)
print(list(filtered))


words = ['key', 'eye', 'norm', 'atom', 'rock', 'water']

filtered = filter(lambda e: len(e) == 3, words)
print(list(filtered))
```

## lmap, map 

`lmap` is a convenience for `list(map(...))`  

```python
from funcy import map, lmap

vals = [2, 4, 6]

res = map(lambda x: x * 2, vals)
print(list(res))

vals = [2, 4, 6]

res = lmap(lambda x: x * 2, vals)
print(res)
```

## distinct

```python
from funcy import distinct
 
 
words = ['sky', 'war', 'water', 'war', 'sky', 'cup', 'cup', 'atom']

distilled = distinct(words)
print(list(distilled))
```

## flatten 

```python
from funcy import flatten

nested_list = [[1, 2], [3, 4], [5]]
flat_list = flatten(nested_list)
```


## select_keys & select_values

```python
from funcy import select_keys, select_values

animals = {'donkeys': 3, 'horses': 2, 'chickens': 15,
           'dogs': 2, 'cats': 5, 'elephants': 2}


res = select_values(lambda e: e > 2, animals)
print(res)

res = select_keys(lambda e: e.startswith('do'), animals)
print(res)


res = {k: v for k, v in filter(lambda e: e[1] > 2, animals.items())}
print(res)

res = {k: v for k, v in filter(
    lambda e: e[0].startswith('do'), animals.items())}
print(res)
```

## Function composition

```python
from funcy import rcompose, compose

def square(x):
    return x * x

def increment(x):
    return x + 1

def cube(x):
    return x * x * x


val = 5

fchain = rcompose(square, increment, cube)
print(fchain(val))
print(cube(increment(square(val))))

print('---------------------------------------------')

fchain = compose(square, increment, cube)
print(fchain(val))
print(square(increment(cube(val))))
```

## nth

```python
from funcy import nth, repeatedly
from argparse import ArgumentParser

aparser = ArgumentParser()

aparser.add_argument('-n', type=int, required=True)
args = aparser.parse_args()

n = args.n

with open('words.txt') as f:

    line = nth(n, repeatedly(f.readline))
    print(line)
```

## deck of cards

```python
from funcy import cycle, take, lmap

suits = ["♠", "♥", "♦", "♣"]
values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

zdeck = zip(take(52, cycle(values)), cycle(suits))
print(lmap("".join, zdeck))
```

## group_by

```python
from funcy import group_by

users = [
    {'first_name': 'John', 'last_name': 'Doe', 'occupation': 'gardener'},
    {'first_name': 'Roger', 'last_name': 'Roe', 'occupation': 'driver'},
    {'first_name': 'Adam', 'last_name': 'Novak', 'occupation': 'teacher'},
    {'first_name': 'Paul', 'last_name': 'Novak', 'occupation': 'programmer'},
    {'first_name': 'Roman', 'last_name': 'Meszaros', 'occupation': 'programmer'},
    {'first_name': 'Tomas', 'last_name': 'Bruzik', 'occupation': 'driver'},
]

users.sort(key=lambda user: user['occupation'])
grouped = group_by(lambda user: user['occupation'], users)

for k, v in grouped.items():
        
    print('-----------------------------')
    print(k)
    print(v)
```

---

```python

from collections import namedtuple

from funcy import group_by
User = namedtuple('User', 'first_name last_name occupation')

users = [
    User('John', 'Doe', 'gardener'),
    User('Roger', 'Roe', 'driver'),
    User('Adam', 'Novak', 'teacher'),
    User('Paul', 'Novak', 'programmer'),
    User('Roman', 'Meszaros', 'programmer'),
    User('Tomas', 'Bruzik', 'driver'),
]

users.sort(key=lambda user: user.occupation)
grouped = group_by(lambda user: user.occupation, users)

for k, v in grouped.items():

    print('-----------------------------')
    print(k)
    for e in v:
        print(e)
```








