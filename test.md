# Samples

```
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



```python
import statistics
import csv
from dataclasses import dataclass

@dataclass
class User:
    name: str
    age: int
    income: int


users = []

fname = 'data.csv'
with open(fname) as f:

    next(f)

    reader = csv.reader(f)

    for row in reader:
        users.append(User(*row))


print(users)

ages = [int(user.age) for user in users]
incomes = [int(user.income) for user in users] 

print(ages)
print(incomes)

cor = statistics.correlation(ages, incomes)
print(cor)
```
