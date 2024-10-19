USE dx_pvt;

CREATE TABLE employe (
	      emp_id CHAR(5) NOT NULL,
            emp_nane VARCHAR(20) NOT NULL,
            salary INT NOT NULL,
            dept_id CHAR(5) NOT NULL,
            manager_id CHAR(5) NOT NULL
);
ALTER TABLE employe
RENAME COLUMN emp_nane TO emp_name;

INSERT INTO employe (emp_id,emp_name,salary,dept_id,manager_id)
VALUES
('E1','jay',  20000, 'D1', 'M1'),
('E2','ram',  25000, 'D2', 'M2'),
('E3','joy',  30000, 'D3', 'M3'),
('E4','shyam',15000, 'D4', 'M4'),
('E5','vyom', 45000, 'D5', 'M5');

CREATE TABLE department (
			dep_id CHAR(5) NOT NULL,
            dep_name VARCHAR(20) NOT NULL
);
ALTER TABLE department
RENAME COLUMN dep_nane TO dep_name;
select * from department;
INSERT INTO department (dep_id,dep_name)
VALUES
('D1', 'IT'),
('D2', 'ME'),
('D3', 'CE'),
('D4', 'EE'),
('D5', 'CSE');
SET SQL_SAFE_UPDATES = 0;   -- SAFE MODE OFF
DELETE FROM department
WHERE dep_id = 'D5';
INSERT INTO department (dep_id,dep_name)
VALUES
('D5', 'CSE');
CREATE TABLE manager (
			man_id CHAR(5) NOT NULL,
            man_name VARCHAR(20) NOT NULL,
            dep_id CHAR(5) NOT NULL
);

INSERT INTO manager (man_id,man_name,dep_id)
VALUES
('M1','rohan',  'D1'),
('M2','aakash', 'D2'),
('M3','radhika','D3'),
('M4','satyam', 'D4');

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
SET SQL_SAFE_UPDATES = 0;
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

-- INNER JOIN/JOINS (FETCH COMMON dept_id VALUES)
SELECT e.emp_name , d.dep_name
FROM employe as e
INNER JOIN department as d
ON e.dept_id = d.dep_id;

-- LEFT JOIN (fetch All employe name & their department name)
SELECT e.emp_name , d.dep_name 	
FROM employe AS e
LEFT JOIN department AS d
ON e.dept_id = d.dep_id;

-- RIGHT JOIN (fetch employe name & ALL department name)
SELECT emp_id, dep_name 	
FROM employe AS e
RIGHT JOIN department AS d
ON e.dept_id = d.dep_id;

-- Q) fetch the detail of all the employe their manager their department & their project they work on?
SELECT e.emp_name, d.dep_name, m.man_name, p.project_name
FROM employe as e
JOIN department as d on e.dept_id = d.dep_id
left join manager as m 	on m.dep_id = e.dept_id
join project AS p on p.team_mem_id = e.emp_id  

