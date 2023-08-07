# Tasks

## Generate test data in CSV format

Generating user data with `faker` and `csv` modules.  

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

## Transform CSV data into XLSX format

Using `csv` and `openpyxl` modules.  

```python
#!/usr/bin/python

from openpyxl import Workbook
import csv

def read_data(data):

    with open('users.csv', 'r') as f:
        reader = csv.DictReader(f)
        
        for row in reader:
            data.append((int(row['id']), row['first_name'], 
                row['last_name'], row['occupation']))

data = []

book = Workbook()
sheet = book.active

read_data(data)

for e in data:
    sheet.append(e)

book.save('users.xlsx')
```

## Transform CSV data into JSON

Using `csv` and `json` modules.  

```python
#!/usr/bin/python

from openpyxl import Workbook
import json, csv

def read_data(data):

    with open('users.csv', 'r') as f:
        reader = csv.DictReader(f)
        
        for row in reader:
            data.append({'id': row['id'], 'first_name': row['first_name'], 
                'last_name': row['last_name'], 'occupation': row['occupation']})

data = []
read_data(data)

with open('users.json', 'w') as f:
    json.dump(data, f)
```


