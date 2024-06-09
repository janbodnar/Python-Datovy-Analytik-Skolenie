# Joins

A *SQL JOIN* operation combines rows from two or more tables based on a related column between them.  
It allows us to query data from multiple tables as if they were a single table.   

Common types of SQL JOIN operations:

1. **INNER JOIN**: Returns records that have matching values in both tables.  
2. **LEFT (OUTER) JOIN**: Returns all records from the left table, and the matched  
   records from the right table. If there is no match, the result is NULL on the right side.  
4. **RIGHT (OUTER) JOIN**: Returns all records from the right table, and the matched records from  
   the left table. If there is no match, the result is NULL on the left side.  
6. **FULL (OUTER) JOIN**: Returns all records when there is a match in either the left or the right  
   table. If there is no match, the result is NULL on either side.  
8. **SELF JOIN**: A self join is a regular join, but the table is joined with itself.  
9. **CROSS JOIN**: Returns the Cartesian product of sets. It returns a result set which is the number  
   of rows in the first table multiplied by the number of rows in the second table if no `WHERE`  
   clause is used along with `CROSS JOIN`.
11. **NATURAL JOIN**: A type of INNER JOIN where the join clause is implicitly based on the columns in the  
    two tables that have the same name. It selects records from the two tables that have matching values  
    in relevant columns.  


The most common type of SQL JOIN operation is the **INNER JOIN**. This type of join returns records that have  
matching values in both tables. It's widely used due to its efficiency and usefulness in combining data from  
two tables where a clear relationship exists.  


## INNER JOIN

An `INNER JOIN` returns records that have matching values in both tables involved in the join.  
Only customers who have made a reservation will be included in the result. Customers without reservations  
and reservations without customers will not appear in the result.

```SQL
SELECT reservation_date, name, email
FROM reservations 
JOIN customers 
ON reservations.customer_id = customers.id;
```

Specific Id:

```SQL
SELECT reservation_date, name, email
FROM reservations 
JOIN customers 
ON reservations.customer_id = customers.id
WHERE customers.id = 9;
```

## LEFT JOIN

`LEFT JOIN` (or `LEFT OUTER JOIN`): This type of join returns all the records from the left table,  
and the matched records from the right table. If there is no match, the result is `NULL` on the right side.  

```SQL
SELECT customers.name, reservations.reservation_date
FROM customers
LEFT JOIN reservations ON customers.id = reservations.customer_id;
```

## RIGHT JOIN

`RIGHT JOIN` (or `RIGHT OUTER JOIN`) returns all the records from the right table, and the matched records  
from the left table. If there is no match, the result is `NULL` on the left side.

```SQL
SELECT customers.name, reservations.reservation_date
FROM customers
RIGHT JOIN reservations ON customers.id = reservations.customer_id;
```

## FULL OUTER JOIN

`FULL JOIN` (or `FULL OUTER JOIN`) returns all records when there is a match in either the left or the right  
table. If there is no match, the result is `NULL` on the side that doesn't have a match.  

```SQL
SELECT customers.name, reservations.reservation_date
FROM customers
LEFT JOIN reservations ON customers.id = reservations.customer_id;
```
