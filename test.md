# Priklady

From URL  https://webcode.me/users.json 

Download and save as JSON and CSV. 

Use Copilot!



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


