CREATE TABLE departments (
  dept_no varchar(5) PRIMARY KEY NOT NULL UNIQUE,
  dept_name string NOT NULL
);

CREATE TABLE titles (
  title_id varchar(5) PRIMARY KEY NOT NULL UNIQUE,
  title string NOT NULL 
);

CREATE TABLE employees (
  emp_no int PRIMARY KEY NOT NULL UNIQUE,
  emp_title_id varchar(5) NOT NULL,
  birthdate date NOT NULL,
  first_name string NOT NULL,
  last_name string NOT NULL,
  sex varchar(1) NOT NULL,
  hire_date date NOT NULL,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
  emp_no int NOT NULL,
  salary int NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
  dept_no varchar(5) NOT NULL,
  emp_no int NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
  emp_no int NOT NULL,
  dept_no varchar(5) NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);