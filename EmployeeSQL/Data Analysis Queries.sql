-- DATA ANALYSIS
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no AS "employee number", e.last_name AS "last name", e.first_name AS "first name", e.sex, s.salary
FROM employees e
join salaries s ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name AS "first name", last_name AS "last name"
FROM employees
WHERE hire_date LIKE '%/1986';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no AS "department number", d.dept_name AS "department name", e.emp_no AS "employee number", e.last_name AS "last name", e.first_name AS "first name"
FROM departments d
JOIN dept_manager dp ON d.dept_no = dp.dept_no
JOIN employees e ON e.emp_no = dp.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no AS "employee number", e.last_name AS "last name", e.first_name AS "first name", d.dept_name AS "department name"
FROM departments d
JOIN dept_emp dpe ON d.dept_no = dpe.dept_no
JOIN employees e ON e.emp_no = dpe.emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name AS "first name", last_name AS "last name"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "employee number", e.last_name AS "last name", e.first_name AS "first name", d.dept_name AS "department name"
FROM departments d
JOIN dept_emp dpe ON d.dept_no = dpe.dept_no
JOIN employees e ON e.emp_no = dpe.emp_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "employee number", e.last_name AS "last name", e.first_name AS "first name", d.dept_name AS "department name"
FROM departments d
JOIN dept_emp dpe ON d.dept_no = dpe.dept_no
JOIN employees e ON e.emp_no = dpe.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name as "last name", count(last_name) as "frequency"
FROM employees
GROUP BY "last name" 
ORDER BY "frequency" DESC;