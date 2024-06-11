# Relations

In SQL, relations refer to the associations or connections between tables in a relational database. These relationships  
are established using foreign keys, which are columns in a table that refer to the primary key in another table. They   
help organize and structure data, allowing for efficient data retrieval and maintaining data integrity.

Common types of relations in SQL:

1. **One-to-One**: Each record in Table A is associated with one and only one record in Table B, and vice versa.  
   For example, a user table and a user profile table, where each user has a single corresponding profile.  
3. **One-to-Many**: Each record in Table A can be associated with multiple records in Table B, but each record in Table B  
   is associated with only one record in Table A¹. For example, a departments table and an employees table, where each  
   department can have multiple employees, but each employee belongs to one department.  
5. **Many-to-Many**: Each record in Table A can be associated with multiple records in Table B, and vice versa¹. This is  
   typically implemented with an intermediate table. For example, a students table and a courses table, where each student  
   can enroll in multiple courses, and each course can have multiple students.  
8. **Self-Referencing**: This occurs when only one table is involved, and a foreign key in the table references the  
   primary key of the same table.
10. **Many-to-One**: This is a special case of a one-to-many relationship, where each record in Table B can be associated  
    with one record in Table A. For example, an employees table and a departments table, where each employee belongs to  
    one department, but a department can have many employees.

## database normalization

**Database Normalization** is a process in database design to organize data to reduce redundancy and improve data integrity.  
It involves dividing a database into two or more tables and defining relationships between the tables to achieve a well-structured   
design. The main aim of normalization is to add, delete, or modify data without causing data anomalies. It's a systematic  
approach of decomposing tables to eliminate data redundancy and undesirable characteristics like insertion, update and delete  
anomalies. It's also a way of ensuring that the data within a relational database is organized properly.  

## one-to-one

```SQL
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO users(name) VALUES 
('John Doe'), ('Jane Doe'), 
('Roger Roe'), ('Paul Novak'),
('Lucia Williams'), ('Peter Novotny'),
('Samuel Green'), ('Saul Peterson');

CREATE TABLE user_profiles (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    bio VARCHAR(255)
);

INSERT INTO user_profiles(user_id, bio) VALUES 
(1, 'Bio for John Doe'), 
(2, 'Bio for Jane Doe'),
(3, 'Bio for Roger Roe'),
(4, 'Bio for Paul Novak'),
(5, 'Bio for Lucia Williams'),
(6, 'Bio for Peter Novotny'),
(7, 'Bio for Samuel Green'),
(8, 'Bio for Saul Peterson');
```

```SQL
SELECT users.name, user_profiles.bio
FROM users
JOIN user_profiles ON users.id = user_profiles.user_id;
```



## one-to-many

```SQL
-- Create customers table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);

-- Create reservations table
CREATE TABLE reservations (
    id SERIAL PRIMARY KEY,
    reservation_date DATE NOT NULL,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Insert customers
INSERT INTO customers (name, email) VALUES 
('John Doe', 'john.doe@example.com'),
('Roger Roe', 'roger.roe@example.com'),
('Paul Novak', 'paul.novak@example.com'),
('Lucia Williams', 'lucia.williams@example.com'),
('Peter Novotny', 'peter.novotny@example.com'),
('Samuel Green', 'samuel.green@example.com'),
('Saul Peterson', 'saul.peterson@example.com'),
('Walter Smith', 'walter.smith@example.com'),
('Paul Smith', 'paul.smith@example.com'),
('Martin Meszaros', 'martin.meszaros@example.com');

-- Insert reservations
INSERT INTO reservations (reservation_date, customer_id) VALUES 
('2020-01-01', 1),
('2020-01-08', 1),
('2020-03-11', 2),
('2020-05-21', 3),
('2020-06-28', 4),
('2020-07-07', 4),
('2020-10-18', 5),
('2021-02-02', 1),
('2021-03-13', 4),
('2021-06-14', 4),
('2021-07-15', 5),
('2021-11-11', 6),
('2022-02-07', 7),
('2022-07-08', 7),
('2022-08-09', 8),
('2022-09-10', 1),
('2022-09-19', 1),
('2022-11-10', 2),
('2023-01-10', 6),
('2023-02-10', 9),
('2023-06-16', 9),
('2023-06-22', 3),
('2023-10-10', 3),
('2024-03-11', 2),
('2024-04-10', 3),
('2024-06-07', 2);
```

```SQL
SELECT reservation_date, name, email
FROM reservations 
JOIN customers 
ON reservations.customer_id = customers.id;
```


## many-to-many

```SQL
DROP TABLE IF EXISTS author_book CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS authors CASCADE;

-- Create authors table
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create books table
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

-- Create junction table author_book
CREATE TABLE author_book (
    author_id INT REFERENCES authors(author_id),
    book_id INT REFERENCES books(book_id),
    PRIMARY KEY (author_id, book_id)
);

-- Insert data into authors
INSERT INTO authors (name) VALUES ('Author 1'), ('Author 2'), ('Author 3');

-- Insert data into books
INSERT INTO books (title) VALUES ('Book 1'), ('Book 2'), ('Book 3');

-- Insert data into author_book
INSERT INTO author_book (author_id, book_id) VALUES (1, 1), (1, 2), (2, 2), (2, 3), (3, 3);
```


```SQL
SELECT authors.name, books.title
FROM authors
JOIN author_book ON authors.author_id = author_book.author_id
JOIN books ON author_book.book_id = books.book_id;
```

```SQL
SELECT b.title, COUNT(ab.author_id) AS num_authors
FROM books b
JOIN author_book ab ON b.book_id = ab.book_id
GROUP BY b.title
HAVING COUNT(ab.author_id) > 1;
```
