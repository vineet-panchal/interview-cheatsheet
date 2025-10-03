# How to Join Tables in SQL

---

## 1. Introduction

Joining tables is a fundamental operation in SQL that allows you to combine rows from two or more tables based on related columns. Joins are essential for querying normalized databases where data is split across multiple tables.

---

## 2. Example Tables

We'll use these tables for examples:

### `employees`

| id | first_name | last_name | department_id | manager_id |
|----|------------|-----------|--------------|------------|
| 1  | Alice      | Smith     | 1            | 3          |
| 2  | Bob        | Johnson   | 2            | 3          |
| 3  | Carol      | Williams  | 1            | NULL       |
| 4  | David      | Brown     | 3            | 3          |
| 5  | Eve        | Davis     | 2            | 3          |

### `departments`

| id | department_name |
|----|----------------|
| 1  | IT             |
| 2  | Sales          |
| 3  | HR             |
| 4  | Marketing      |

---

## 3. INNER JOIN

An **INNER JOIN** returns rows when there is a match in both tables.

```sql
SELECT e.first_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;
```

---

## 4. LEFT JOIN (LEFT OUTER JOIN)

A **LEFT JOIN** returns all rows from the left table and matched rows from the right table. If there is no match, NULLs are returned for columns from the right table.

```sql
SELECT e.first_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;
```

---

## 5. RIGHT JOIN (RIGHT OUTER JOIN)

A **RIGHT JOIN** returns all rows from the right table and matched rows from the left table. If there is no match, NULLs are returned for columns from the left table.

```sql
SELECT e.first_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;
```

---

## 6. FULL OUTER JOIN

A **FULL OUTER JOIN** returns all rows when there is a match in either table. If there is no match, NULLs are returned for missing columns.

```sql
SELECT e.first_name, d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.id;
```

---

## 7. CROSS JOIN

A **CROSS JOIN** returns the Cartesian product of both tables (every row of the first table joined with every row of the second table).

```sql
SELECT e.first_name, d.department_name
FROM employees e
CROSS JOIN departments d;
```

---

## 8. USING Clause

If the columns you are joining on have the same name, you can use `USING` instead of `ON`.

```sql
SELECT e.first_name, d.department_name
FROM employees e
INNER JOIN departments d USING (department_id);
```

---

## 9. Self Join

A **self join** joins a table to itself. Useful for hierarchical data (e.g., employees and managers).

```sql
SELECT e1.first_name AS employee, e2.first_name AS manager
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.id;
```

---

## 10. Join with Multiple Conditions

You can join tables using multiple columns or add extra conditions.

```sql
SELECT e.first_name, d.department_name
FROM employees e
INNER JOIN departments d
  ON e.department_id = d.id AND d.department_name != 'HR';
```

---

## 11. Joining More Than Two Tables

You can join multiple tables in a single query.

```sql
SELECT e.first_name, d.department_name, m.first_name AS manager_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
LEFT JOIN employees m ON e.manager_id = m.id;
```
*Shows each employee, their department, and their manager's name.*

---

## 12. Filtering After Join

You can filter the joined result using `WHERE`.

```sql
SELECT e.first_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
WHERE d.department_name = 'Sales';
```
*Shows only employees in the Sales department.*

---

## 13. Aggregation with Joins

You can use aggregate functions with joins.

```sql
SELECT d.department_name, COUNT(e.id) AS num_employees
FROM departments d
LEFT JOIN employees e ON d.id = e.department_id
GROUP BY d.department_name;
```
*Shows the number of employees in each department, including departments with zero employees.*

---

## 14. Anti Join (Finding Unmatched Rows)

Find departments with no employees (using `LEFT JOIN` and `WHERE ... IS NULL`):

```sql
SELECT d.department_name
FROM departments d
LEFT JOIN employees e ON d.id = e.department_id
WHERE e.id IS NULL;
```
*Lists departments that have no employees.*

---

## 15. Semi Join (EXISTS)

Find employees who belong to a department that exists in the departments table:

```sql
SELECT e.first_name
FROM employees e
WHERE EXISTS (
  SELECT 1 FROM departments d WHERE d.id = e.department_id
);
```

---

## 16. Summary Table

| Join Type      | Description                                      | Returns Unmatched Rows? |
|----------------|--------------------------------------------------|------------------------|
| INNER JOIN     | Only matching rows from both tables               | No                     |
| LEFT JOIN      | All rows from left, matched from right, NULL else | Left only              |
| RIGHT JOIN     | All rows from right, matched from left, NULL else | Right only             |
| FULL OUTER JOIN| All rows from both, NULL where no match           | Both sides             |
| CROSS JOIN     | Cartesian product (all combinations)              | N/A                    |

---

## 17. Conclusion

Joins are powerful tools for combining data from multiple tables. Mastering different types of joins is essential for effective SQL querying and relational database design.

---