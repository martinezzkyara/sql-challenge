--- List each employee number, last name, first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
    ON (e.emp_no=s.emp_no);

--- List first name, last name, and hire date for employees hired in 1986
SELECT e.first_name, e.last_name, e.hire_date 
FROM employees AS e 
WHERE DATEPART(year, e.hire_date) = 1986;

--- List manager of each department with their department number, department name, employee number, last name, and first name
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_manager AS dm
    ON (dm.emp_no = e.emp_no)
INNER JOIN departments AS d
    ON (dm.dept_no = d.dept_no);

--- List department number for each employee along with that employee's employee number, last name, first name, and department name
SELECT e.emp_no, de.dept_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
    ON (de.emp_no = e.emp_no)
INNER JOIN departments AS d
    ON (d.dept_no = de.dept_no);

--- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with B
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE e.first_name LIKE "Hercules" AND SUBSTRING(e.last_name,1,1) LIKE "B"

--- List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_emp as de
	ON (de.emp_no = e.emp_no)
WHERE de.dept_no LIKE "d007"

--- List each employee in the Sales and Developement departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp as de
	ON (de.emp_no = e.emp_no)
INNER JOIN departments as d
	ON (d.dept_no = de.dept_no)
WHERE de.dept_no LIKE "d007" OR de.dept_no LIKE "d005"


--- List the frequency counts, in descenting order, of all the employee last names
SELECT COUNT(e.last_name) AS name_count, last_name
FROM employees AS e
GROUP BY last_name
ORDER BY name_count DESC;