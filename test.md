# Priklady

From URL  https://webcode.me/users.json 

Download and save as JSON and CSV. 

Use Copilot!


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


