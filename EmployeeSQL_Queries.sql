--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY last_name, first_name


--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT last_name, first_name, hire_date
FROM employees
WHERE EXTRACT(YEAR from hire_date) = '1986'
ORDER BY last_name, first_name


--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, dept_name, dept_manager.emp_no, last_name, first_name
FROM dept_manager
JOIN employees on dept_manager.emp_no = employees.emp_no
JOIN departments on departments.dept_no = dept_manager.dept_no
ORDER BY dept_no, last_name


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, dept_emp.dept_no, last_name, first_name, dept_name 
FROM dept_emp
JOIN employees on dept_emp.emp_no = employees.emp_no
JOIN departments on departments.dept_no = dept_emp.dept_no
ORDER BY dept_no, last_name, first_name


--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT last_name, first_name, sex
FROM employees
WHERE (last_name LIKE 'B%') AND (first_name = 'Hercules')
ORDER BY last_name


--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, last_name, first_name, dept_name
FROM dept_emp
JOIN employees on dept_emp.emp_no = employees.emp_no 
JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE departments.dept_no = 'd007'
ORDER BY last_name, first_name

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, last_name, first_name, dept_name
FROM dept_emp
JOIN employees on dept_emp.emp_no = employees.emp_no 
JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE departments.dept_no = 'd007' OR departments.dept_no = 'd005'
ORDER BY departments.dept_name, last_name, first_name


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS count_name
FROM employees
GROUP BY last_name
ORDER BY count_name DESC, last_name 



