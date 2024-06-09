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


SELECT users.name, user_profiles.bio
FROM users
JOIN user_profiles ON users.id = user_profiles.user_id;
