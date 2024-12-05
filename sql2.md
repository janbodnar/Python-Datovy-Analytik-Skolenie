# SQL 

## Selecting all data

```sql
SELECT * FROM countries;
```
This query retrieves all columns and rows from the `countries` table.

## Selecting Specific Columns

```sql
SELECT name, capital FROM countries;
```
This query retrieves only the `name` and `capital` columns from the `countries` table.

## Select with regex

```sql
SELECT * FROM countries WHERE name ~ 'ia$';
```


## DROP TABLE

```sql
DROP TABLE countries;
DROP TABLE IF EXISTS countries;
```

## Delete contents

```sql
DELETE FROM countries WHERE id = 1;
DELETE FROM countries;
TRUNCATE countries;
```

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

```sql
SELECT * FROM countries ORDER BY name;
SELECT * FROM countries ORDER BY name ASC;
SELECT * FROM countries ORDER BY name DESC;
SELECT * FROM countries ORDER BY continent ASC, population DESC;
```

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

## SUM/AVG functions

```sql
SELECT SUM(population) FROM countries LIMIT 3;
SELECT AVG(population) FROM countries LIMIT 10;
```

## Distinct clause 

```sql
SELECT DISTINCT(continent) FROM countries;
SELECT COUNT(DISTINCT continent) FROM countries;
```

## IN clause

```sql
SELECT * FROM countries WHERE id IN (2, 4, 6, 8, 10);
SELECT * FROM countries WHERE id NOT IN (2, 4, 6, 8, 10);
```

## AND/OR

```sql
SELECT * FROM countries WHERE (id % 2 = 0) AND (id < 20);
SELECT * FROM countries WHERE name SIMILAR TO '%ia' OR name SIMILAR TO '%an';
```


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

## Group and list countries

The `STRING_AGG` function to concatenate the country names into a single string for 
each continent, separated by a comma and a space.

```sql
SELECT continent, STRING_AGG(name, ', ') AS countries
FROM countries
GROUP BY continent
ORDER BY continent;
```

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

```sql
SELECT name, area,
    CASE
        WHEN area >= 1000000 THEN 'Very Large'
        WHEN area >= 500000 AND area < 1000000 THEN 'Large'
        WHEN area >= 100000 AND area < 500000 THEN 'Medium'
        WHEN area >= 50000 AND area < 100000 THEN 'Small'
        ELSE 'Very Small'
    END AS size_category
FROM countries;
```

This query classifies countries based on their area size.

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

## Partition by

This SQL query selects the continent, name (aliased as country), and population columns from the countries  
table. It also uses the `ROW_NUMBER` window function to assign a unique rank to each country within its respective  
continent based on population size, ordering from largest to smallest. The `PARTITION BY` clause ensures that the  
ranking is calculated separately for each continent. The final result will include each country along with its  
population and its rank within its continent based on population.  

```sql
SELECT
    continent,
    name AS country,
    population,
    ROW_NUMBER() OVER (PARTITION BY continent ORDER BY population DESC) AS population_rank
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

