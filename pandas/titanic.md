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

## Drop rows without Age set

```python
import pandas as pd

titanic_df = pd.read_csv('titanic.csv')
print(len(titanic_df['Age'].dropna()))
```

## Top ten oldest/yougest passangers

```python
import pandas as pd

# Load the Titanic dataset
titanic_df = pd.read_csv('titanic.csv')

# Drop rows with missing Age values
titanic_df = titanic_df.dropna(subset=['Age'])

# Sort by Age
sorted_df = titanic_df.sort_values(by='Age')

# Get the 10 youngest passengers
youngest_passengers = sorted_df.head(10)
print("10 Youngest Passengers:")
print(youngest_passengers[['Name', 'Age']])

# Get the 10 oldest passengers
oldest_passengers = sorted_df.tail(10)
print("\n10 Oldest Passengers:")
print(oldest_passengers[['Name', 'Age']])
```

## Top ten oldest that survived/not survived

```python
import pandas as pd

# Load the Titanic dataset
titanic_df = pd.read_csv('titanic.csv')

# Drop rows with missing Age values
titanic_df = titanic_df.dropna(subset=['Age'])

# Get the top 10 oldest passengers who survived
oldest_survived = titanic_df[titanic_df['Survived'] == 1].sort_values(by='Age', ascending=False).head(10)
print("10 Oldest Passengers Who Survived:")
print(oldest_survived[['Name', 'Age']])

# Get the top 10 oldest passengers who did not survive
oldest_not_survived = titanic_df[titanic_df['Survived'] == 0].sort_values(by='Age', ascending=False).head(10)
print("\n10 Oldest Passengers Who Did Not Survive:")
print(oldest_not_survived[['Name', 'Age']])
```

## Survival rate by gender

```python
import pandas as pd

titanic_df = pd.read_csv('titanic.csv')

# Survival rate by gender
survival_by_gender = titanic_df.groupby('Sex')['Survived'].mean()
print(survival_by_gender)
```

## Survival rate by class

```python
import pandas as pd

titanic_df = pd.read_csv('titanic.csv')

# Survival rate by class
survival_by_class = titanic_df.groupby('Pclass')['Survived'].mean()
print(survival_by_class)
```
