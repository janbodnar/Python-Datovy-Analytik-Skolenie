BEGIN;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL
);
INSERT INTO customers(name) VALUES('John Doe');
INSERT INTO customers(name) VALUES('Jane Smith');
INSERT INTO customers(name) VALUES('Robert Johnson');
INSERT INTO customers(name) VALUES('Julia Davis');

CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY, 
    product TEXT NOT NULL, 
    customer_id INTEGER REFERENCES customers(customer_id)
);
INSERT INTO orders(product, customer_id) VALUES('Book: Emma',1);
INSERT INTO orders(product, customer_id) VALUES('Book: War and Peace',2);
INSERT INTO orders(product, customer_id) VALUES('Book: Catch XII',3);
INSERT INTO orders(product, customer_id) VALUES('Book: David Copperfield',4);
INSERT INTO orders(product, customer_id) VALUES('Book: Good as Gold',1);
INSERT INTO orders(product, customer_id) VALUES('Book: Anna Karenia',2);
COMMIT;
