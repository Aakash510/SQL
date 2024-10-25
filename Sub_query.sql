
USE dx_pvt;
CREATE TABLE  emp_2 (
	          emp_id CHAR(5) NOT NULL,
              emp_name VARCHAR(20) NOT NULL,
              salary INT NOT NULL,
              dept_name VARCHAR(20) NOT NULL,
              dept_id CHAR(5) NOT NULL,
              manager_id CHAR(5) NOT NULL
);

INSERT INTO emp_2 (emp_id,emp_name,salary,dept_name,dept_id,manager_id)
VALUES
('E1','jay',  20000,'IT', 'EE', 'M1'),
('E2','ram',  25000,'IT', 'IT', 'M2'),
('E3','joy',  30000,'IT', 'CE', 'M3'),
('E4','shyam',15000,'IT', 'EE', 'M4'),
('E5','vyom', 45000,'IT', 'CSE', 'M5'),
('E6','jayant',  22000,'IT', 'D6', 'M6'),
('E7','rammi',  23000,'EE', 'D7', 'M7'),
('E8','jayash',  27000,'CE', 'D8', 'M8'),
('E9','shyamu',35000,'IT', 'D9', 'M9'),
('E10','vyomesh', 39000,'CSE', 'D10', 'M10'),
('E11','ramsing',  28000,'IT', 'D11', 'M11'),
('E12','joydx',  34000,'CE', 'D12', 'M12'),
('E13','shy',10000,'CSE', 'D13', 'M13'),
('E14','vivan', 42000,'EE', 'D14', 'M14'),
('E15','jagdesh',  20000,'CSE', 'D15', 'M15');
SELECT * FROM emp_2;

CREATE TABLE department (
			dept_id CHAR(5) NOT NULL,
            dept_name VARCHAR(20) NOT NULL
);

INSERT INTO department (dept_id,dept_name)
VALUES
('D1', 'IT'),
('D2', 'ME'),
('D3', 'CE'),
('D4', 'EE'),
('D5', 'CSE'),
('D6', 'ACC'),
('D7', 'MANG');


/*  - SQL Subquries  - A sub/inner/nested query is a query within another query.
    - It can be dynamic in some cases. */

-- Q) find all the employe & salary whose salary is greater than average salary.

SELECT AVG(salary) FROM emp_2;   -- 27666.66

SELECT *  -- outer/main query
FROM emp_2
WHERE salary > (SELECT AVG(salary) FROM emp_2);  -- sub/inner query

/* - scalar subquery
   - it will always return 1 Row & 1 Column
   - subquery create a new table
   - we can write it with SELECT or FROM clause */
   
SELECT  * 
FROM emp_2 as e 
JOIN (SELECT avg(salary) as sal FROM emp_2) as avg_sal
ON e.salary > avg_sal.sal;

/* MULTIPLE ROW SUBQUERY
      - 1)  Subquery which return multiple rows & column
      - 2)  Subquery which return only 1 column & multiple rows*/
      
-- 1.Q) Find the employe who earn the highest salary in each department.

SELECT *
FROM emp_2
WHERE (dept_name,salary) in (SELECT  dept_name, max(salary)
							FROM emp_2
							GROUP BY dept_name);

/* 2.Q)  find department who do not have any employe
         - first we fetch dept_name who have employe by mutiple row subquery then
           filter them through main query. */

SELECT * FROM emp_2;
SELECT * FROM department;

SELECT *
FROM department
WHERE dept_name NOT IN (SELECT distinct dept_name From emp_2);