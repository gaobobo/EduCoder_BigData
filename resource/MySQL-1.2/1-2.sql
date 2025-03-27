DROP DATABASE IF EXISTS TestDb;
CREATE DATABASE IF NOT EXISTS TestDb;
USE TestDb;

CREATE TABLE t_emp (
    id INT,
    name VARCHAR(32),
    deptId INT,
    salary FLOAT
);