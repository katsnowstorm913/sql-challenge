--list employee number, last name, sex, and salary
create view employee_salary as (
	select e.emp_no, e.last_name, e.sex, s.salary
	from employees as e
	join salaries as s
	on e.emp_no = s.emp_no
);
select * from employee_salary;

--list first name, last name and hire date for employees who were hired in 1986
select first_name, last_name, hire_date from employees where hire_date like '%1986';
	
--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
create view managers as (
	select mg.dept_no, mg.emp_no, d.department_name, e.first_name, e.last_name
	from dept_managers as mg
	join departments as d
	on mg.dept_no = d.department_no
		join employees as e
		on mg.emp_no = e.emp_no
);
select * from managers;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
create view emps as (
	select de.emp_no, e.first_name, e.last_name, d.department_name
	from dept_employee as de
	join employees as e
	on de.emp_no = e.emp_no
		join departments as d
		on d.department_no = de.dept_no
);
select * from emps;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex from employees where first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name
select * from emps where department_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
select * from emps where department_name = 'Sales' or department_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
create view last_names as (
	select last_name, count(last_name) as counts
	from employees
	group by last_name
);

select * from last_names
order by counts desc;

