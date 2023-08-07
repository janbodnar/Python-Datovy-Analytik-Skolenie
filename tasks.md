# Tasks

## Generate user data in CSV format

Using `faker` and `csv` modules.  

```python
#!/usr/bin/python

from faker import Faker
import csv

faker = Faker()

with open('users.csv', 'w', newline='') as f:
    fieldnames = ['id', 'first_name', 'last_name', 'occupation']
    writer = csv.DictWriter(f, fieldnames=fieldnames)

    writer.writeheader()

    for i in range(1, 101, 1):
        _id = i
        fname = faker.first_name()
        lname = faker.last_name()
        occupation = faker.job()

        writer.writerow({'id': _id, 'first_name': fname, 
            'last_name': lname, 'occupation': occupation})
```
