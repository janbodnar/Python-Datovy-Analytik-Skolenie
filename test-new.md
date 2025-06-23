
## Opakovanie

The `data.csv` file:


```python
id,first_name,last_name,occupation,salary
1,John,Doe,gardener,2900
2,Roger,Roe,driver,2150
3,Alice,Smith,teacher,3200
4,Bob,Brown,engineer,4500
5,Charlie,Davis,doctor,5000
6,David,Evans,nurse,2800
7,Eve,Wilson,scientist,6000
8,Frank,Clark,artist,3500
9,Grace,Lewis,musician,4000
10,Hank,Walker,chef,3300
11,Ivy,Hall,writer,3700
12,Jack,Young,lawyer,5200
13,Karen,King,architect,4800
14,Leo,Scott,pilot,5500
15,Mia,Adams,designer,4100
16,Nina,Baker,manager,4600
17,Oscar,Carter,analyst,4300
18,Paul,Mitchell,consultant,4700
19,Quinn,Perez,developer,4400
20,Rose,Roberts,technician,3900
21,Sam,Turner,salesperson,3600
22,Tina,Phillips,accountant,3800
23,Oliver,James,teacher,3100
24,Sophia,Green,doctor,5100
25,Liam,Harris,nurse,2750
26,Emma,Martin,engineer,4550
27,Noah,White,driver,2200
28,Ava,Lee,chef,3250
29,William,Allen,artist,3450
30,Isabella,Hall,writer,3750
31,James,Young,lawyer,5250
32,Charlotte,King,architect,4850
33,Benjamin,Scott,pilot,5550
34,Amelia,Adams,designer,4150
35,Lucas,Baker,manager,4650
36,Mia,Clark,analyst,4350
37,Henry,Mitchell,consultant,4750
38,Ella,Perez,developer,4450
39,Alexander,Roberts,technician,3950
40,Scarlett,Turner,salesperson,3650
41,Daniel,Phillips,accountant,3850
42,Madison,James,teacher,3150
43,Michael,Green,doctor,5150
44,Abigail,Harris,nurse,2850
45,Matthew,Martin,engineer,4600
46,Emily,White,driver,2100
47,David,Lee,chef,3350
48,Elizabeth,Allen,artist,3550
49,Joseph,Hall,writer,3650
50,Chloe,Young,lawyer,5300
51,Samuel,King,architect,4900
52,Victoria,Scott,pilot,5600
53,Andrew,Adams,designer,4200
54,Zoey,Baker,manager,4700
55,Joshua,Clark,analyst,4400
56,Grace,Mitchell,consultant,4800
57,Anthony,Perez,developer,4500
58,Lily,Roberts,technician,4000
59,Christopher,Turner,salesperson,3700
60,Aubrey,Phillips,accountant,3900
61,Ryan,James,teacher,3250
62,Sofia,Green,doctor,5200
63,Nathan,Harris,nurse,2900
64,Avery,Martin,engineer,4650
65,Dylan,White,driver,2250
66,Addison,Lee,chef,3400
67,Isaac,Allen,artist,3600
68,Evelyn,Hall,writer,3800
69,Christian,Young,lawyer,5400
70,Hannah,King,architect,4950
```


```python
import csv
from collections import namedtuple

User = namedtuple('User', 'id first_name last_name occupation salary')

users = []

filename = 'data.csv'
with open(filename, 'r') as file:
    reader = csv.reader(file)
    headers = next(reader)  # Skip the header row
    for row in reader:
        user = User(int(row[0]), row[1], row[2], row[3], int(row[4]))
        users.append(user)


# print number of users
# print users with id 2, 6, 8, 10, 15, 20
# print users with id not in 2, 6, 8, 10, 15, 20
# print the first 5 users
# print last 5 users
# print a random user
# print random 3 users
# print users with last_name starting with 'B' or "W"
# print users with salary > 5000
# print all drivers and teachers
# print min, max, avg salary
# order users by salary descending
# order users by last name ascending

# import this data into a database table 
# and repeat the above operations using SQL queries
```
