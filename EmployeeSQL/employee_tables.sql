--create tables from csv files
create table titles(
	title_id varchar primary key,
	title varchar
);

create table employees(
	emp_no int primary key,
	emp_title varchar,
	foreign key (emp_title) references titles(title_id),
	birthdate varchar,
	first_name varchar,
	last_name varchar,
	sex varchar(1),
	hire_date varchar
);

create table departments(
	department_no varchar primary key,
	department_name varchar
);

create table salaries(
	emp_no int primary key,
	foreign key (emp_no) references employees(emp_no),
	salary int
);

create table dept_managers(
	dept_no varchar,
	foreign key (dept_no) references departments(department_no),
	emp_no int primary key,
	foreign key (emp_no) references employees(emp_no)
);

create table dept_employee(
	emp_no int,
	foreign key (emp_no) references employees(emp_no),
	dept_no varchar,
	foreign key (dept_no) references departments(department_no)
);

--add primary key to dept_employees so rows are unique
alter table dept_employee
add column id serial primary key;
