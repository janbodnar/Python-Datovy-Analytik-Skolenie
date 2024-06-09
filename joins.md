# Joins

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
