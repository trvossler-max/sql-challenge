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
--Employees that are assigned to multiple departments will be listed multiple times with this query
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
  INNER JOIN employees AS e 
  ON (e.emp_no=de.emp_no)
    JOIN departments AS d
	ON (d.dept_no = de.dept_no)
ORDER BY emp_no ASC;

--List first name, last name, and sex for employees whose first name is "Hercules" and 
--last names begin with "B."

SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name,
--and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
  INNER JOIN employees AS e 
  ON (e.emp_no=de.emp_no)
    JOIN departments AS d
	ON (d.dept_no = de.dept_no)
        WHERE dept_name  = 'Sales'
ORDER BY emp_no ASC;

--List all employees in the Sales and Development departments, including their employee number, last name,
--first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
  INNER JOIN employees AS e 
  ON (e.emp_no=de.emp_no)
    JOIN departments AS d
	ON (d.dept_no = de.dept_no)
        WHERE 
		  dept_name  = 'Sales' 
		  OR dept_name = 'Development'
ORDER BY emp_no ASC;

--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
SELECT last_name, COUNT(last_name) AS l_name
FROM employees
GROUP BY last_name
ORDER BY l_name DESC;
