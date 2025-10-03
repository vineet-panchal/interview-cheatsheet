# Adding, Updating, and Deleting Data in SQL

---

## 1. Introduction

Manipulating data is a core part of working with SQL databases. The main operations are:
- **INSERT**: Add new rows to a table.
- **UPDATE**: Modify existing rows.
- **DELETE**: Remove rows from a table.

These operations are known as Data Manipulation Language (DML) commands.

---

## 2. Example Tables

We'll use the following tables for examples:

### `employees`

| id | first_name | last_name | department_id | salary | hire_date   |
|----|------------|-----------|--------------|--------|-------------|
| 1  | Alice      | Smith     | 1            | 70000  | 2021-03-15  |
| 2  | Bob        | Johnson   | 2            | 55000  | 2022-06-01  |
| 3  | Carol      | Williams  | 1            | 90000  | 2019-11-20  |
| 4  | David      | Brown     | 3            | 60000  | 2023-01-10  |
| 5  | Eve        | Davis     | 2            | 50000  | 2020-07-23  |

### `departments`

| id | department_name |
|----|----------------|
| 1  | IT             |
| 2  | Sales          |
| 3  | HR             |

---

## 3. Adding Data: INSERT

### a. Insert a Single Row

```sql
INSERT INTO employees (id, first_name, last_name, department_id, salary, hire_date)
VALUES (6, 'Frank', 'Miller', 1, 80000, '2023-05-01');
```
*Adds a new employee named Frank Miller.*

### b. Insert Multiple Rows

```sql
INSERT INTO departments (id, department_name)
VALUES (4, 'Marketing'), (5, 'Finance');
```
*Adds two new departments.*

### c. Insert Data into Specific Columns

```sql
INSERT INTO employees (first_name, last_name)
VALUES ('Grace', 'Lee');
```
*Other columns will use default values or NULL if allowed.*

### d. Insert Data from Another Table

```sql
INSERT INTO employees (first_name, last_name, department_id, salary, hire_date)
SELECT first_name, last_name, department_id, salary, hire_date
FROM temp_employees;
```
*Copies data from `temp_employees` to `employees`.*

### e. Insert with Subquery

```sql
INSERT INTO employees (first_name, last_name, department_id, salary, hire_date)
SELECT 'Helen', 'Moore', id, 65000, '2023-06-01'
FROM departments
WHERE department_name = 'Finance';
```
*Adds Helen Moore to the Finance department.*

---

## 4. Updating Data: UPDATE

### a. Update a Single Row

```sql
UPDATE employees
SET salary = 75000
WHERE id = 2;
```
*Sets Bob's salary to 75,000.*

### b. Update Multiple Rows

```sql
UPDATE employees
SET salary = salary * 1.10
WHERE department_id = 2;
```
*Gives a 10% raise to all employees in Sales.*

### c. Update All Rows

```sql
UPDATE employees
SET hire_date = '2023-01-01';
```
*Sets the hire date for all employees (use with caution!).*

### d. Update with Subquery

```sql
UPDATE employees
SET department_id = (
  SELECT id FROM departments WHERE department_name = 'HR'
)
WHERE last_name = 'Davis';
```
*Moves Eve Davis to the HR department.*

### e. Update Multiple Columns

```sql
UPDATE employees
SET salary = salary + 5000, hire_date = '2023-07-01'
WHERE department_id = 1;
```
*Increases salary and updates hire date for IT employees.*

### f. Conditional Update

```sql
UPDATE employees
SET salary = CASE
  WHEN salary < 60000 THEN salary + 3000
  ELSE salary + 1000
END;
```
*Gives a bigger raise to lower-paid employees.*

---

## 5. Deleting Data: DELETE

### a. Delete a Single Row

```sql
DELETE FROM employees
WHERE id = 4;
```
*Removes David Brown from the table.*

### b. Delete Multiple Rows

```sql
DELETE FROM employees
WHERE department_id = 2;
```
*Removes all employees in Sales.*

### c. Delete All Rows

```sql
DELETE FROM employees;
```
*Removes all employees (table remains, but is empty).*

### d. Delete with Subquery

```sql
DELETE FROM employees
WHERE department_id IN (
  SELECT id FROM departments WHERE department_name = 'Marketing'
);
```
*Deletes employees in the Marketing department.*

### e. Delete Duplicate Rows (Advanced)

Suppose you want to remove duplicate employees based on first and last name:

```sql
DELETE FROM employees
WHERE id NOT IN (
  SELECT MIN(id)
  FROM employees
  GROUP BY first_name, last_name
);
```
*Keeps only the first occurrence of each name.*

---

## 6. TRUNCATE: Remove All Rows Quickly

```sql
TRUNCATE TABLE employees;
```
*Removes all rows from the table, often faster than DELETE. Cannot be rolled back in some databases.*

---

## 7. INSERT, UPDATE, DELETE with RETURNING (Some Databases)

Some databases (like PostgreSQL) support `RETURNING` to get affected rows:

```sql
UPDATE employees
SET salary = salary * 1.05
WHERE department_id = 1
RETURNING id, first_name, salary;
```
*Shows updated employees and their new salaries.*

---

## 8. Transactions and Data Integrity

- Use transactions to group multiple DML statements.
- Transactions ensure **ACID** properties (Atomicity, Consistency, Isolation, Durability).

```sql
BEGIN;
UPDATE employees SET salary = salary - 1000 WHERE id = 1;
UPDATE employees SET salary = salary + 1000 WHERE id = 2;
COMMIT;
```
*Transfers salary from Alice to Bob as a single transaction.*

---

## 9. Best Practices

- Always use `WHERE` with UPDATE and DELETE to avoid affecting all rows.
- Use transactions for related changes.
- Validate data before inserting or updating.
- Use constraints (e.g., NOT NULL, UNIQUE) to enforce data integrity.
- Backup data before performing bulk updates or deletes.

---

## 10. Summary Table

| Operation | Command | Example Syntax |
|-----------|---------|---------------|
| Add       | INSERT  | `INSERT INTO ... VALUES ...` |
| Update    | UPDATE  | `UPDATE ... SET ... WHERE ...` |
| Delete    | DELETE  | `DELETE FROM ... WHERE ...` |
| Remove All| TRUNCATE| `TRUNCATE TABLE ...` |

---

## 11. Conclusion

Adding, updating, and deleting data are fundamental SQL operations. Mastering these commands, along with careful use of transactions and conditions, is essential for safe and effective database management.

---