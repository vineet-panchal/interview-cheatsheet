# Writing SQL Queries: Detailed Notes with Examples

## 1. Introduction to SQL Queries

SQL queries are instructions written in SQL to interact with relational databases. They allow users to retrieve, insert, update, and delete data, as well as define and control access to database structures.

---

## 2. Structure of an SQL Query

A basic SQL query follows this structure:

```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition
GROUP BY column
HAVING condition
ORDER BY column [ASC|DESC]
LIMIT number;
```

---

## 3. SELECT Queries

### a. Selecting All Columns

```sql
SELECT * FROM employees;
```
*Returns all columns and rows from the `employees` table.*

### b. Selecting Specific Columns

```sql
SELECT first_name, last_name FROM employees;
```
*Returns only the `first_name` and `last_name` columns.*

### c. Using Aliases

```sql
SELECT first_name AS fname, last_name AS lname FROM employees;
```
*Renames columns in the result set for readability.*

---

## 4. Filtering Data with WHERE

### a. Using Comparison Operators

```sql
SELECT * FROM employees WHERE salary > 50000;
```
*Returns employees with salary greater than 50,000.*

### b. Using Logical Operators

```sql
SELECT * FROM employees WHERE department = 'IT' AND salary >= 60000;
```
*Returns IT employees with salary at least 60,000.*

### c. Pattern Matching with LIKE

```sql
SELECT * FROM employees WHERE first_name LIKE 'A%';
```
*Returns employees whose first name starts with 'A'.*

### d. Using IN

```sql
SELECT * FROM employees WHERE department IN ('IT', 'Sales');
```
*Returns employees in either IT or Sales department.*

### e. Using BETWEEN

```sql
SELECT * FROM employees WHERE hire_date BETWEEN '2022-01-01' AND '2023-01-01';
```
*Returns employees hired in 2022.*

### f. Checking for NULL

```sql
SELECT * FROM employees WHERE manager_id IS NULL;
```
*Returns employees who do not have a manager.*

---

## 5. Sorting Results with ORDER BY

```sql
SELECT * FROM employees ORDER BY salary DESC, first_name ASC;
```
*Sorts employees by salary (highest first), then by first name.*

---

## 6. Limiting Results with LIMIT

```sql
SELECT * FROM employees LIMIT 5;
```
*Returns only the first 5 rows.*

---

## 7. Aggregating Data

### a. Using Aggregate Functions

```sql
SELECT COUNT(*) AS total_employees FROM employees;
```
*Counts the total number of employees.*

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
```
*Shows average salary per department.*

### b. Filtering Groups with HAVING

```sql
SELECT department, COUNT(*) AS num_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 10;
```
*Shows departments with more than 10 employees.*

---

## 8. Joining Tables

### a. INNER JOIN

```sql
SELECT e.first_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;
```
*Returns employees with their department names.*

### b. LEFT JOIN

```sql
SELECT e.first_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;
```
*Returns all employees, including those without a department.*

---

## 9. Subqueries

```sql
SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```
*Returns employees earning above the average salary.*

---

## 10. Modifying Data

### a. Inserting Data

```sql
INSERT INTO employees (first_name, last_name, department, salary)
VALUES ('John', 'Doe', 'IT', 60000);
```
*Adds a new employee.*

### b. Updating Data

```sql
UPDATE employees
SET salary = salary * 1.1
WHERE department = 'Sales';
```
*Increases salary by 10% for Sales employees.*

### c. Deleting Data

```sql
DELETE FROM employees
WHERE last_name = 'Doe';
```
*Removes employees with last name 'Doe'.*

---

## 11. Best Practices

- Always use `WHERE` with `UPDATE` and `DELETE` to avoid affecting all rows.
- Use aliases for readability.
- Format queries for clarity (indentation, capitalization).
- Use parameterized queries in applications to prevent SQL injection.

---

## 12. Summary

- SQL queries are essential for interacting with relational databases.
- Mastering SELECT, filtering, sorting, joining, and modifying data is crucial.
- Practice writing queries to become proficient in SQL.

---