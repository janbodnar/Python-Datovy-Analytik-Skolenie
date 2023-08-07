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

sheet.append(['Id', 'First name', 'Last name', 'Occupation'])
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

## Transform CSV data into HTML

Using `csv` and `jinja2` modules.  

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

The template.  

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users</title>
</head>
<body>

    <h2>Users</h2>

    <table>
        <thead>
        <tr>
            <th>Id</th>
            <th>First name</th>
            <th>Last name</th>
            <th>Occupation</th>
        </tr>
        </thead>

        <tbody>
        {% for user in users %}
            <tr>
                <td>{{ user.id }}</td>
                <td>{{ user.first_name }}</td>
                <td>{{ user.last_name }}</td>
                <td>{{ user.occupation }}</td>
            </tr>
        {% endfor %}
        </tbody>
    </table>

</body>
</html>
```

## Return JSON data from a web application

Return JSON data from a Flask application.  

`flask --app webapp run`  

```python
#!/usr/bin/python

from flask import Flask, make_response

app = Flask(__name__)

@app.route("/users")
def get_users():

    users = load_data()

    resp = make_response(users)
    resp.headers['Content-Type'] = 'application/json; charset=utf-8'
    return resp


def load_data():
    with open('users.json', 'r') as f:
        users = f.read()
        return users
```



