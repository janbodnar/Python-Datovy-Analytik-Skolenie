# Statistics 


## Arithmetic mean

```python
import statistics

scores = [89, 93, 94, 99, 83, 81, 90, 78, 87, 98, 93, 92]

mean = statistics.mean(scores)
print(mean)
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

