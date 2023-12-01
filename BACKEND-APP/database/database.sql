    CREATE DATABASE firstapi;

    CREATE TABLE users(
        id SERIAL PRIMARY KEY,
        name varchar(40),
        email text
    );

    INSERT INTO users (name, email) values
    ('joe', 'joe@ibm.com'),
    ('ryan', 'ryan@faztweb.com'); 