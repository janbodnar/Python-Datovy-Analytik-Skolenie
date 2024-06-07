
DROP TABLE IF EXISTS users;
CREATE TABLE users(id serial PRIMARY KEY, first_name VARCHAR(255), 
				   last_name VARCHAR(255), occupation VARCHAR(255), dob VARCHAR(255));
				   
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('John', 'Doe', 'gardener', '1978-02-11');
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('Roger', 'Roe', 'driver', '1977-12-01');
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('Alfonz', 'Strammer', 'retired', '1937-11-11');
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('Paul', 'Smith', 'teacher', '1988-05-07');
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('Tomas', 'Dorak', 'programmer', '2002-06-19');
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('Jane', 'Smith', 'teacher', '1968-10-10');
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('Robert', 'Williams', 'driver', '2001-07-17');
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('Stefan', 'Meszaros', 'student', '2010-08-27');
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('Erik', 'Bednar', 'programmer', '2000-05-29');
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('Stanislav', 'Molnar', 'gardener', '1998-12-01');
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('Kristian', 'Kalinak', 'programmer', '1994-03-22');
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('Karol', 'Truban', 'architect', '1987-09-15');
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('Alzbeta', 'Somoray', 'student', '2007-01-08');
INSERT INTO users(first_name, last_name, occupation, dob) VALUES('Maria', 'Oravska', 'retired', '1945-06-18');
