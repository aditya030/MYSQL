
-- THIS IS HOW U CAN CREATE DELETE ALTER A DATABASE
-- CREATE DATABASE myDB;
-- USE myDB;
-- ALTER DATABASE myDB READ ONLY =0;
-- DROP DATABASE myDB;


-- NOW LETS SEE HOW TO CREATE A TABLE

-- CREATE TABLE employees(
-- employee_id INT,
-- first_name VARCHAR(50),
-- last_name VARCHAR(50),
-- hourlypay DECIMAL(5,2),
-- hire_date DATE
-- );

-- NOW LETS SEE HOW TO SELECT A TABLE
-- SELECT * FROM employees;

-- IF YOU WANT TO RENAME A TABLE
-- RENAME TABLE workers TO employees;

-- TO DROP A TABLE
-- DROP TABLE employees;

-- TO ALTER A TABLE
-- //
-- ALTER TABLE employees
-- ADD phone_number VARCHAR(15);

-- SELECT * FROM employees;

-- ALTER TABLE employees 
-- RENAME COLUMN phone_number to email;

-- SELECT * FROM employees;

-- ALTER TABLE employees 
-- MODIFY COLUMN email VARCHAR(100);
-- 


-- IF YOU WANT TO MOVE COLUMNS AROUND
-- ALTER TABLE employees 
-- MODIFY email VARCHAR(100)
-- AFTER last_name;

-- SELECT*FROM employees;



-- //
-- NOW LETS SEE HOW TO INSERT ROWS
-- ALTER TABLE employees
-- DROP COLUMN email;

-- INSERT INTO employees
-- VALUES(1,"aditya","sinha",25.50,"2023-10-01"),(2,"abhinav","sinha",20.50,"2023-10-02"),(3,"dipti","sinha",40.10,"2023-10-10");
-- SELECT * FROM employees; 

-- // IF YOU JUST WANT TO INSERT IN SPECIFIC COLUMNS U CAN JUST MENTION THE COLUMN NAMES IN INSERT LINE (AND WHATEVER COLUMN)


-- //SELECT QUERY

-- SELECT first_name,last_name
-- FROM employees;

-- // WHERE CLAUSE
-- SELECT *
-- FROM employees
-- WHERE employee_id=1;

-- UPDATE AND DELETE DATA FROM A TABLE
-- UPDATE employees
-- SET hourlypay = 10.24;
-- SELECT * FROM employees;
-- INSERT INTO employees (employee_id,first_name,last_name)
-- VALUES(5,"rahul","sinha");
-- SELECT * FROM employees


-- // AUTOCOMMIT,COMMIT,ROLLBACK

-- SET AUTOCOMMIT = OFF;
-- COMMIT
-- DELETE FROM employees;
-- SELECT * FROM employees;
-- ROLLBACK
-- THIS WILL ALLOW TO GET THE DATA BACK IF BY MISTAKE WE DELETE IT 




-- CREATE TABLE test(

-- my_date DATE,
-- my_time time,
-- mydatetime DATETIME
-- );


-- INSERT INTO test
-- VALUES(CURRENT_DATE(),CURRENT_TIME(),NOW());
-- SELECT * FROM test;

-- DROP TABLE test;

-- UNIQUE

-- CREATE TABLE products (
-- product_id INT,
-- product_name VARCHAR(25) UNIQUE,
-- price DECIMAL(4,2)
-- );

-- ALTER TABLE products
-- ADD constraint
-- UNIQUE(product_name);



-- NOT NULL
-- CREATE TABLE proucts(
-- products_id INT,
-- product_name NOT NULL
-- );
-- ALTER TABLE products
-- MODIFY price DECIMAL (4,2) NOT NULL;



-- CHECK CONSTRAINT
-- ALTER TABLE employees
-- ADD CONSTRAINT ck CHECK (hourlypay >= 27);
--   SELECT * FROM employees;
 
 
--  DEFAULT CONSTRAINT -> CAN BE USED TO SPECIFY THE DEFAULT PRICE IF NOT GIVEN BY USER OR ENTERED BY USER 
-- CREATE TABLE products(
-- product_id INT,
-- product_name VARCHAR(25),
-- price DECIMAL(4,2) DEFAULT 0
-- );


-- PRIMARY KEY -> IT MUST BE UNIQUE AND NOT NULL

-- CREATE TABLE transactions(
-- transaction_id INT PRIMARY KEY,
-- amount DECIMAL(5,2)
-- );

-- SELECT  * FROM transactions

-- ALTER TABLE transactions
-- ADD CONSTRAINT
-- PRIMARY KEY(amount);


-- AUTO INCREMENT

-- DROP TABLE transactions;
-- CREATE TABLE transactions (
-- transaction_id INT PRIMARY KEY AUTO_INCREMENT,
-- amount DECIMAL(5,2)
-- );

-- INSERT INTO transactions (amount)
-- VALUES(2.89);
-- SELECT * FROM transactions;


-- FOREIGN KEY CONSTRAINT -> IT CAN BE A TYPE OF PRIMARY THAT CAN BE FOUND IN OTHER TABLE TO ESTABLISH LINK BW 2 TABLE

-- CREATE TABLE customers (
-- customer_id INT PRIMARY KEY AUTO_INCREMENT,
-- first_name VARCHAR(25),
-- last_name VARCHAR(25)

-- );

-- INSERT INTO customers (first_name,last_name)
-- VALUES ("aditya","sinha"),
--        ("aditi","sinha"),
--        ("adit","sinha");

-- DROP TABLE transactions;

-- CREATE TABLE transactions(
--    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
--    amount decimal(5,2),
--    customer_id INT,
--    foreign key(customer_id) references customers(customer_id)
--    );
--    

-- SELECT * FROM transactions;

--  A JOIN IS A CLAUSE USED TO COMBINE 2 OR MORE ROWS SUCH AS FOREIGN KEY
-- // FOR INNER JOIN
-- SELECT * 
-- FROM transaction INNER JOIN customers
-- ON transaction.customer_id = customers.customer_id;

-- SELECT  transaction_id , amount,first_name,last_name
-- FROM transaction INNER JOIN customers
-- ON transaction.customer_id = customers.customer_id;


-- // IF YOU WANT TO SEE ALL COLUMNS  AND ROWS FROM THE LEFT TABLE THEN USE LEFT JOIN 
-- SAME GOES AND VICE VERSA WITH RIGHT JOIN

-- FUNCTIONS
-- SELECT COUNT(amount) AS "count_adi"
-- FROM transactions;
-- SELECT MAX(amount) AS "count_adi"
-- FROM transactions;
-- SELECT CONCAT(first_name,last_name) AS full_name
-- FROM employees;


-- LOGICAL OPERATORS
-- SELECT *
-- FROM employees 
-- WHERE hire_date <"2023-10-01"  AND job ="cook";
-- WHERE job ="cook" OR job ="cashier";


-- // wild card character ->use dto subsitute one or more characters in a string;
-- SELECT * FROM employees
-- WHERE first_name LIKE "_a%";  // where _ denotes that any random characters beforr it and % remonds for specific char.


-- ORDER BY. USED FOR SHOWING CBARACTER INS ASCENDING ORDER BY THE SPECIFIC PROPERT THAT U WANT 

-- SELECT * FROM employees
-- ORDER BY last_name. DESC;


-- LIMIT CLAUSE is used to limit the number of records
-- usefull if u are working with lot of data
-- can be used to display a large data on pages (paginations)

-- SELECT * FROM customers
--  ORDER BY LAST_NAME DESC LIMIT 1;

-- UNION combines the results of two or more select statements;
-- SELECT * FROM income
-- UNION
-- SELECT * FROM expenses;

-- SELF JOIN ->  join another copy of a table to itself
-- used to ompare rows of same table
-- helps to display a hierechial of data

-- ALTER TABLE customers
-- ADD refeeral_id INT;


-- UPDATE CUSTMOERS
-- SET referral_id = 1
-- WHERE customer_id =2;

-- SELECT *
-- FROM cutomers AS a 
-- INNER JOIN customers AS b
-- ON a.referral_id = b.customer_id;


-- Views -> a virtual table based on the result set of an sql statement
-- the fields in a view are field from one or more real table in the database
-- they are not real table but can be interacted with as if they are

-- SELECT * FROM employees;
-- CREATE VIEW employee_attendance AS 
-- SELECT first_name,last_name
-- FROM employees;

-- indexes -> BTREE data structure
-- indexes are used to find values within a specifi column more quickely
-- my sql normally searches sequentially through a column  
-- the longer the column , the more expensive the operation is
-- update takes more time , sleect take less time

-- SHOW INDEXES FROM customers;
-- CREATE INDEX last_name_idx
-- ON customers(last_name);
-- SHOW INDEXES FROM CUSTOMERS;



-- //subquery
-- a query within aother query
-- query(subquery)

-- SELECT first_name,last_name,hourly_pay,
--         (SELECT AVG(hourly_pay) FROM employees) AS avg_pay
-- FROM employees;


-- SELECT first_name,last_name,hourly_pay
-- FROM employees
-- WHERE hourly_pay>(SELECT AVG(horly_pay) FROM employees);


-- GROUP BY -> aggregate all rows by a specific column often used with aggregate function 
-- ex-> SUM,MAX,MIN,AVG,COUNT
-- SELECT SUM(amount),order_date
-- FROM transactions
-- GROUP BY order_date;


-- ROLLUP , extension of the group by clause
-- produces another row and shows the grand total(super-aggregate value)

-- SELECT SUM(amount),order_date
-- FROM transactions
-- GROUP BY order_date WITH ROLLUP;

-- ON DELETE SET NULL = when a FK is deleted,replaced FK with null
-- ON delete cascade = when a  fk is deleted, delete row

-- SET foreign_key_checks = 0
-- DELETE FROM customers
-- WHERE customer_id =4;
-- SELECT* FROM customers;

-- ALTER TABLE transactions
-- ADD CONSTRAINT fk_customer_id
-- FOREIGN KEY(customer_id) REFFERENCES customers(customer_id)
-- ON DELETE SET NULL;

-- ALTER TABLE transactions
-- ADD CONSTRAINT fk_customer_id
-- FOREIGN KEY(customer_id) REFFERENCES customers(customer_id)
-- ON DELETE CASCADE;


-- STORED PROCEDURES = is perpared SQL code that you can save great if there is a query that u write often

-- SELECT DISTINCT first_name,last_name
-- FROM transactions
-- INNER JOIN customers
-- ON transactions.customer_id = customers.customer_id;

-- DELIMITER //
-- CREATE PROCEDURE get_customers()
-- BEGIN
--      SELECT * FROM customers;
-- END//
-- DELIMITER;


-- CALL get_customers();
-- DROP PROCEDURES get_customers


-- DELIMITER //
-- CREATE PROCEDURE find_customers(IN id INT)
-- BEGIN
--      SELECT*
--      FROM customers
--      WHERE customer_id = id;
-- END //
-- DELIMITER;


-- trigger -> when an event happens, do something 
-- ex=>(INSERT,UPDATE,DELETE)
-- checks data,handle error,auditing table

SELECT * from employees
ALTER TABLE employees
ADD column salary decimal(10,2) after hourly_pay;
SELECT * FROM employees;

UPDATE employees
SET salary = hourly_pay * 2080;
SELECT * FROM employees;

CREATE TRIGGER before_hourly_pay
BEFORE UPDATE ON employees
FOR EACH ROW
SET NEW.salary = (NEW.hourly_pay*2080);

SHOW TRIGGERS;

UPDATE employees
SET horuly_pay =50;
WHERE employee_id =1;
SELECT * FROM employees;






























































