# Database Fundamentals

---

## 1. What is a Database?

A **database** is an organized collection of structured information, or data, typically stored electronically in a computer system. Databases are designed to manage, store, retrieve, and manipulate data efficiently.

### Key Points:
- Databases store data in a structured way for easy access and management.
- They support operations like insertion, update, deletion, and querying.
- Databases can be as simple as a text file or as complex as enterprise-level systems.

---

## 2. Types of Databases

### a. Relational Databases (RDBMS)
- Store data in tables (rows and columns).
- Use SQL for data management.
- Examples: MySQL, PostgreSQL, Oracle, SQL Server, SQLite.

### b. NoSQL Databases
- Designed for unstructured or semi-structured data.
- Types: Document (MongoDB), Key-Value (Redis), Columnar (Cassandra), Graph (Neo4j).
- Do not require fixed schemas.

### c. In-Memory Databases
- Store data in RAM for fast access.
- Examples: Redis, Memcached.

### d. Cloud Databases
- Hosted on cloud platforms.
- Examples: Amazon RDS, Google Cloud SQL, Azure SQL Database.

---

## 3. Database Concepts

### a. Table
- A collection of related data entries.
- Consists of rows (records) and columns (fields/attributes).

**Example:**

| id | name   | age |
|----|--------|-----|
| 1  | Alice  | 24  |
| 2  | Bob    | 30  |

### b. Row (Record/Tuple)
- A single, data item in a table.

### c. Column (Field/Attribute)
- A single property or characteristic of the data.

### d. Schema
- The structure that defines tables, columns, data types, and relationships.

### e. Primary Key
- A column (or set of columns) that uniquely identifies each row in a table.
- Example: `id` in the table above.

### f. Foreign Key
- A column that creates a relationship between two tables.
- References the primary key of another table.

**Example:**

| order_id | customer_id |
|----------|-------------|
| 101      | 1           |
| 102      | 2           |

Here, `customer_id` is a foreign key referencing `id` in the `customers` table.

### g. Index
- A data structure that improves the speed of data retrieval.
- Can be created on one or more columns.

### h. Constraints
- Rules enforced on data columns.
- Types: `NOT NULL`, `UNIQUE`, `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `DEFAULT`.

---

## 4. Database Management System (DBMS)

A **DBMS** is software that interacts with users, applications, and the database to capture and analyze data.

### Functions of a DBMS:
- Data storage, retrieval, and update
- User and security management
- Backup and recovery
- Data integrity and consistency
- Transaction management

### Types of DBMS:
- Relational (RDBMS): MySQL, PostgreSQL
- NoSQL: MongoDB, Cassandra
- Object-oriented: db4o
- Hierarchical/Network: IBM IMS

---

## 5. Relational Database Model

- Organizes data into tables (relations).
- Each table has a unique primary key.
- Tables can be related using foreign keys.
- Supports normalization to reduce redundancy.

### Example: Customers and Orders

**Customers Table**

| id | name   | email           |
|----|--------|-----------------|
| 1  | Alice  | alice@mail.com  |
| 2  | Bob    | bob@mail.com    |

**Orders Table**

| order_id | customer_id | amount |
|----------|-------------|--------|
| 101      | 1           | 250    |
| 102      | 2           | 150    |

---

## 6. Normalization

**Normalization** is the process of organizing data to minimize redundancy.

### Normal Forms:
- **1NF:** Eliminate duplicate columns; each cell contains a single value.
- **2NF:** Remove subsets of data that apply to multiple rows; use separate tables.
- **3NF:** Remove columns not dependent on the primary key.

**Example:**

Before normalization (not 1NF):

| id | name   | phones         |
|----|--------|----------------|
| 1  | Alice  | 123, 456       |

After normalization (1NF):

| id | name   | phone |
|----|--------|-------|
| 1  | Alice  | 123   |
| 1  | Alice  | 456   |

---

## 7. Transactions

A **transaction** is a sequence of operations performed as a single logical unit of work.

### ACID Properties:
- **Atomicity:** All operations succeed or none do.
- **Consistency:** Database remains in a valid state.
- **Isolation:** Transactions do not interfere with each other.
- **Durability:** Once committed, changes are permanent.

**Example:**
Transferring money between accounts involves debiting one and crediting another. Both must succeed or fail together.

---

## 8. Keys in Databases

### a. Primary Key
- Uniquely identifies each record.
- Cannot be NULL.

### b. Foreign Key
- Links two tables together.
- Enforces referential integrity.

### c. Unique Key
- Ensures all values in a column are unique.

### d. Composite Key
- Combination of two or more columns to uniquely identify a row.

---

## 9. Relationships

### a. One-to-One
- Each row in Table A relates to one row in Table B.

### b. One-to-Many
- A row in Table A can relate to many rows in Table B.

### c. Many-to-Many
- Rows in Table A relate to many rows in Table B and vice versa, often using a junction table.

**Example:**

**Students Table**

| student_id | name   |
|------------|--------|
| 1          | Alice  |
| 2          | Bob    |

**Courses Table**

| course_id | course_name |
|-----------|------------|
| 101       | Math       |
| 102       | Science    |

**Enrollments Table (junction table)**

| student_id | course_id |
|------------|-----------|
| 1          | 101       |
| 1          | 102       |
| 2          | 101       |

---

## 10. Data Integrity

- **Entity Integrity:** Ensures each table has a primary key and unique rows.
- **Referential Integrity:** Ensures foreign keys match primary keys in related tables.
- **Domain Integrity:** Ensures data values are valid (e.g., age cannot be negative).

---

## 11. Indexes

Indexes speed up data retrieval but can slow down data modification (INSERT, UPDATE, DELETE).

**Example:**

```sql
CREATE INDEX idx_lastname ON employees(last_name);
```

---

## 12. Views

A **view** is a virtual table based on the result of a query.

**Example:**

```sql
CREATE VIEW high_salary_employees AS
SELECT first_name, last_name, salary
FROM employees
WHERE salary > 70000;
```

---

## 13. Stored Procedures and Triggers

- **Stored Procedure:** A saved collection of SQL statements that can be executed as a program.
- **Trigger:** A procedure that runs automatically in response to certain events on a table.

**Example Stored Procedure:**

```sql
CREATE PROCEDURE GiveRaise (IN emp_id INT, IN percent DECIMAL(3,2))
BEGIN
  UPDATE employees SET salary = salary * (1 + percent/100) WHERE id = emp_id;
END;
```

**Example Trigger:**

```sql
CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
SET NEW.hire_date = NOW();
```

---

## 14. Backup and Recovery

- **Backup:** Creating a copy of database data for protection against data loss.
- **Recovery:** Restoring data from backups after a failure.

---

## 15. Security

- **Authentication:** Verifying user identity.
- **Authorization:** Granting permissions to users.
- **Encryption:** Protecting data at rest and in transit.

**Example:**

```sql
GRANT SELECT, INSERT ON employees TO 'user1';
REVOKE DELETE ON employees FROM 'user1';
```

---

## 16. Summary

- Databases are essential for structured data storage and management.
- Understanding tables, keys, relationships, normalization, and transactions is fundamental.
- DBMS provides tools for data integrity, security, and efficient access.
- Mastery of database fundamentals is crucial for anyone working with data or software development.

---