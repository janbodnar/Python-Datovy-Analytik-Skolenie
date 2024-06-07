# PostgreSQL

PostgreSQL is a robust, freely available object-relational database system. It uses and enhances the SQL language,  
offering numerous capabilities that ensure the secure storage and scalability of even the most complex data tasks.  
The inception of PostgreSQL can be traced back to 1986, originating from the POSTGRES project at the University  
of California, Berkeley.  

It has over 35 years of continuous development on its fundamental platform.  

Download at https://www.postgresql.org/download/

```
C:\Users\Jano\opt\postgre>bin\pg_ctl.exe -D data start
C:\Users\Jano\opt\postgre>bin\pg_ctl.exe -D data stop
```

## Concepts 

PostgreSQL is a relational database management system (RDBMS), which is responsible for managing data stored in  
structures called relations, or more commonly, tables. The concept of storing data in table format is widely  
accepted today, although there are alternative database organization methods. For instance, Unix-like operating  
systems use files and directories, representing a hierarchical database, while object-oriented databases represent  
a more recent innovation.

In this system, each table is a collection of rows, each identified by a name. Every row in a specific table  
shares the same set of named columns, with each column being of a particular data type. While each row  
maintains a fixed order of columns, it's crucial to note that SQL does not assure any specific order of the rows  
within the table, although they can be sorted for display purposes.

These tables are organized into *databases*, and a group of databases managed by a single PostgreSQL server  
instance forms a *database cluster*.

## Types

List of basic Python types and their PostgreSQL equivalents:

| Python Type | PostgreSQL Equivalent |
|-------------|-----------------------|
| `bool`      | `boolean`             |
| `int`       | `smallint`, `integer`, `bigint`, `numeric` |
| `float`     | `real`, `double precision` |
| `Decimal`   | `numeric`, `decimal`  |
| `str`       | `text`, `varchar`, `char` |
| `bytes`     | `bytea`               |
| `datetime.date` | `date`           |
| `datetime.time` | `time`, `timetz` |
| `datetime.datetime` | `timestamp`, `timestamptz` |
| `datetime.timedelta` | `interval`  |
| `list`, `tuple` | `array`          |
| `uuid.UUID` | `uuid`               |
| `dict`      | `json`, `jsonb`      |
| `None`      | `NULL`               |




## psycopg2 driver

```python
import psycopg2
from rich.console import Console
from rich.table import Table
from rich import box
from datetime import date

con = psycopg2.connect(database='postgres',  user='postgres',  password='s$cret')

with con:

    cur = con.cursor()
    cur.execute('SELECT * FROM cars')
    rows = cur.fetchall()

    col_names = [cn[0] for cn in cur.description]

    now = f'{date.today()}'
    table = Table(title='Cars', box=box.MINIMAL, caption=now,
                caption_justify='left')

    for col_name in col_names:
        table.add_column(col_name)

    for row in rows:

        # table.add_row(str(row[0]), row[1], str(row[2]))
        # pars = [str(e) for e in (*row,)]
        pars = [str(e) for e in row]
        table.add_row(*pars)

    console = Console()
    console.print(table, justify='center')
```
