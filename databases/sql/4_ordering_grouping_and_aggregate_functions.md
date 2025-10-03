# Ordering, Grouping, and Aggregate Functions in SQL

---

## 1. Introduction

Ordering, grouping, and aggregate functions are essential SQL features for analyzing and presenting data. They allow you to sort results, group rows based on column values, and perform calculations like sums, averages, and counts.

---

## 2. Example Tables

We'll use these tables for examples:

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

## 3. ORDER BY: Sorting Results

The `ORDER BY` clause sorts the result set by one or more columns.

### a. Basic Ordering

```sql
SELECT * FROM employees ORDER BY salary;
```
*Sorts employees by salary in ascending order (default).*

### b. Descending Order

```sql
SELECT * FROM employees ORDER BY salary DESC;
```
*Sorts employees by salary in descending order.*

### c. Multiple Columns

```sql
SELECT * FROM employees ORDER BY department_id ASC, salary DESC;
```
*Sorts first by department, then by salary within each department.*

### d. Ordering by Expressions

```sql
SELECT *, salary * 1.1 AS new_salary
FROM employees
ORDER BY new_salary DESC;
```
*Sorts by a calculated column.*

### e. Ordering by Column Position

```sql
SELECT first_name, salary FROM employees ORDER BY 2 DESC;
```
*Sorts by the second selected column (`salary`).*

---

## 4. GROUP BY: Grouping Data

The `GROUP BY` clause groups rows that have the same values in specified columns.

### a. Basic Grouping

```sql
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id;
```
*Counts employees in each department.*

**Result:**

| department_id | num_employees |
|---------------|--------------|
| 1             | 2            |
| 2             | 2            |
| 3             | 1            |

### b. Grouping by Multiple Columns

```sql
SELECT department_id, hire_date, COUNT(*) AS hires
FROM employees
GROUP BY department_id, hire_date;
```
*Counts hires per department per hire date.*

### c. Using GROUP BY with ORDER BY

```sql
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY avg_salary DESC;
```
*Shows average salary per department, highest first.*

---

## 5. Aggregate Functions

Aggregate functions perform calculations on sets of rows.

### a. COUNT()

```sql
SELECT COUNT(*) AS total_employees FROM employees;
```
*Counts all employees.*

### b. SUM()

```sql
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;
```
*Total salary per department.*

### c. AVG()

```sql
SELECT AVG(salary) AS avg_salary FROM employees;
```
*Average salary of all employees.*

### d. MIN() and MAX()

```sql
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM employees;
```
*Finds the lowest and highest salary.*

### e. Aggregate with DISTINCT

```sql
SELECT COUNT(DISTINCT department_id) AS unique_departments FROM employees;
```
*Counts unique departments.*

---

## 6. HAVING: Filtering Groups

`HAVING` filters groups after aggregation (unlike `WHERE`, which filters rows before grouping).

### a. Basic HAVING

```sql
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 1;
```
*Shows departments with more than one employee.*

### b. HAVING with Aggregate Functions

```sql
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 60000;
```
*Departments with average salary above 60,000.*

---

## 7. Combining ORDER BY, GROUP BY, and Aggregates

### a. Top N Groups

```sql
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC
LIMIT 1;
```
*Department with the highest total salary.*

### b. Multiple Aggregates

```sql
SELECT department_id,
       COUNT(*) AS num_employees,
       SUM(salary) AS total_salary,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY avg_salary DESC;
```
*Shows count, sum, and average salary per department.*

---

## 8. Practical Examples

### a. Find the Highest Paid Employee in Each Department

```sql
SELECT e.department_id, e.first_name, e.salary
FROM employees e
INNER JOIN (
  SELECT department_id, MAX(salary) AS max_salary
  FROM employees
  GROUP BY department_id
) m ON e.department_id = m.department_id AND e.salary = m.max_salary;
```

### b. Count Employees Hired Each Year

```sql
SELECT YEAR(hire_date) AS year, COUNT(*) AS hires
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY year;
```

### c. List Departments with Total Salary Above 100,000

```sql
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;
```

---

## 9. GROUP BY with JOINs

```sql
SELECT d.department_name, COUNT(e.id) AS num_employees
FROM departments d
LEFT JOIN employees e ON d.id = e.department_id
GROUP BY d.department_name;
```
*Shows all departments, even those with zero employees.*

---

## 10. GROUP BY with Expressions

```sql
SELECT
  CASE
    WHEN salary < 60000 THEN 'Low'
    WHEN salary BETWEEN 60000 AND 80000 THEN 'Medium'
    ELSE 'High'
  END AS salary_range,
  COUNT(*) AS num_employees
FROM employees
GROUP BY salary_range;
```
*Groups employees by salary range.*

---

## 11. Nested Aggregates and Subqueries

### a. Departments with Above-Average Employee Count

```sql
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) > (
  SELECT AVG(dept_count) FROM (
    SELECT COUNT(*) AS dept_count
    FROM employees
    GROUP BY department_id
  ) AS sub
);
```

---

## 12. Common Mistakes and Best Practices

- Always use `GROUP BY` with non-aggregated columns in the `SELECT` clause.
- Use `HAVING` for filtering after aggregation, not `WHERE`.
- Remember that `ORDER BY` can sort by aggregate results.
- Use aliases for readability.
- Test queries with sample data to ensure correctness.

---

## 13. Summary Table

| Clause      | Purpose                                 | Example Usage                        |
|-------------|-----------------------------------------|--------------------------------------|
| ORDER BY    | Sorts result rows                       | `ORDER BY salary DESC`               |
| GROUP BY    | Groups rows for aggregation             | `GROUP BY department_id`             |
| HAVING      | Filters groups after aggregation        | `HAVING COUNT(*) > 1`                |
| COUNT()     | Counts rows                             | `COUNT(*)`                           |
| SUM()       | Sums values                             | `SUM(salary)`                        |
| AVG()       | Calculates average                      | `AVG(salary)`                        |
| MIN()/MAX() | Finds minimum/maximum                   | `MIN(salary)`, `MAX(salary)`         |

---

## 14. Summary

- `ORDER BY` sorts query results.
- `GROUP BY` groups rows for aggregate calculations.
- Aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) summarize data.
- `HAVING` filters groups after aggregation.
- Combining these features enables powerful data analysis in SQL.

---