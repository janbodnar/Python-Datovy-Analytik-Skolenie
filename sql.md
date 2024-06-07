# SQL language

*SQL (Structured Query Language)* is a domain-specific language used to manage data, especially  
in a relational database management system (RDBMS). 


## DDL & DML
**Data Definition Language (DDL)** and **Data Manipulation Language (DML)** are two types   
of sublanguages used in SQL for different purposes:  

1. **DDL (Data Definition Language)**: DDL is used to define the structure of the database.  
It deals with database schemas and descriptions of how the data should reside in the database.  
The main DDL commands in SQL include:  

- `CREATE` - to create a database and its objects like table, index, views, stored procedure,  
  function, and triggers.  
- `ALTER` - alters the structure of the existing database.  
- `DROP` - deletes objects from the database.
- `TRUNCATE` - removes all records from a table, including all spaces allocated for the records.  
- `RENAME` - renames an object.

3. **DML (Data Manipulation Language)**: DML is used to manipulate the data itself. It deals with  
   data manipulation and includes most common SQL statements.  
   The main DML commands in SQL include:
   
- `SELECT` - retrieves data from one or more tables.
- `INSERT` - inserts data into a table.
- `UPDATE` - updates existing data within a table.
- `DELETE` - deletes all records from a table.
- `MERGE` - UPSERT operation (insert or update).

In summary, `DDL` is used for defining the structure of the database, while `DML` is used for manipulating  
the data within that structure.





## CREATE TABLE

`PRIMARY KEY` is a column or a group of columns used to uniquely identify a row in a table. The primary key  
constraint is a combination of a `NOT NULL` constraint and a `UNIQUE` constraint. This means that the column  
or group of columns defined as the primary key must have non-null and unique values.  

```SQL
CREATE TABLE countries(id serial PRIMARY KEY, name VARCHAR(255), population INTEGER);
INSERT INTO countries(name, population) VALUES('China', 1382050000);
INSERT INTO countries(name, population) VALUES('India', 1313210000);
INSERT INTO countries(name, population) VALUES('USA', 324666000);
```

## ALTER TABLE

Rename column, add constraint.  

```SQL
ALTER TABLE countries RENAME COLUMN name TO country_name;
ALTER TABLE countries ADD CONSTRAINT country_unique UNIQUE(country_name)
ALTER TABLE countries DROP CONSTRAINT country_unique;
```

Add new column.  

```SQL
ALTER TABLE countries ADD capital_city VARCHAR(255);
```

## UPDATE statement

```SQL
UPDATE countries SET capital_city = 'Beijing' WHERE name = 'China';
UPDATE countries SET capital_city = 'New Delhi' WHERE name = 'India';
UPDATE countries SET capital_city = 'Washington' WHERE name = 'USA';
```

## DROP TABLE

```SQL
DROP TABLE countries;
DROP TABLE IF EXISTS countries;
```

## SELECT 

Scalar values.  

```SQL
SELECT VERSION();
```

Expressions.  

```SQL
SELECT 3 + 5 as output;
SELECT (3 + 5) * 3 as output;
```

Functions.  

```SQL
SELECT POWER(3, 3), SQRT(81), ABS(-5);
SELECT TRIM(LEADING '.' FROM '...falcon...');
SELECT TRIM(TRAILING '.' FROM '...falcon...');
SELECT TRIM(BOTH '.' FROM '...falcon...');
```


Selecting columns.  

```SQL
SELECT * from countries;
SELECT name, population FROM countries;
```

Rename column in output with `AS`. 

```SQL
SELECT id, name as "country name", population FROM countries;
```

Date & time. 

```SQL
SELECT NOW(); -- date and time
SELECT current_date; -- date
SELECT current_time; -- time
```


## LIMIT clause

```SQL
SELECT * FROM countries LIMIT 10;
SELECT * FROM countries LIMIT 10 OFFSET 5;
```

## WHERE clause 

```SQL
SELECT name, population FROM countries WHERE id = 5;
SELECT name, population FROM countries WHERE population > 100_000_000;
SELECT name, population FROM countries WHERE population BETWEEN 100_000_000 AND 300_000_000;
```

```SQL
SELECT * FROM countries WHERE name LIKE 'I%';
```

## ORDER BY clause

```SQL
SELECT * FROM countries ORDER BY name;
SELECT * FROM countries ORDER BY name ASC;
SELECT * FROM countries ORDER BY name DESC;
```


