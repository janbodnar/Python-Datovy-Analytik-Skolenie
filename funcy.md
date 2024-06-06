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

## split

```python
from funcy import split

values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

evens, odds = split(lambda e: e % 2 == 0, values)

print(list(evens))
print(list(odds))
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
