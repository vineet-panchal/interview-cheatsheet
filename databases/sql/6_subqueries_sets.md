# Subqueries and Set Operations in SQL

---

## 1. Introduction

Subqueries and set operations are advanced SQL features that allow you to write powerful and flexible queries. Subqueries let you nest one query inside another, while set operations combine results from multiple queries.

---

## 2. Subqueries

A **subquery** (or inner query) is a query nested inside another SQL query. Subqueries can be used in SELECT, INSERT, UPDATE, or DELETE statements and can return single or multiple values.

### a. Types of Subqueries

- **Scalar Subquery:** Returns a single value.
- **Row Subquery:** Returns a single row.
- **Column Subquery:** Returns a single column (multiple rows).
- **Table Subquery:** Returns a table (multiple rows and columns).
- **Correlated Subquery:** References columns from the outer query.

---

### b. Subquery in SELECT Clause

```sql
SELECT first_name,
       (SELECT department_name FROM departments WHERE id = e.department_id) AS department
FROM employees e;
```
*Shows each employee with their department name.*

---

### c. Subquery in WHERE Clause

```sql
SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```
*Finds employees earning above the average salary.*

---

### d. Subquery with IN

```sql
SELECT first_name
FROM employees
WHERE department_id IN (SELECT id FROM departments WHERE department_name = 'Sales');
```
*Finds employees in the Sales department.*

---

### e. Subquery with EXISTS

```sql
SELECT department_name
FROM departments d
WHERE EXISTS (
  SELECT 1 FROM employees e WHERE e.department_id = d.id
);
```
*Lists departments that have at least one employee.*

---

### f. Correlated Subquery

A **correlated subquery** references columns from the outer query and is evaluated once per row.

```sql
SELECT first_name, salary
FROM employees e1
WHERE salary > (
  SELECT AVG(salary)
  FROM employees e2
  WHERE e2.department_id = e1.department_id
);
```
*Finds employees earning above the average salary in their department.*

---

### g. Subquery in FROM Clause (Derived Table)

```sql
SELECT department_id, avg_salary
FROM (
  SELECT department_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department_id
) AS dept_avgs
WHERE avg_salary > 60000;
```
*Shows departments with average salary above 60,000.*

---

### h. Subquery in UPDATE

```sql
UPDATE employees
SET salary = salary * 1.05
WHERE department_id = (SELECT id FROM departments WHERE department_name = 'IT');
```
*Gives a 5% raise to IT employees.*

---

### i. Subquery in DELETE

```sql
DELETE FROM employees
WHERE department_id IN (SELECT id FROM departments WHERE department_name = 'Marketing');
```
*Deletes employees in the Marketing department.*

---

## 3. Set Operations

Set operations combine the results of two or more SELECT queries. The main set operators are:

- **UNION**
- **UNION ALL**
- **INTERSECT**
- **EXCEPT** (or **MINUS** in some databases)

**Note:** All queries combined with set operators must have the same number and order of columns, and compatible data types.

---

### a. UNION

Combines results from two queries, removing duplicates.

```sql
SELECT first_name FROM employees WHERE department_id = 1
UNION
SELECT first_name FROM employees WHERE department_id = 2;
```
*Lists unique employee names from departments 1 and 2.*

---

### b. UNION ALL

Combines results from two queries, including duplicates.

```sql
SELECT first_name FROM employees WHERE department_id = 1
UNION ALL
SELECT first_name FROM employees WHERE department_id = 2;
```
*Lists all employee names from departments 1 and 2, including duplicates.*

---

### c. INTERSECT

Returns rows that appear in both queries.

```sql
SELECT first_name FROM employees WHERE salary > 60000
INTERSECT
SELECT first_name FROM employees WHERE department_id = 1;
```
*Lists employees in department 1 who earn more than 60,000.*

---

### d. EXCEPT (or MINUS)

Returns rows from the first query that are not in the second.

```sql
SELECT first_name FROM employees
EXCEPT
SELECT first_name FROM employees WHERE department_id = 1;
```
*Lists employees not in department 1.*

---

## 4. Practical Examples

### a. Employees Not in Any Department

```sql
SELECT first_name
FROM employees
WHERE department_id NOT IN (SELECT id FROM departments);
```
*Finds employees whose department does not exist in the departments table.*

---

### b. Departments Without Employees

```sql
SELECT department_name
FROM departments
WHERE id NOT IN (SELECT department_id FROM employees);
```
*Lists departments with no employees.*

---

### c. Top Earners in Each Department (Correlated Subquery)

```sql
SELECT first_name, department_id, salary
FROM employees e1
WHERE salary = (
  SELECT MAX(salary)
  FROM employees e2
  WHERE e2.department_id = e1.department_id
);
```
*Finds the highest paid employee(s) in each department.*

---

### d. Employees with Unique Salaries

```sql
SELECT first_name, salary
FROM employees e1
WHERE 1 = (
  SELECT COUNT(*)
  FROM employees e2
  WHERE e2.salary = e1.salary
);
```
*Finds employees whose salary is unique in the company.*

---

### e. Using ALL and ANY with Subqueries

```sql
SELECT first_name, salary
FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 2);
```
*Finds employees earning more than every employee in department 2.*

```sql
SELECT first_name, salary
FROM employees
WHERE salary > ANY (SELECT salary FROM employees WHERE department_id = 2);
```
*Finds employees earning more than at least one employee in department 2.*

---

## 5. Best Practices

- Use subqueries for filtering, calculations, and complex logic.
- Prefer JOINs over subqueries for performance when possible.
- Use set operations for combining similar result sets.
- Always check for NULLs when using IN/NOT IN with subqueries.
- Use aliases for derived tables and subqueries for clarity.

---

## 6. Summary Table

| Feature         | Description                                      | Example Syntax                                  |
|-----------------|--------------------------------------------------|-------------------------------------------------|
| Subquery        | Query inside another query                       | `SELECT ... WHERE col = (SELECT ...)`           |
| Correlated      | Subquery refers to outer query                   | `WHERE col = (SELECT ... WHERE ...)`            |
| UNION           | Combine results, remove duplicates               | `SELECT ... UNION SELECT ...`                   |
| UNION ALL       | Combine results, keep duplicates                 | `SELECT ... UNION ALL SELECT ...`               |
| INTERSECT       | Rows common to both queries                      | `SELECT ... INTERSECT SELECT ...`               |
| EXCEPT/MINUS    | Rows in first query not in second                | `SELECT ... EXCEPT SELECT ...`                  |

---

## 7. Conclusion

Subqueries and set operations are powerful tools for advanced SQL querying. They enable complex filtering, comparison, and combination of result sets, making your queries more flexible and expressive.

---