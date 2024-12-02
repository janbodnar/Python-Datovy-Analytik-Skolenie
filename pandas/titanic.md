# Titanic dataset 

It's a well-known dataset used for machine learning and data analysis, containing information  
about the passengers on the Titanic. The data includes details such as passenger ID, survival status,  
class, name, sex, age, number of siblings/spouses, number of parents/children, ticket number, fare,  
cabin, and port of embarkation

## Load the data

```python
import pandas as pd

# Load the Titanic dataset
titanic_df = pd.read_csv('titanic.csv')
print(titanic_df.head())
```

## Check for missing values 

```python
import pandas as pd

titanic_df = pd.read_csv('titanic.csv')

# Check for missing values
print(titanic_df.isnull().sum())
```
