CREATE DATABASE dx_pvt;
USE dx_pvt;

CREATE TABLE employe (
	      emp_id CHAR(5) NOT NULL,
            emp_name VARCHAR(20) NOT NULL,
            salary INT NOT NULL,
            dept_id CHAR(5) NOT NULL,
            manager_id CHAR(5) NOT NULL
);

INSERT INTO employe (emp_id,emp_name,salary,dept_id,manager_id)
VALUES
('E1','jay',  20000, 'D1', 'M1'),
('E2','ram',  25000, 'D2', 'M2'),
('E3','joy',  30000, 'D3', 'M3'),
('E4','shyam',15000, 'D4', 'M4'),
('E5','vyom', 45000, 'D5', 'M5');

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
('D5', 'CSE');

SET SQL_SAFE_UPDATES = 0;   -- SAFE MODE OFF
DELETE FROM department
WHERE dept_id = 'D5';
select * from department;

INSERT INTO department (dept_id,dept_name)
VALUES
('D5', 'CSE');
select * from department;

CREATE TABLE manager (
			mang_id CHAR(5) NOT NULL,
            mang_name VARCHAR(20) NOT NULL,
            dept_id CHAR(5) NOT NULL
);

INSERT INTO manager (mang_id,mang_name,dept_id)
VALUES
('M1','rohan',  'D1'),
('M2','aakash', 'D2'),
('M3','radhika','D3'),
('M4','satyam', 'D4');
select * from manager;

CREATE TABLE project (
			project_id CHAR(5) NOT NULL,
            project_name VARCHAR(20) NOT NULL,
            team_mem_id CHAR(5) NOT NULL
);

INSERT INTO project (project_id,project_name,team_mem_id)
VALUES
('P1','ELT',  'T1'),
('P2','DATA_W', 'T2'),
('P3','PIPELINE','T3'),
('P4','COLLECTION', 'T4'),
('P5','UPLOADING', 'T5');
SELECT * FROM project;

UPDATE project
SET team_mem_id = CASE 
    WHEN project_id = 'P1' THEN 'E1'
    WHEN project_id = 'P2' THEN 'E2'
    WHEN project_id = 'P3' THEN 'E3'
    WHEN project_id = 'P4' THEN 'E4'
    WHEN project_id = 'P5' THEN 'E5'
END
WHERE project_id IN ('P1', 'P2', 'P3', 'P4', 'P5');
SELECT * FROM project;

CREATE TABLE family (
			member_id CHAR(5) NOT NULL,
            member_name VARCHAR(20) NOT NULL,
            parent_id CHAR(5) NOT NULL
);

INSERT INTO family (member_id,member_name,parent_id)
VALUES
('F1','ARPIT', ''),
('F2','AAKRSH', 'F8'),
('F3','MAYANK','F2'),
('F4','JAYANT', 'F1'),
('F5','RADHIKA', ''),
('F6','RAJESH', ''),
('F7','RHITIK', 'F4'),
('F8','SHARAD', 'F6');
SELECT * From family;


-- INNER JOIN/JOINS (FETCH COMMON dept_id VALUES)
SELECT e.emp_name , d.dept_name
FROM employe as e
INNER JOIN department as d
ON e.dept_id = d.dept_id;

-- LEFT JOIN (fetch All employe name & their department name)
SELECT e.emp_name , d.dept_name 	
FROM employe AS e
LEFT JOIN department AS d
ON e.dept_id = d.dept_id;

-- RIGHT JOIN (fetch employe name & ALL department name)
SELECT emp_id, dept_name 	
FROM employe AS e
RIGHT JOIN department AS d
ON e.dept_id = d.dept_id;

-- Q) fetch the detail of all the employe their manager their department & their project they work on?
SELECT e.emp_name, d.dept_name, m.mang_name, p.project_name
FROM employe as e
JOIN department as d on e.dept_id = d.dept_id
left join manager as m 	on m.dept_id = e.dept_id
join project AS p on p.team_mem_id = e.emp_id;  

-- full join ( inner join + all remaining record from left & right table both)
--  In mysql full join systax doesn't exist,
--  we use union keyword to with left & right join together to make full join
SELECT e.emp_name, e.salary, m.dept_id,mang_name
FROM employe as e
left join manager as m
ON e.manager_id = m.mang_id
UNION
SELECT e.emp_name, e.salary,m.dept_id, m.mang_name
FROM employe as e
right join manager as m
ON e.manager_id = m.mang_id;

-- cross join it will return cartesian product
-- no need to give on condition
-- it will fetch all correspondes column record from left to right table one by one
-- [it is used in case when onother table dosn't contain matching column
-- or tabels unable to join but still need to join]
SELECT emp_name, dept_name
FROM employe as e
cross join department as d;

-- Natural join, joins tables automatically by SQL after find  matched column_name in both tables
-- no need to give ON matching condition
-- if unable to find matched condition it will join tables as CROSS JOIN and give cartician product
SELECT emp_name,salary
FROM employe
NATURAL JOIN department;

ALTER TABLE department
RENAME COLUMN dept_id to id;
SELECT * FROM department;    -- After this modification natural join work as a cross join & give cartesian products.

ALTER TABLE department      -- Undo modification
RENAME COLUMN id to dept_id;
SELECT * FROM department;

-- SELF join, is used when have to fetch detail form same table
-- have to fetch details by two column condition from same table
-- can aslo use as left,right join.
SELECT * FROM family;

SELECT c.member_name as Child_Name, 
	   p.parent_id as Parent_name
FROM family as c
JOIN family as p
on c.member_id = p.parent_id;

SELECT c.member_name as Child_Name,   -- WITH LEFT JOIN 
	   p.parent_id as Parent_name
FROM family as c
LEFT JOIN family as p
on c.member_id = p.parent_id;
		
SELECT * FROM employe;
SELECT * FROM department;
SELECT * FROM manager;
SELECT * FROM project;
SELECT * FROM family;

