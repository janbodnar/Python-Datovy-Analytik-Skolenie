# psycopg2

Psycopg is the most popular PostgreSQL database adapter for the Python programming  
language. Its main features are the complete implementation of the Python DB API 2.0  
specification and the thread safety (several threads can share the same connection).  

Basic terms:

1. **Connection**: A database connection allows  client software to communicate with database  
   server software. A connection is required  to send commands and receive answers, usually  
   in the form of a result set.   
3. **Cursor**: A database cursor is a mechanism that enables traversal over the records in  
   a database. Cursors facilitate subsequent processing in conjunction with the traversal,  
   such as retrieval, addition, and removal of database records.  
5. **Result Set**: A result set is the set of results returned by a query, usually in the same  
   format as the database the query is called on.  
7. **Query**: A database query is a request for data from a database. The request should come in   
   a database table or a combination of tables using a code known as the query language. This way,  
   the system can understand and process the query accordingly.




## Scalar value

```python
import psycopg2
import sys

con = None

try:

    con = psycopg2.connect(host="localhost", database='testdb', user='postgres',
        password='s$cret')

    cur = con.cursor()
    cur.execute('SELECT version()')

    version = cur.fetchone()[0]
    print(version)

except psycopg2.DatabaseError as e:

    print(f'Error {e}')
    sys.exit(1)

finally:

    if con:
        con.close()
```

---

```python
import psycopg2

with psycopg2.connect(database='testdb', user='postgres',
                      password='s$cret') as con:

    cur = con.cursor()
    cur.execute('SELECT version()')

    version = cur.fetchone()[0]
    print(version)
```


