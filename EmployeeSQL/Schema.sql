-- DROP TABLES IF THEY EXIST
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;

-- CREATE THE TABLES
CREATE TABLE titles (
    title_id VARCHAR NOT NULL PRIMARY KEY,
    title VARCHAR
);

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL PRIMARY KEY,
    dept_name VARCHAR
);

CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR,
    birth_date VARCHAR,
    first_name VARCHAR,
    last_name VARCHAR,
    sex VARCHAR,
    hire_date VARCHAR,
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_manager (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);