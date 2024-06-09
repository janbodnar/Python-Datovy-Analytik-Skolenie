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
