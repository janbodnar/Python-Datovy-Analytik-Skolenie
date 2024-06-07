# SQL language



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

```SQL
ALTER TABLE countries RENAME COLUMN name TO country_name;
```
