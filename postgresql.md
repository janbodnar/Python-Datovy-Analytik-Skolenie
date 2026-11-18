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




## Psycopg 3 driver

Psycopg 3 is the current version of Psycopg, the most popular PostgreSQL database adapter for Python. It is a  
complete rewrite of psycopg2 that keeps the familiar Python DB API 2.0 interface and adds support for modern  
Python and PostgreSQL features.  

Psycopg 3 can run as pure Python on top of the system `libpq` library. You can also install an optional C  
extension for better performance. It supports both synchronous and `asyncio` code. It uses server-side  
parameter binding, prepared statements and pipeline mode, and it has an improved `COPY` API. It also includes  
static type hints and a separate connection pool package, `psycopg_pool`. Connections can be shared between  
threads, but each cursor should be used by only one thread. Many Python types are adapted to matching  
PostgreSQL types out of the box, and you can customize adaptation through its adapter system.  

```
$ pip install "psycopg[binary]"
```

The `binary` extra installs a precompiled C implementation together with its own copy of `libpq`. This is the
simplest way to get started.

```python
import psycopg
from rich.console import Console
from rich.table import Table
from rich import box
from datetime import date

with psycopg.connect(dbname='testdb', user='postgres',
                     password='s$cret') as con:

    with con.cursor() as cur:

        cur.execute('SELECT * FROM cars')
        rows = cur.fetchall()

        col_names = [col.name for col in cur.description]

now = f'{date.today()}'
table = Table(title='Cars', box=box.MINIMAL, caption=now,
              caption_justify='left')

for col_name in col_names:
    table.add_column(col_name)

for row in rows:
    pars = [str(e) for e in row]
    table.add_row(*pars)

console = Console()
console.print(table, justify='center')
```

The example retrieves all rows from the `cars` table and displays them in a table made with the `rich` library. 

```python
with psycopg.connect(dbname='postgres', user='postgres',
                     password='s$cret') as con:
```

The `connect` function creates a new database session. Psycopg 3 uses the standard libpq parameter name  
`dbname`. When the `with` block ends, the transaction is committed, or rolled back if an exception occurred,  
and the connection is **closed**. In psycopg2, the connection stayed open after the block.  

```python
with con.cursor() as cur:
```

The cursor is also a context manager and is closed automatically at the end of the block.

```python
col_names = [col.name for col in cur.description]
```

In Psycopg 3, `cur.description` holds `Column` objects, so you can read the column name from the `name`  
attribute. Indexing with `col[0]` still works for DB API compatibility.

