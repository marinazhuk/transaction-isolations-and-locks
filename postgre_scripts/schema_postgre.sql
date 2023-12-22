CREATE TABLE users (
                       id serial PRIMARY KEY,
                       name VARCHAR (20) NOT NULL,
                       age INT NOT NULL
);

insert into users
(name, age)
VALUES
    ('Alice', 20),
    ('Bob', 25);