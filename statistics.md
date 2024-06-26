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

