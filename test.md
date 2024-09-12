# Priklady

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
