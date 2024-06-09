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
