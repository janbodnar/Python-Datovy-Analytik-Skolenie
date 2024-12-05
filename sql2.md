# SQL 

## Selecting All Data

```sql
SELECT * FROM countries;
```
This query retrieves all columns and rows from the `countries` table.

## Selecting Specific Columns

```sql
SELECT name, capital FROM countries;
```
This query retrieves only the `name` and `capital` columns from the `countries` table.

## Filtering Data with `WHERE`

```sql
SELECT * FROM countries WHERE continent = 'Europe';
```
This query retrieves all rows where the `continent` is 'Europe'.

## Sorting Data with `ORDER BY`

```sql
SELECT * FROM countries ORDER BY population DESC;
```
This query retrieves all rows sorted by the `population` column in descending order.

## Counting Rows

```sql
SELECT COUNT(*) FROM countries WHERE continent = 'Africa';
```
This query counts the number of rows where the `continent` is 'Africa'.

## Summing Values

```sql
SELECT SUM(population) AS total_population FROM countries WHERE continent = 'Asia';
```
This query sums the `population` of all rows where the `continent` is 'Asia'.

## Grouping Data with `GROUP BY`

```sql
SELECT continent, COUNT(*) AS num_countries FROM countries GROUP BY continent;
```
This query counts the number of countries per continent.

## Using `HAVING` with `GROUP BY`

```sql
SELECT continent, COUNT(*) AS num_countries FROM countries GROUP BY continent HAVING COUNT(*) > 10;
```

This query counts the number of countries per continent and only returns  
continents with more than 10 countries.  

## Updating Data

```sql
UPDATE countries SET population = population + 100000 WHERE name = 'Germany';
```
This query increases the `population` of Germany by 100,000.

## Deleting Data

```sql
DELETE FROM countries WHERE name = 'Country X';
```
This query deletes the row where the `name` is 'Country X'.


## Using Subqueries

```sql
SELECT name, population
FROM countries
WHERE population > (SELECT AVG(population) FROM countries);
```

This query retrieves the names and populations of countries with a population
greater than the average population of all countries.


## Using `CASE` Statements

```sql
SELECT name, population,
    CASE
        WHEN population > 100000000 THEN 'Highly Populated'
        WHEN population > 50000000 THEN 'Moderately Populated'
        ELSE 'Less Populated'
    END AS population_category
FROM countries;
```

This query categorizes countries based on their population size.

## Window Functions

```sql
SELECT name, population, 
    RANK() OVER (ORDER BY population DESC) AS population_rank
FROM countries;
```

This query ranks coutries based on their population size using the `RANK`  
window function.

```sql
SELECT
    capital,
    name AS country,
    population,
    RANK() OVER (ORDER BY population DESC) AS population_rank
FROM
    countries;
```

## Aggregate Functions with Grouping

```sql
SELECT continent, MAX(population) AS max_population
FROM countries
GROUP BY continent;
```
This query finds the maximum population in each continent.

