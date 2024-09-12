# Priklady

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
