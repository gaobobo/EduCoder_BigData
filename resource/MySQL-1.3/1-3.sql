DROP DATABASE IF EXISTS MyDb;
CREATE DATABASE IF NOT EXISTS MyDb;
USE MyDb;

CREATE TABLE t_user1(
    userId INT PRIMARY KEY,
    name VARCHAR(32),
    password VARCHAR(11),
    phone VARCHAR(11),
    email VARCHAR(32)
);

CREATE TABLE t_user2(
    name VARCHAR(32),
    phone VARCHAR(11),
    email VARCHAR(32),
    PRIMARY KEY (name, phone)
);