DROP DATABASE IF EXISTS craigs_list_db;

CREATE DATABASE craigs_list_db;

\c craigs_list_db;
-- Connect to database

CREATE TABLE categories(
id SERIAL PRIMARY KEY,
cat_name TEXT NOT NULL
);

CREATE TABLE regions(
id SERIAL PRIMARY KEY,
region_name TEXT NOT NULL
);

CREATE TABLE users(
id SERIAL PRIMARY KEY,
username TEXT NOT NULL UNIQUE,
user_password VARCHAR(10) TEXT NOT NULL 
-- preferred_region_id
);

CREATE TABLE posts(
id SERIAL PRIMARY KEY,
title VARCHAR (20) NOT NULL,
post_text TEXT NOT NULL,
user_id INTEGER REFERENCES users,
user_location TEXT NOT NULL,
region_id INTEGER REFERENCES regions,
category_id INTEGER REFERENCES categories
);

INSERT INTO categories (cat_name)
VALUES
('Rentals'),
('For Sale'),
('Looking For'),
('Jobs');

INSERT INTO users (username, user_password)
('username','password'),
('lniehaus','ffii12f'),
('trinto','opendoor'),
('egscellent','Trigger0710');

INSERT INTO post (title, text)
('Looking for my dog','Has anyone seen my dog?'),
('Beatufiul 5 bedroomed house', 'Come check out our stunning house for rent'),
('Waitress position available','part time and your local coffee shop');
