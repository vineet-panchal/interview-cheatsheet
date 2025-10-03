# Additional SQL Topics

---

## 1. Indexes

Indexes improve the speed of data retrieval operations on a database table at the cost of additional space and slower writes.

### a. Creating an Index

```sql
CREATE INDEX idx_lastname ON employees(last_name);
```
*Creates an index on the `last_name` column of the `employees` table.*

### b. Unique Index

```sql
CREATE UNIQUE INDEX idx_email ON employees(email);
```
*Ensures all emails are unique.*

### c. Dropping an Index

```sql
DROP INDEX idx_lastname;
```
*Removes the index.*

---

## 2. Views

A **view** is a virtual table based on the result of a SQL query.

### a. Creating a View

```sql
CREATE VIEW high_earners AS
SELECT first_name, last_name, salary
FROM employees
WHERE salary > 70000;
```
*Creates a view of employees earning more than 70,000.*

### b. Querying a View

```sql
SELECT * FROM high_earners;
```

### c. Dropping a View

```sql
DROP VIEW high_earners;
```

---

## 3. Stored Procedures

A **stored procedure** is a set of SQL statements that can be executed as a program.

### a. Creating a Stored Procedure

```sql
CREATE PROCEDURE GiveRaise (IN emp_id INT, IN percent DECIMAL(3,2))
BEGIN
  UPDATE employees
  SET salary = salary * (1 + percent/100)
  WHERE id = emp_id;
END;
```

### b. Executing a Stored Procedure

```sql
CALL GiveRaise(2, 10);
```
*Gives a 10% raise to employee with id 2.*

---

## 4. Triggers

A **trigger** is a procedure that is automatically executed in response to certain events on a table.

### a. Creating a Trigger

```sql
CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
SET NEW.hire_date = NOW();
```
*Automatically sets the hire date to the current date when a new employee is added.*

### b. Dropping a Trigger

```sql
DROP TRIGGER before_employee_insert;
```

---

## 5. Transactions

A **transaction** is a sequence of SQL statements that are executed as a single unit.

### a. Basic Transaction

```sql
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
```
*Transfers 100 from account 1 to account 2.*

### b. Rollback

```sql
BEGIN;
UPDATE employees SET salary = 0;
ROLLBACK;
```
*Undoes the salary update.*

---

## 6. Constraints

Constraints enforce rules at the table level.

### a. NOT NULL

```sql
CREATE TABLE employees (
  id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL
);
```

### b. UNIQUE

```sql
ALTER TABLE employees ADD CONSTRAINT unique_email UNIQUE (email);
```

### c. CHECK

```sql
ALTER TABLE employees ADD CONSTRAINT check_salary CHECK (salary > 0);
```

### d. DEFAULT

```sql
ALTER TABLE employees ALTER COLUMN hire_date SET DEFAULT CURRENT_DATE;
```

---

## 7. User Management and Security

### a. Creating a User

```sql
CREATE USER 'user1' IDENTIFIED BY 'password123';
```

### b. Granting Privileges

```sql
GRANT SELECT, INSERT ON employees TO 'user1';
```

### c. Revoking Privileges

```sql
REVOKE INSERT ON employees FROM 'user1';
```

### d. Dropping a User

```sql
DROP USER 'user1';
```

---

## 8. Data Types

SQL supports various data types:

- **Numeric:** INT, DECIMAL, FLOAT
- **String:** CHAR, VARCHAR, TEXT
- **Date/Time:** DATE, TIME, TIMESTAMP
- **Boolean:** BOOLEAN (or TINYINT in some databases)

**Example:**

```sql
CREATE TABLE products (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(10,2),
  available BOOLEAN,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 9. Importing and Exporting Data

### a. Importing Data

```sql
LOAD DATA INFILE '/path/to/file.csv'
INTO TABLE employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

### b. Exporting Data

```sql
SELECT * FROM employees
INTO OUTFILE '/path/to/output.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
```

---

## 10. Common Functions

### a. String Functions

```sql
SELECT UPPER(first_name), LOWER(last_name), LENGTH(first_name) FROM employees;
```

### b. Date Functions

```sql
SELECT hire_date, YEAR(hire_date), MONTH(hire_date), DAY(hire_date) FROM employees;
```

### c. Mathematical Functions

```sql
SELECT ABS(salary - 60000), ROUND(salary/1000, 2) FROM employees;
```

---

## 11. Pagination

Retrieve a subset of rows for paging through results.

```sql
SELECT * FROM employees
ORDER BY id
LIMIT 10 OFFSET 20;
```
*Returns 10 rows starting from the 21st row.*

---

## 12. Temporary Tables

Temporary tables exist only during the session.

```sql
CREATE TEMPORARY TABLE temp_employees AS
SELECT * FROM employees WHERE salary > 60000;
```

---

## 13. JSON and XML Data

Some databases support JSON and XML columns.

### a. JSON Example

```sql
CREATE TABLE orders (
  id INT PRIMARY KEY,
  details JSON
);

INSERT INTO orders (id, details)
VALUES (1, '{"product": "Laptop", "quantity": 2}');
```

### b. Querying JSON

```sql
SELECT details->>'$.product' AS product FROM orders;
```

---

## 14. Full-Text Search

Some databases support full-text indexes for searching text columns.

```sql
CREATE FULLTEXT INDEX idx_fulltext ON employees(last_name);

SELECT * FROM employees
WHERE MATCH(last_name) AGAINST('Smith');
```

---

## 15. Common Table Expressions (CTEs)

A CTE is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.

```sql
WITH high_salary AS (
  SELECT * FROM employees WHERE salary > 70000
)
SELECT first_name, salary FROM high_salary;
```

---

## 16. Window Functions

Window functions perform calculations across a set of table rows related to the current row.

```sql
SELECT first_name, salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;
```
*Ranks employees by salary.*

---

## 17. Error Handling (TRY...CATCH in some DBs)

Some databases support error handling in procedures.

```sql
BEGIN TRY
  -- SQL statements
END TRY
BEGIN CATCH
  -- Error handling
END CATCH
```

---

## 18. Metadata Queries

Query information about tables, columns, and indexes.

```sql
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public';
```

---

## 19. Partitioning

Partitioning splits large tables into smaller, more manageable pieces.

```sql
CREATE TABLE sales (
  id INT,
  sale_date DATE
) PARTITION BY RANGE (YEAR(sale_date)) (
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024)
);
```

---

## 20. Summary

- Advanced SQL topics include indexes, views, stored procedures, triggers, transactions, constraints, user management, data types, importing/exporting, functions, pagination, temporary tables, JSON/XML, full-text search, CTEs, window functions, error handling, metadata, and partitioning.
- Mastery of these features enables efficient, secure, and powerful database solutions.

---