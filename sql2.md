# SQL 

Basics:  

## 1. Selecting All Data

```sql
SELECT * FROM countries;
```
This query retrieves all columns and rows from the `countries` table.

## 2. Selecting Specific Columns

```sql
SELECT name, capital FROM countries;
```
This query retrieves only the `name` and `capital` columns from the `countries` table.

## 3. Filtering Data with `WHERE`

```sql
SELECT * FROM countries WHERE continent = 'Europe';
```
This query retrieves all rows where the `continent` is 'Europe'.

## 4. Sorting Data with `ORDER BY`

```sql
SELECT * FROM countries ORDER BY population DESC;
```
This query retrieves all rows sorted by the `population` column in descending order.

## 5. Counting Rows

```sql
SELECT COUNT(*) FROM countries WHERE continent = 'Africa';
```
This query counts the number of rows where the `continent` is 'Africa'.

## 6. Summing Values

```sql
SELECT SUM(population) AS total_population FROM countries WHERE continent = 'Asia';
```
This query sums the `population` of all rows where the `continent` is 'Asia'.

## 7. Grouping Data with `GROUP BY`

```sql
SELECT continent, COUNT(*) AS num_countries FROM countries GROUP BY continent;
```
This query counts the number of countries per continent.

## 8. Using `HAVING` with `GROUP BY`

```sql
SELECT continent, COUNT(*) AS num_countries FROM countries GROUP BY continent HAVING COUNT(*) > 10;
```

This query counts the number of countries per continent and only returns  
continents with more than 10 countries.  

## 9. Updating Data

```sql
UPDATE countries SET population = population + 100000 WHERE name = 'Germany';
```
This query increases the `population` of Germany by 100,000.

## 10. Deleting Data

```sql
DELETE FROM countries WHERE name = 'Country X';
```
This query deletes the row where the `name` is 'Country X'.


