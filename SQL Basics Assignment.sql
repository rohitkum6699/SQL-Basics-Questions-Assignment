-- Question 1
-- Create Database 
CREATE DATABASE company_db;

-- Use Database
use company_db;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);
-- Question 2
INSERT INTO employees (employee_id, first_name, last_name, department, salary, hire_date)
VALUES
(101, 'Amit',  'Sharma',  'HR',      50000, '2020-01-15'
),
(102, 'Riya',  'Kapoor',  'Sales',   75000, '2019-03-22'
),
(103, 'Raj',   'Mehta',   'IT',      90000, '2018-07-11'
),
(104, 'Neha',  'Verma',   'IT',      85000,'2021-09-01'
),
(105, 'Arjun', 'Singh',   'Finance', 60000, '2022-02-10'
);
select*from employees
-- Question 3
SELECT *
FROM employees
ORDER BY salary ASC; 

-- Question 4
SELECT *
FROM employees
ORDER BY department ASC, salary DESC;

-- Question 5

SELECT *
FROM employees
WHERE department = 'IT'
ORDER BY hire_date DESC;

-- Question 6
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount INT,
    sale_date DATE
);

INSERT INTO sales (sale_id, customer_name, amount, sale_date)
VALUES
(1, 'Aditi', 1500, '2024-08-01'),
(2, 'Rohan', 2200, '2024-08-03'),
(3, 'Aditi', 3500, '2024-09-05'),
(4, 'Meena', 2700, '2024-09-15'),
(5, 'Rohan', 4500, '2024-09-25');
select * from sales;
-- Question 7

SELECT *
FROM sales
ORDER BY amount DESC;
-- Question 8
SELECT *
FROM sales
WHERE customer_name = 'Aditi';
-- Question 9  What is the Difference Between a Primary Key and a Foreign Key?
-- Ans--
## 🔑 Primary Key vs 🔗 Foreign Key

| Feature      | **Primary Key**                                  | **Foreign Key**                                     |
| ------------ | ------------------------------------------------ | --------------------------------------------------- |
| Purpose      | Table ke **unique record** ko identify karta hai | Do tables ke beech **relationship** banata hai      |
| Uniqueness   | **Unique** hota hai                              | **Duplicate** ho sakta hai                          |
| NULL Allowed | ❌ NULL allowed nahi                              | ✅ NULL allowed hota hai (by default)                |
| Table        | **Same table** ka part hota hai                  | **Another table** ki Primary Key ko refer karta hai |
| Count        | Sirf **1 Primary Key** per table                 | **Multiple Foreign Keys** ho sakte hain             |
| Example      | `employee_id` in `employees`                     | `employee_id` in `sales` table                      |

---

## 📌 Example (SQL)

### Primary Key

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50)
);

### Foreign Key

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

---

## 🧠 Easy Way to Remember

* **Primary Key** → *“Main ID”* (identity of record)
* **Foreign Key** → *“Reference ID”* (link to another table)

-- Question 10   What Are Constraints in SQL and Why Are They Used?
-- Ans--

**Constraints** are **rules** applied on table columns to **control what data can be inserted** into the table.

 Simple words:
**Constraints ensure data is correct, valid, and reliable.**

##  Why Are Constraints Used?

Constraints are used to:

* ❌ Prevent **invalid data**
* 🔐 Maintain **data integrity**
* 🔗 Enforce **relationships between tables**
* 🚫 Avoid **duplicate or NULL values**
* 📊 Keep database **clean and trustworthy**

##  Common Types of SQL Constraints

### 1 PRIMARY KEY

* Uniquely identifies each row
* Cannot be `NULL` or duplicate
sql
employee_id INT PRIMARY KEY

---

### 2 FOREIGN KEY

* Creates relationship between two tables
* Refers to Primary Key of another table
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
```

### 3 NOT NULL

* Column cannot have NULL values

first_name VARCHAR(50) NOT NULL

---

### 4️ UNIQUE

* Ensures all values are different

```sql
email VARCHAR(100) UNIQUE
```

---

### 5️ CHECK

* Puts condition on values

```sql
salary INT CHECK (salary > 0)

### 6️ DEFAULT

* Sets default value if none is provided

status -- VARCHAR(20) DEFAULT 'Active'

## Easy Example
-- CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    salary INT CHECK (salary > 0),
    hire_date DATE NOT NULL
); 