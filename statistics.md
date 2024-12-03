# Statistics 


## Arithmetic mean

```python
import statistics

scores = [89, 93, 94, 99, 83, 81, 90, 78, 87, 98, 93, 92]

mean = statistics.mean(scores)
print(mean)
```

## Weighted mean

```python
import statistics

u1 = {'name': 'Paul', 'scores': {'math': 98, 'biology': 65, 'English': 89, 'chemistry': 71}}
u2 = {'name': 'John', 'scores': {'math': 88, 'biology': 81, 'English': 88, 'chemistry': 99}}
u3 = {'name': 'Boris', 'scores': {'math': 90, 'biology': 93, 'English': 70, 'chemistry': 100}}

users = [u1, u2, u3]

class_w = {'math': 0.6, 'biology': 0.1, 'English': 0.3, 'chemistry': 0.1}

for u in users:
    data = [u['scores'][subject] for subject in class_w.keys()]
    weights = class_w.values()
    total_score = statistics.fmean(data, weights=weights)
    print(total_score)
```

## Standard deviation

```python
import statistics

scores = [89, 93, 94, 99, 83, 81, 90, 78, 87, 98, 93, 92]

stdev = statistics.stdev(scores)
print(stdev)

var = statistics.variance(scores)
print(var)
```

## Median

Median is the middle value.  

```python
import statistics


salaries = [980, 770, 890, 1120, 1000, 990, 1200, 1320, 1110, 980, 5600, 7800]

mean = statistics.mean(salaries)
print(mean)

mean = statistics.median(salaries)
print(mean)

medh = statistics.median_high(salaries)
print(medh)

medl = statistics.median_low(salaries)
print(medl)

print(sorted(salaries))
```

## Mode 

Mode is the single most common data point from discrete or nominal data.   

```python
import statistics

grades = [1, 2, 1, 1, 3, 4, 4, 5, 1, 2, 3, 1, 1, 2, 3 ]
print(statistics.mode(grades))

grades = ['A', 'B', 'B', 'C', 'C', 'B', 'F', 'FX', 'C', 'D']
print(statistics.mode(grades))
```

## Correlation

Correlation is a measure that expresses the extent to which two variables are linearly  
related, meaning they change together at a constant rate. It's a common tool for describing  
simple relationships without making a statement about cause and effect.  

The correlation is quantified by the *correlation coefficient*, often denoted as `r`, which   
measures the strength of the linear relationship between two variables1. The correlation  
coefficient ranges from `-1` to `+1`. A correlation coefficient close to `0` indicates a weak linear  
relationship. Positive `r` values indicate a positive correlation.


```python
import statistics

orbital_period = [88, 225, 365, 687, 4331, 10_756, 30_687, 60_190]    # days
dist_from_sun = [58, 108, 150, 228, 778, 1_400, 2_900, 4_500] # million km

cor = statistics.correlation(orbital_period, dist_from_sun, method='ranked')
print(cor)
```

Age/Income dataset.  

Calculate correlation. 

```csv
Name,Age,Income($)
Rob,27,60000
Michael,29,66000
Mohan,29,61000
John,28,60000
Peter,42,150000
Roman,39,155000
David,41,160000
Andrea,38,162000
Brad,36,156000
Angelina,35,130000
Donald,37,137000
Tom,26,45000
Arnold,27,48000
Jared,28,51000
Stark,29,49500
Ranbir,32,53000
Stefan,40,65000
Patrik,41,63000
Nick,43,94000
Alia,39,80000
Sid,41,112000
Abdul,39,58000
```

Calculate stats from JSON data:

```json
[
    {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "salary": 2380
    },
    {
        "name": "Roger Roe",
        "email": "roger.roe@example.com",
        "salary": 980
    },
    {
        "name": "Paul Novak",
        "email": "paul.novak@example.com",
        "salary": 1050
    },
    {
        "name": "Lucia Williams",
        "email": "lucia.williams@example.com",
        "salary": 1970
    },
    {
        "name": "Peter Novotny",
        "email": "peter.novotny@example.com",
        "salary": 2230
    },
    {
        "name": "Samuel Green",
        "email": "samuel.green@example.com",
        "salary": 890
    },
    {
        "name": "Saul Peterson",
        "email": "saul.peterson@example.com",
        "salary": 990
    },
    {
        "name": "Walter Smith",
        "email": "walter.smith@example.com",
        "salary": 1180
    },
    {
        "name": "Paul Smith",
        "email": "paul.smith@example.com",
        "salary": 2130
    },
    {
        "name": "Martin Meszaros",
        "email": "martin.meszaros@example.com",
        "salary": 890
    }
]
```

## What is linear regression

Linear regression is a statistical method used to model the relationship between a dependent  
variable and one or more independent variables. It assumes a linear relationship between the  
variables, which can be represented by a straight line. The goal is to find the best-fitting  
line through the data points that minimizes the difference between the observed values  
and the predicted values.

## Key Concepts 

1. *Dependent Variable*:
   - The variable you are trying to predict or explain (also called the response variable).
   - In our earlier example, this would be `Income`.

2. *Independent Variable(s)*:
   - The variable(s) you are using to make predictions (also called predictor variables).
   - In our example, this would be `Age`.

3. *Equation of the Line*:
   - The linear regression line can be expressed as:
     \[
     y = mx + c
     \]
     - \( y \) is the dependent variable.
     - \( x \) is the independent variable.
     - \( m \) is the slope of the line.
     - \( c \) is the y-intercept (the value of \( y \) when \( x \) is 0).

4. **Slope (m)**:
   - Indicates the rate at which the dependent variable changes with respect to the independent variable.
   - A positive slope means that as the independent variable increases, the dependent variable also increases.

5. *Intercept (c)*:
   - The value of the dependent variable when the independent variable is zero.
   - It represents the starting point of the line on the y-axis.


Using our dataset with `Age` and `Income`, the linear regression line predicts how `Income` changes with `Age`. 

## Calculation

To calculate the line of best fit, we can use the least squares method, which minimizes the sum of the squared   
differences between observed and predicted values.

## Visualization

Visualizing linear regression helps to understand how well the line fits the data points and the overall trend.

## Code Example


Here's how we can calculate and plot the linear regression for the given `Age` and `Income` data:

```python
import matplotlib.pyplot as plt
import statistics

# Sample data
ages = [25, 28, 30, 32, 35, 38, 40, 42, 45, 48]
incomes = [30000, 34000, 40000, 45000, 48000, 52000, 60000, 61000, 70000, 72000]

# Calculate linear regression
slope, intercept = statistics.linear_regression(ages, incomes)

# Function to calculate predicted income based on age
def predict_income(age):
    return slope * age + intercept

# Generate predicted values
predicted_incomes = [predict_income(age) for age in ages]

# Plot the data points
plt.scatter(ages, incomes, color='blue', label='Actual Incomes')

# Plot the regression line
plt.plot(ages, predicted_incomes, color='red', label='Regression Line')

# Add labels and title
plt.xlabel('Age')
plt.ylabel('Income ($)')
plt.title('Linear Regression of Age vs. Income')
plt.legend()

# Show the plot
plt.show()
```

This code visualizes the relationship between age and income, showing how well the linear regression 
line fits the data points and captures the trend. Linear regression is widely used in predictive modeling,  
trend analysis, and many other applications across various fields.





