-- List the following details of each employee: employee number, last name, first name, sex, and salary.
-- Create inner join on employee and slaries tables.
-- Perform an INNER JOIN on the two tables
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
  INNER JOIN employees AS e 
  ON (e.emp_no=dm.emp_no)
    JOIN departments AS d
	ON (d.dept_no = dm.dept_no)
ORDER BY dept_no ASC;

--List the department of each employee with the following information: employee number, last name, 
--first name, and department name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
  INNER JOIN employees AS e 
  ON (e.emp_no=dm.emp_no)
    JOIN departments AS d
	ON (d.dept_no = dm.dept_no)
ORDER BY dept_no ASC;
