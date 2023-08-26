# Lambda functions

Python lambda functions, also known as anonymous functions, are inline functions  
that do not have a name. They are created with the lambda keyword. 

Python lambda functions are restricted to a single expression. They can be used  
wherever normal functions can be used.

Python lambda has the following syntax:

    z = lambda x: x * y

The statement creates an anonymous function with the lambda keyword. The function  
multiplies two values. The x is a parameter that is passed to the lambda function.  
The parameter is followed by a colon character. The code next to the colon is  
the expression that is executed when the lambda function is called.  
The lambda function is assigned to the z variable.

# Lambda & map 

```python
#!/usr/bin/python

nums = [1, 2, 3, 4, 5, 6]

nums_squared = map(lambda x: x * x, nums)

for num in nums_squared:
    print(num)
```

# Lambda & min/max

```python
#!/usr/bin/python

from dataclasses import dataclass

@dataclass(frozen=True)
class Car:
    name: str
    price: int

cars = [
    Car("Audi", 52642), Car("Mercedes", 57127), Car("Skoda", 9000),
    Car("Volvo", 29000), Car("Bentley", 350000), Car("Citroen", 21000),
    Car("Hummer", 41400), Car("Volkswagen", 21601)
]

n = min(cars, key=lambda c: c.price)
print(n)

n = max(cars, key=lambda c: c.price)
print(n)
```

## Lambda & filter 

```python
#!/usr/bin/python

vals = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

res = filter(lambda x: x % 2, vals)
print(list(res))
```

## Lambda & sort 

```python
#!/usr/bin/python

users = [
  {'name': 'John Doe', 'date_of_birth': 1987},
  {'name': 'Jane Doe', 'date_of_birth': 1996},
  {'name': 'Robert Brown', 'date_of_birth': 1977},
  {'name': 'Lucia Smith', 'date_of_birth': 2002},
  {'name': 'Patrick Dempsey', 'date_of_birth': 1994}
]

users.sort(reverse=True, key=lambda e: e['date_of_birth'])

for user in users:
    print(user)
```

