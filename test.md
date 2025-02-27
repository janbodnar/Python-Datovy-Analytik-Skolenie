# Priklady

## get username/password from env variables

```python
import os
import psycopg


username = os.environ.get('DB_USERNAME')
password = os.environ.get('DB_PASSWORD')

cs = f"dbname='testdb' user={username} password={password}"

with psycopg.connect(cs) as con:
        
        with con.cursor() as cur:
    
            cur.execute("SELECT * FROM cars")
            rows = cur.fetchall()

            for row in rows:
                print(f"{row[0]} {row[1]} {row[2]}")
```



```python
import csv
import psycopg


file_name = 'mock_data.csv'
users = []


with open(file_name, 'r') as fd:

    reader = csv.DictReader(fd)

    for line in reader:

        row = int(line['id']), line['first_name'], line['last_name'], line['active'], line['entries'], line['DoB']

        users.append(row)


cs = "dbname='testdb' user='postgres' password='postgres'"

with psycopg.connect(cs) as con:
        
    with con.cursor() as cur:

        cur.execute("DROP TABLE IF EXISTS users_mock")
        cur.execute(
            "CREATE TABLE users_mock(id SERIAL PRIMARY KEY, first_name VARCHAR(255), last_name VARCHAR(255), active VARCHAR(10), entries VARCHAR(10), DoB VARCHAR(10))")

        query = "INSERT INTO users_mock (id, first_name, last_name, active, entries, dob) VALUES (%s, %s, %s, %s, %s, %s)"
        cur.executemany(query, users)
```

```python
import pandas as pd

df = pd.read_csv('mock_data.csv')

# Drop columns with all blank values
df = df.drop(columns=['blank1', 'blank2'])

# Replace None with 0 in 'subcr' and 'entries' columns
df['subcr'] = df['subcr'].fillna(0)
df['entries'] = df['entries'].fillna(0)

# print(df)

df.to_csv('mock_data.csv', index=False)
```

```python
import pandas as pd

df = pd.read_csv('mock_data.csv')

# Drop columns with all blank values
df = df.drop(columns=['blank1', 'blank2'])

# Replace None with 0 in 'subcr' and 'entries' columns
df['subcr'] = df['subcr'].fillna(0)
df['entries'] = df['entries'].fillna(0)

# print(df)

# df.to_csv('mock_data2.csv', index=False)

from sqlalchemy import create_engine
engine = create_engine('postgresql://postgres:postgres@localhost:5432/testdb')
df.to_sql('mock_data', engine)
```




## Get SHMU data

```python
import pandas

# pip install pandas lxml 

url = "https://www.shmu.sk/sk/?page=1&id=hydro_vod_all&station_id=5127"

df_list = pandas.read_html(url)

df = df_list[1]

# Display the DataFrame
df.to_csv('shmu.csv', index=False)
```




## Generate users CSV

```python
import faker


file_name = 'users.csv'

faker = faker.Faker()

i = 1

with open(file_name, 'w') as fd:

    fd.write(f'id,first_namne,last_name,email\n')

    for _ in range(150_000):
        first_name = faker.first_name()
        last_name = faker.last_name()
        email = faker.email()

        fd.write(f'{i},{first_name},{last_name},{email}\n')
        
        i += 1

    print('file successfully created')
```

## Copy users.csv into database table

```python
import psycopg

cs = "dbname='testdb' user='postgres' password='postgres'"
with psycopg.connect(cs) as con:

    with con.cursor() as cur:

        cur.execute('DROP TABLE IF EXISTS users')
        cur.execute('CREATE TABLE users(id SERIAL PRIMARY KEY, first_name VARCHAR(255), last_name VARCHAR(255), email VARCHAR(255))')

        with open('users.csv', 'r') as f:

            with cur.copy("COPY users FROM STDIN WITH CSV HEADER") as copy:

                for line in f:
                    copy.write(line)
```





## Copy function


```python
import psycopg

cs = "dbname='testdb' user='postgres' password='postgres'"
with psycopg.connect(cs) as con:

    with con.cursor() as cur:

        cur.execute('DROP TABLE IF EXISTS cars2')
        cur.execute('CREATE TABLE cars2(id SERIAL PRIMARY KEY, name VARCHAR(255), price INTEGER)')

        with open('cars.csv', 'r') as f:

            with cur.copy("COPY cars2 FROM STDIN WITH CSV HEADER") as copy:

                for line in f:
                    copy.write(line)
```



## Correlation

```python
import statistics
import csv

# orbital_period = [88, 225, 365, 687, 4331, 10_756, 30_687, 60_190]    # days
# dist_from_sun = [58, 108, 150, 228, 778, 1_400, 2_900, 4_500] # million km

user_age = []
user_income = []

filename = 'data.csv'

with open(filename, 'r') as fd:

    reader = csv.DictReader(fd)

    for row in reader:
        age = int(row['Age'])
        income = int(row['Income($)'])

        user_age.append(age)
        user_income.append(income)

print(user_age)
print(user_income)

cor = statistics.correlation(user_age, user_income, method='ranked')
print(cor)
```


## Multiple data sources

We have data in three data sources:

- `https://webcode.me/byty.csv`
- `byty.xlsx` file
- `byty` table in `test.db`


the `create_excel_file.py`:

```python
import openpyxl

# Create a new workbook and select the active worksheet
workbook = openpyxl.Workbook()
worksheet = workbook.active

# Set the headers
headers = ["id", "typ", "mesto", "cena"]
worksheet.append(headers)

# Add the data
data = [
    [1, "1i", "Košice", 69000],
    [2, "2i", "Michalovce", 74500],
    [3, "1i", "Prešov", 87000],
    [4, "3i", "Košice", 120000],
    [5, "4i", "Košice", 140000],
    [6, "2i", "Bardejov", 87000]
]

for row in data:
    worksheet.append(row)

# Save the workbook
workbook.save("byty.xlsx")
print("Excel file 'byty.xlsx' created successfully!")
```

the `create_db_table.py`:

```python
import sqlite3

con = sqlite3.connect('test.db')

with con:
    
    cur = con.cursor()    
    cur.execute("CREATE TABLE byty(id INTEGER PRIMARY KEY, typ TEXT, mesto TEXT, cena INT)")
    cur.execute("INSERT INTO byty(typ, mesto, cena) VALUES('1i', 'Bratislava', 99800)")
    cur.execute("INSERT INTO byty(typ, mesto, cena) VALUES('2i', 'Bratislava', 124000)")
    cur.execute("INSERT INTO byty(typ, mesto, cena) VALUES('3i', 'Bratislava', 230000)")
    cur.execute("INSERT INTO byty(typ, mesto, cena) VALUES('1i', 'Bratislava', 119000)")
    cur.execute("INSERT INTO byty(typ, mesto, cena) VALUES('2i', 'Bratislava', 250800)")
    cur.execute("INSERT INTO byty(typ, mesto, cena) VALUES('1i', 'Bratislava', 90800)")
```



```python
import sqlite3
import openpyxl
import requests
import csv
import uuid
from collections import namedtuple
from itertools import groupby


Byt = namedtuple('Byt', 'id typ mesto cena')

byty = []


def read_db():
    with sqlite3.connect('test.db') as con:
        cur = con.cursor()
        cur.execute("SELECT * FROM byty")
        rows = cur.fetchall()
        for row in rows:
            byty.append(row)


def read_excel():

    workbook = openpyxl.load_workbook('byty.xlsx')
    worksheet = workbook.active

    for row in worksheet.iter_rows(min_row=2, values_only=True):
        byty.append(row)


def fetch_csv():

    url = 'https://webcode.me/byty.csv'
    resp = requests.get(url)

    resp.raise_for_status()

    data = resp.text

    reader = csv.DictReader(data.splitlines())
    byty_csv = [(row['id'], row['typ'], row['mesto'], int(row['cena']))
                for row in reader]

    byty.extend(byty_csv)


read_db()
read_excel()
fetch_csv()


byty_cleaned = [Byt(uuid.uuid4(), e[1], e[2], e[3]) for e in byty]

sorted_cena = sorted(byty_cleaned, key=lambda x: x.cena)

print('sorted by cena')

for e in sorted_cena:
    print(e)

print('---------------------------------')

print('grouped by mesto')

sorted_mesto = sorted(byty_cleaned, key=lambda x: x.mesto)
grouped_mesto = groupby(sorted_mesto, key=lambda x: x.mesto)

for mesto, group in grouped_mesto:
    print(mesto)
    for e in group:
        print(e)
```




## The countries DDL


```sql
CREATE TABLE countries(id serial PRIMARY KEY, name VARCHAR(255), capital VARCHAR(255), population INT, area DECIMAL(10, 2), continent VARCHAR(255));
```


## Opakovanie

Dataset: `countries.csv`

- list all countries in Europe
- print total world population
- extract 3 cols (name, capital, population) and 50 rows into `countries_3c_50r.csv`
- print all continents
- calculate all population in Europe
- list countries with population > 300 mil
- list countries with population < 10 mil
- list top 10 European countries with largest populations
- list the smallest country by area
- list the three smallest countries by area
- list the country with largest population
- sum populations of all continents
- count countries by continent


## Common operations

| Operation | Example | Description |
|-----------|---------|-------------|
| Display first `n` rows | `df.head(5)` | Shows the first 5 rows of the DataFrame. |
| Display last `n` rows | `df.tail(5)` | Shows the last 5 rows of the DataFrame. |
| Summary of DataFrame | `df.info()` | Provides a concise summary of the DataFrame, including data types and non-null counts. |
| Descriptive statistics | `df.describe()` | Generates descriptive statistics for numerical columns. |
| Access by labels | `df.loc[0:5, ['column_name1', 'column_name2']]` | Accesses rows 0 to 5 for specified columns. |
| Access by positions | `df.iloc[0:5, 0:2]` | Accesses rows 0 to 5 for the first two columns. |
| Query with boolean expression | `df[df['column_name'] > 50]` | Filters rows where 'column_name' is greater than 50. |
| Drop columns | `df.drop(columns=['column_name'])` | Drops the specified column(s) from the DataFrame. |
| Detect missing values | `df.isna()` | Detects missing values, returning a DataFrame of booleans. |
| Fill missing values | `df.fillna(0)` | Fills missing values with 0. |
| Find smallest countries by area |	df.nsmallest(5, 'area')	| Selects the 5 smallest countries by the 'area' column. |
| Count countries by continent | df['continent'].value_counts()	| Counts the number of countries in each continent. |
| Sum a column	| df['population'].sum() | Sums up the values in the 'population' column. |
| Group by column | `df.groupby('column_name').mean()` | Groups the DataFrame by 'column_name' and calculates the mean. |
| Merge DataFrames | `df.merge(df2, on='column_name')` | Merges two DataFrames on 'column_name'. |
| Sort by column | `df.sort_values(by='column_name')` | Sorts the DataFrame by 'column_name'. |
| Pivot table | `df.pivot_table(values='value', index='idx', columns='cols')` | Creates a pivot table based on 'value', 'idx', and 'cols'. |
| Apply function | `df['column_name'].apply(lambda x: x*2)` | Applies a function to double the values in 'column_name'. |


## Riesenia

```python
import pandas as pd


file_name = 'countries.csv'
df = pd.read_csv(file_name)

# Group by continent and sum the population
population_by_continent = df.groupby('continent')['population'].sum()

# Print the result
print(population_by_continent)


# file_name = 'countries.csv'
# df = pd.read_csv(file_name)

# df.drop(columns=['area', 'continent'], inplace=True)
# df.iloc[50:101].to_csv('countries_3c_50r.csv', index=False)

# smallest_area_country = df.loc[df['area'].idxmin()]
# print(smallest_area_country)

# min_area = df['area'].min()
# smallest_area_country = df.query('`area` == @min_area')
# print(smallest_area_country)

# smallest_area = df.nsmallest(1, 'area') 
# print(smallest_area)

# top_three_smallest_areas = df.nsmallest(3, 'area') 
# print("Top three countries with the smallest area:") 
# print(top_three_smallest_areas)

# print(set(df['continent']))
# print(df['continent'].unique())

# total_world_population = df['population'].sum()
# print(f'{total_world_population:,}')

# df.query("continent == 'Europe'", inplace=True)
# print(df)
```



## Write chart to Excel 

```python
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

# Generate random data
x = np.random.randint(100, size=(100))
y = np.random.randint(100, size=(100))
colors = np.random.randint(100, size=(100))
sizes = 10 * np.random.randint(100, size=(100))

# Create scatter plot
plt.scatter(x, y, c=colors, s=sizes, alpha=0.5, cmap='nipy_spectral')
plt.colorbar()

# Save the chart as an image
plt.savefig('scatter_plot.png')

# Show the plot
plt.show()

# Create a Pandas DataFrame
df = pd.DataFrame({
    'x': x,
    'y': y,
    'colors': colors,
    'sizes': sizes
})

# Write the DataFrame to an Excel file with the image
with pd.ExcelWriter('chart_with_data.xlsx', engine='xlsxwriter') as writer:
    df.to_excel(writer, sheet_name='Data', index=False)

    # Access the XlsxWriter workbook and worksheet objects
    workbook = writer.book
    worksheet = writer.sheets['Data']

    # Insert the image into the worksheet
    worksheet.insert_image('E2', 'scatter_plot.png')
```





Filter males in Legal & Finance

```python
import pandas as pd

# Read data from the CSV file
employees_df = pd.read_csv('employees.csv')

# Filter for males in the Legal and Finance teams
filtered_df = employees_df[(employees_df['Gender'] == 'Male') &
                           (employees_df['Team'].isin(['Legal', 'Finance']))]

print(filtered_df)
```


## Converters

Float to Decimal

```python
import pandas as pd
from decimal import Decimal

# Define the conversion function
def to_decimal(value):
    return Decimal(value)

# Load the products dataset with converters for specific columns
products_df = pd.read_csv('products.csv', converters={
    'unit_price': to_decimal,
})

# Calculate the mean using the Decimal type
mean_val = sum(products_df['unit_price']) / len(products_df)

print(products_df.dtypes)
print(type(mean_val))
print("Mean unit price:", mean_val)
```



## Sort by multiple columns 

```python
import pandas as pd

# Read data from the CSV file
df = pd.read_csv('products.csv')

# Sort the DataFrame by category and units_in_stock
df_sorted = df.sort_values(by=['category', 'units_in_stock'], ascending=[True, False])

# Display the sorted DataFrame
print(df_sorted)
```



## Most common values

```python
from collections import Counter

grades_numeric = [1, 2, 1, 1, 3, 4, 4, 5, 1, 2, 3, 1, 1, 2, 3]
grades_alpha = ['A', 'B', 'B', 'C', 'C', 'B', 'F', 'FX', 'C', 'D']

# Find the most common elements
counter_numeric = Counter(grades_numeric)
counter_alpha = Counter(grades_alpha)

# Get the most common elements and their counts
most_common_numeric = counter_numeric.most_common()
most_common_alpha = counter_alpha.most_common()

# Extract the second and third most common values
second_most_common_numeric = most_common_numeric[1][0]
third_most_common_numeric = most_common_numeric[2][0]

second_most_common_alpha = most_common_alpha[1][0]
third_most_common_alpha = most_common_alpha[2][0]

print(f"Second most common numeric grade: {second_most_common_numeric}")
print(f"Third most common numeric grade: {third_most_common_numeric}")

print(f"Second most common alphabetic grade: {second_most_common_alpha}")
print(f"Third most common alphabetic grade: {third_most_common_alpha}")
```



## Partitioning

```python
from funcy import split

values = [1, 2, -3, 4, 5, -6, 7, -8, 9, 10]

neg, pos = split(lambda e: e < 0, values)

print(list(neg))
print(list(pos))
```



## Riesenie s std kniznicami

```python
import requests
import csv

# URL to fetch the JSON data
url = "https://webcode.me/users.json"

# Fetch the JSON data from the URL
response = requests.get(url)
data = response.json()

# Extract the list of users
users = data["users"]

# Define the CSV file name
csv_file = "users.csv"

# Write the data to a CSV file
with open(csv_file, mode='w', newline='') as file:
    writer = csv.writer(file)
    # Write the header
    writer.writerow(["id", "first_name", "last_name", "email"])
    # Write the user data
    for user in users:
        writer.writerow([user["id"], user["first_name"], user["last_name"], user["email"]])

print(f"Data has been successfully written to {csv_file}.")
```


## Riesenie s Pandas

```python
import requests
import pandas as pd

# URL to fetch the JSON data
url = "https://webcode.me/users.json"

# Fetch the JSON data from the URL
response = requests.get(url)
data = response.json()

# Extract the list of users
users = data["users"]

# Create a DataFrame from the list of users
df = pd.DataFrame(users)

# Define the CSV file name
csv_file = "users2.csv"

# Write the DataFrame to a CSV file
df.to_csv(csv_file, index=False)

print(f"Data has been successfully written to {csv_file}.")
```


