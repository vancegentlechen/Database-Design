-- Hi, you create database and load the data by running  1-342 lines first
-- the rest is the statement, please check them out. 

create database MIC;
use MIC;

#1.region table
create table Region(
region_id int primary key, 	
region_name varchar(15)
);


#2.employee table
create table Employee(
emp_id int primary key,
emp_lname varchar(30),	
emp_mi varchar(15),
emp_fname varchar(30),		
emp_hiredate date,
region_id int,
constraint foreign key (region_id) references Region(region_id)
);

#3.customer table
create table Customer(
cust_id	int primary key,
cust_name varchar(30),	
cust_phone varchar(20),
region_id int,
constraint foreign key (region_id) references Region(region_id)
);


#4.skill table
create table Skill(
skill_id int primary key,	
skill_description varchar(30),	
skill_rate int
);

#5.empskill table
create table Empskill(
emp_id int,
skill_id int,
constraint foreign key (skill_id) references Skill(skill_id),
constraint foreign key (emp_id) references Employee(emp_id)
);

#6.project table
create table Project(
project_id int primary key,
project_date date,
cust_id  int,
project_description varchar(30),
project_esdatestart date,
project_esdateends date,
project_esbudget decimal(10,2),
project_acdatestart date,
project_acdateends date,
project_accost decimal(10,2),
emp_id int,
constraint foreign key (cust_id) references Customer(cust_id),
constraint foreign key (emp_id) references Employee(emp_id)
);

#7.task table
create table Task(
task_id int primary key,
project_id int,
task_description varchar(50),
task_begindate date,
task_enddate date,
skill_id int,
task_quantity int,
constraint foreign key (project_id) references Project(project_id),
constraint foreign key (skill_id) references Skill(skill_id)
);

#8.assign table
create table Assign(
assign_id int primary key,
task_id int,
emp_id int,
assign_begindate date,
assign_enddate date,
constraint foreign key (emp_id) references Employee(emp_id),
constraint foreign key (task_id) references Task(task_id)
);

#9.bill table
create table Bill(
bill_id int primary key,
bill_date date,
project_id int,
constraint foreign key (project_id) references Project(project_id)
);

#10.worklog table
create table Worklog(
wlog_id int primary key, 
assign_id int,
wlog_date date,
wlog_hours int,
bill_id int,
constraint foreign key (assign_id) references Assign(assign_id),
constraint foreign key (bill_id) references Bill(bill_id)
);





# Data loading #1 loading skill-table

insert into skill values(	1	,'	Data Entry'	,	12	);
insert into skill values(	2	,'	Data Entry II'	,	15	);
insert into skill values(	3	,'	System Analyst I'	,	18	);
insert into skill values(	4	,'	System Analyst II'	,	21	);
insert into skill values(	5	,'	Database Designer I'	,	50	);
insert into skill values(	6	,'	Database Designer II'	,	75	);
insert into skill values(	7	,'	SQL I'	,	25	);
insert into skill values(	8	,'	SQL II'	,	30	);
insert into skill values(	9	,'	C++ I'	,	35	);
insert into skill values(	10	,'	C++ II'	,	45	);
insert into skill values(	11	,'	Python I'	,	25	);
insert into skill values(	12	,'	Python II'	,	35	);
insert into skill values(	13	,'	Cold Fusion I'	,	60	);
insert into skill values(	14	,'	Cold Fusion II'	,	75	);
insert into skill values(	15	,'	ASP I'	,	60	);
insert into skill values(	16	,'	ASP II'	,	70	);
insert into skill values(	17	,'	Web Administrator'	,	50	);
insert into skill values(	18	,'	Oracle DBA'	,	100	);
insert into skill values(	19	,'	SQL Server DBA'	,	100	);
insert into skill values(	20	,'	Network Eng. I'	,	80	);
insert into skill values(	21	,'	Network Eng. II'	,	100	);
insert into skill values(	22	,'	Technical Writer'	,	100	);
insert into skill values(	23	,'	Project Manager'	,	70	);



# Data loading #2 loading region-table

insert into region values(	1	,'	NW'	);
insert into region values(	2	,'	SW'	);
insert into region values(	3	,'	MN'	);
insert into region values(	4	,'	MS'	);
insert into region values(	5	,'	NE'	);
insert into region values(	6	,'	SE'	);




# Data loading #3 loading customer-table

insert into customer values(	1	,'Xerox'	,'678-257-2857',1);
insert into customer values(	2	,'Coca Cola'	,'931-685-1563',2);
insert into customer values(	3	,'Verizon'	,'615-725-7896',3	);
insert into customer values(	4	,'Dollar Store'	,'423-596-6241',4);
insert into customer values(	5	,'Sprint'	,'901-895-5547',5);
insert into customer values(	6	,'Exxon Mobile'	,'865-489-3699',6);



# Data loading #4 loading employee-table

INSERT INTO EMPLOYEE VALUES(	1	,'	Sexton'	,'M'	,'	Amy'	,'	2001/2/7'	,	1	);
	INSERT INTO EMPLOYEE VALUES(	2	,'	Craig'	,'M'	,'	Brad'	,'	2000/8/16'	,	3	);
	INSERT INTO EMPLOYEE VALUES(	3	,'	Sewell'	,'Z'	,'	Barb'	,'	2000/9/15'	,	4	);
	INSERT INTO EMPLOYEE VALUES(	4	,'	Williams'	,'R'	,'	Jordan'	,'	2000/4/7'	,	2	);
	INSERT INTO EMPLOYEE VALUES(	5	,'	Chandler'	,'E'	,'	Johnny'	,'	2001/6/12'	,	5	);
	INSERT INTO EMPLOYEE VALUES(	6	,'	Robbins'	,'E'	,'	Erin'	,'	2001/8/25'	,	6	);
	INSERT INTO EMPLOYEE VALUES(	7	,'	Burkhart'	,'C'	,'	Sam'	,'	2000/11/26'	,	1	);
	INSERT INTO EMPLOYEE VALUES(	8	,'	Yarbrough'	,'B'	,'	Peter'	,'	2001/1/9'	,	6	);
	INSERT INTO EMPLOYEE VALUES(	9	,'	Kattan'	,'N'	,'	Chris'	,'	2000/5/31'	,	2	);
	INSERT INTO EMPLOYEE VALUES(	10	,'	Pascoe'	,'L'	,'	Jonathan'	,'	2001/7/14'	,	3	);
	INSERT INTO EMPLOYEE VALUES(	11	,'	Bales'	,'D'	,'	Melissa'	,'	2001/9/16'	,	4	);
	INSERT INTO EMPLOYEE VALUES(	12	,'	Cope'	,'R'	,'	Leslie'	,'	1999/10/31'	,	5	);
	INSERT INTO EMPLOYEE VALUES(	13	,'	Bible'	,'M'	,'	Hanah'	,'	2000/6/8'	,	2	);
	INSERT INTO EMPLOYEE VALUES(	14	,'	Paine'	,'S'	,'	Brad'	,'	1999/5/9'	,	6	);
	INSERT INTO EMPLOYEE VALUES(	15	,'	Newton'	,'S'	,'	Christopher'	,'	2001/2/28'	,	3	);
	INSERT INTO EMPLOYEE VALUES(	16	,'	Smith'	,'A'	,'	Mary'	,'	1999/3/8'	,	1	);
	INSERT INTO EMPLOYEE VALUES(	17	,'	Underwood'	,'L'	,'	Trish'	,'	1998/10/21'	,	4	);
	INSERT INTO EMPLOYEE VALUES(	18	,'	Bender'	,'A'	,'	Larry'	,'	2000/8/9'	,	6	);
	INSERT INTO EMPLOYEE VALUES(	19	,'	Mudd'	,'T'	,'	Roger'	,'	1999/12/1'	,	5	);
	INSERT INTO EMPLOYEE VALUES(	20	,'	Kenyon'	,'D'	,'	Tiffany'	,'	2001/4/28'	,	2	);
	INSERT INTO EMPLOYEE VALUES(	21	,'	Ephanor'	,	NULL	,'	Victor'	,'	2000/3/2'	,	1	);
	INSERT INTO EMPLOYEE VALUES(	22	,'	Summers'	,	NULL	,'	Anna'	,'	1999/1/1'	,	1	);
	INSERT INTO EMPLOYEE VALUES(	23	,'	Smith'	,'F'	,'	Jose'	,'	1998/2/6'	,	1	);
	INSERT INTO EMPLOYEE VALUES(	24	,'	Rogers'	,'S'	,'	Adam'	,'	2000/4/6'	,	1	);
	INSERT INTO EMPLOYEE VALUES(	25	,'	Zebras'	,	NULL	,'	Steve'	,'	2000/4/5'	,	1	);
	INSERT INTO EMPLOYEE VALUES(	26	,'	Ellis'	,'R'	,'	Maria'	,'	2000/8/7'	,	1	);
	INSERT INTO EMPLOYEE VALUES(	27	,'	Duarte'	,	NULL	,'	Miriam'	,'	2000/12/3'	,	1	);
	INSERT INTO EMPLOYEE VALUES(	28	,'	Bush'	,	NULL	,'	Emily'	,'	1999/6/5'	,	1	);
	INSERT INTO EMPLOYEE VALUES(	29	,'	Kilby'	,'T'	,'	Surgena'	,'	2000/4/1'	,	1	);
	INSERT INTO EMPLOYEE VALUES(	30	,'	Connor'	,	NULL	,'	Sean'	,'	1998/4/15'	,	1	);


# Data loading #5 loading empskill-table


insert into empskill values(	1	,	1	);
insert into empskill values(	1	,	2	);
insert into empskill values(	2	,	3	);
insert into empskill values(	3	,	3	);
insert into empskill values(	4	,	1	);
insert into empskill values(	4	,	2	);
insert into empskill values(	5	,	4	);
insert into empskill values(	6	,	3	);
insert into empskill values(	6	,	4	);
insert into empskill values(	7	,	4	);
insert into empskill values(	8	,	5	);
insert into empskill values(	8	,	6	);
insert into empskill values(	8	,	19	);
insert into empskill values(	9	,	7	);
insert into empskill values(	9	,	8	);
insert into empskill values(	10	,	6	);
insert into empskill values(	10	,	18	);
insert into empskill values(	11	,	8	);
insert into empskill values(	12	,	9	);
insert into empskill values(	13	,	10	);
insert into empskill values(	14	,	23	);
insert into empskill values(	15	,	12	);
insert into empskill values(	15	,	14	);
insert into empskill values(	15	,	16	);
insert into empskill values(	15	,	17	);
insert into empskill values(	16	,	5	);
insert into empskill values(	16	,	17	);
insert into empskill values(	16	,	20	);
insert into empskill values(	16	,	21	);
insert into empskill values(	17	,	1	);
insert into empskill values(	18	,	22	);
insert into empskill values(	19	,	23	);
insert into empskill values(	20	,	23	);
insert into empskill values(	21	,	7	);
insert into empskill values(	21	,	8	);
insert into empskill values(	22	,	7	);
insert into empskill values(	23	,	9	);
insert into empskill values(	23	,	18	);
insert into empskill values(	23	,	19	);
insert into empskill values(	24	,	9	);
insert into empskill values(	24	,	10	);
insert into empskill values(	25	,	3	);
insert into empskill values(	25	,	11	);
insert into empskill values(	25	,	12	);
insert into empskill values(	26	,	7	);
insert into empskill values(	26	,	11	);
insert into empskill values(	27	,	13	);
insert into empskill values(	27	,	15	);
insert into empskill values(	27	,	16	);
insert into empskill values(	28	,	3	);
insert into empskill values(	28	,	13	);
insert into empskill values(	28	,	14	);
insert into empskill values(	28	,	15	);
insert into empskill values(	28	,	17	);
insert into empskill values(	28	,	20	);
insert into empskill values(	28	,	21	);
insert into empskill values(	29	,	22	);
insert into empskill values(	30	,	23	);


# Data loading #6 loading project-table

insert into project values(1, '2018/2/12', 1 ,'Sales ManagementSystem','2018/3/1','2018/7/1',15500,null,null,0,30);


# Data loading #7 loading task-table


insert into task values(	2	,	1	,'	Initial Interview'	,'	2018/3/1	','	2018/3/6	',	23	,	1	);
insert into task values(	3	,	1	,'	Initial Interview'	,'	2018/3/1	','	2018/3/6	',	4	,	1	);
insert into task values(	4	,	1	,'	Initial Interview'	,'	2018/3/1	','	2018/3/6	',	5	,	1	);
insert into task values(	5	,	1	,'	Database Design'	,'	2018/3/11	','	2018/3/15	',	5	,	1	);
insert into task values(	6	,	1	,'	System Design'	,'	2018/3/11	','	2018/4/12	',	4	,	1	);
insert into task values(	7	,	1	,'	System Design'	,'	2018/3/11	','	2018/4/12	',	3	,	2	);
insert into task values(	8	,	1	,'	Database Implementation'	,'	2018/3/18	','	2018/3/22	',	18	,	1	);
insert into task values(	9	,	1	,'	System Coding  & Testing'	,'	2018/3/25	','	2018/5/20	',	7	,	2	);
insert into task values(	10	,	1	,'	System Coding  & Testing'	,'	2018/3/25	','	2018/5/20	',	8	,	1	);
insert into task values(	11	,	1	,'	System Coding  & Testing'	,'	2018/3/25	','	2018/5/20	',	18	,	1	);
insert into task values(	12	,	1	,'	System Documentation'	,'	2018/3/25	','	2018/6/7	',	22	,	1	);
insert into task values(	13	,	1	,'	Final Evaluation'	,'	2018/6/10	','	2018/6/14	',	23	,	1	);
insert into task values(	14	,	1	,'	Final Evaluation'	,'	2018/6/10	','	2018/6/14	',	4	,	1	);
insert into task values(	15	,	1	,'	Final Evaluation'	,'	2018/6/10	','	2018/6/14	',	5	,	1	);
insert into task values(	16	,	1	,'	Final Evaluation'	,'	2018/6/10	','	2018/6/14	',	8	,	1	);
insert into task values(	17	,	1	,'	On-Site System On-line and Data Loading'	,'	2018/6/17	','	2018/6/21	',	23	,	1	);
insert into task values(	18	,	1	,'	On-Site System On-line and Data Loading'	,'	2018/6/17	','	2018/6/21	',	4	,	1	);
insert into task values(	19	,	1	,'	On-Site System On-line and Data Loading'	,'	2018/6/17	','	2018/6/21	',	5	,	1	);
insert into task values(	20	,	1	,'	On-Site System On-line and Data Loading'	,'	2018/6/17	','	2018/6/21	',	8	,	1	);
insert into task values(	21	,	1	,'	Sign Off'	,'	2018/7/1	','	2018/7/1	',	23	,	1	);


# Data loading #8 loading task-table

insert into assign values(	6	,	2	,	30	,'	2018/3/1	','	2018/3/6'		);
insert into assign values(	7	,	3	,	7	,'	2018/3/1	','	2018/3/6'		);
insert into assign values(	8	,	4	,	16	,'	2018/3/1	','	2018/3/6'		);
insert into assign values(	9	,	5	,	16	,'	2018/3/11	','	2018/3/14'		);
insert into assign values(	10	,	6	,	7	,'	2018/3/11	',	null		);
insert into assign values(	11	,	7	,	28	,'	2018/3/11	',	null		);
insert into assign values(	12	,	7	,	25	,'	2018/3/11	',	null		);
insert into assign values(	13	,	8	,	23	,'	2018/3/15	','	2018/3/19'		);
insert into assign values(	14	,	9	,	22	,'	2018/3/21	',	null		);
insert into assign values(	15	,	9	,	26	,'	2018/3/21	',	null		);
insert into assign values(	16	,	10	,	21	,'	2018/3/21	',	null		);
insert into assign values(	17	,	11	,	23	,'	2018/3/21	',  null		);
insert into assign values(	18	,	12	,	29	,'	2018/3/25	',  null		);


# Data loading #9 loading bill-table

insert into bill values(	1	,'2018/3/15'	,1	);

# Data loading #10 loading worklog-table


insert into worklog values(	3	,	6	,'	2018/3/1	',	4	,	1	);
insert into worklog values(	4	,	7	,'	2018/3/1	',	4	,	1	);
insert into worklog values(	5	,	8	,'	2018/3/1	',	4	,	1	);
insert into worklog values(	6	,	7	,'	2018/3/8	',	24	,	1	);
insert into worklog values(	7	,	6	,'	2018/3/8	',	24	,	1	);
insert into worklog values(	8	,	8	,'	2018/3/8	',	24	,	1	);
insert into worklog values(	9	,	10	,'	2018/3/15	',	40	,	1	);
insert into worklog values(	10	,	11	,'	2018/3/15	',	40	,	1	);
insert into worklog values(	11	,	13	,'	2018/3/15	',	6	,	1	);
insert into worklog values(	12	,	9	,'	2018/3/15	',	32	,	1	);
insert into worklog values(	13	,	12	,'	2018/3/15	',	35	,	1	);
insert into worklog values(	14	,	10	,'	2018/3/22	',	40	,	null	);
insert into worklog values(	15	,	11	,'	2018/3/22	',	40	,	null	);
insert into worklog values(	16	,	15	,'	2018/3/22	',	12	,	null	);
insert into worklog values(	17	,	16	,'	2018/3/22	',	12	,	null	);
insert into worklog values(	18	,	13	,'	2018/3/22	',	12	,	null	);
insert into worklog values(	19	,	17	,'	2018/3/22	',	12	,	null	);
insert into worklog values(	20	,	14	,'	2018/3/22	',	12	,	null	);
insert into worklog values(	21	,	12	,'	2018/3/22	',	35	,	null	);
insert into worklog values(	22	,	10	,'	2018/3/29	',	40	,	null	);
insert into worklog values(	23	,	11	,'	2018/3/29	',	40	,	null	);
insert into worklog values(	24	,	15	,'	2018/3/29	',	35	,	null	);
insert into worklog values(	25	,	16	,'	2018/3/29	',	35	,	null	);
insert into worklog values(	26	,	18	,'	2018/3/29	',	40	,	null	);
insert into worklog values(	27	,	17	,'	2018/3/29	',	35	,	null	);
insert into worklog values(	28	,	14	,'	2018/3/29	',	35	,	null	);
insert into worklog values(	29	,	12	,'	2018/3/29	',	35	,	null	);




use mic;

#a) Write a query to display the project tasks the scheduled start and end dates and the number of employees 
#required to complete each task.
select task_id, task_begindate ,task_enddate ,task_quantity 
from task;
 


#b) Write a query to display all employees (last and first name), employee hire date and skill description in 
#each region. Sort by skill description within each region.
select emp_lname ,emp_fname ,emp_hiredate ,skill_description ,region_name
from employee e join empskill es on e.emp_id = es.emp_id 
join skill s on es.skill_id = s.skill_id 
join region r on e.region_id = r.region_id 
order by region_name, skill_description;
 









#c) Write a query to display an inventory of the skills. Display a list of the skills and each employee (last and 
#first name) having each skill. Sort by skill description.
select skill_description, emp_lname ,emp_fname 
from employee e join empskill es on e.emp_id = es.emp_id 
join skill s on es.skill_id = s.skill_id 
order by skill_description;
 

#d) Write a query to display total weekly hours in the work log. Display by week total number of hours 
#worked by all employees.
select wlog_date ,sum(wlog_hours) as total_weekly_hours
from worklog
group by wlog_date;
 




#e) Write a query to display the total work log amount billed for each employee. Display the total dollar 
#amount to be billed for each employee. Include employee name (last and first), total hours worked, task, 
#skill description, skill rate of pay, and total amount. Group by task and display total dollar amount in 
#descending order.
select emp_lname ,emp_fname , total_hours_worked, t.task_id, skill_description, skill_rate, skill_rate*total_hours_worked as total_dollar_amount
from employee e join assign a on e.emp_id = a.emp_id 
join empskill es on a.emp_id = es.emp_id 
join skill s on es.skill_id = s.skill_id 
join task t on a.task_id  = t.task_id 
join (select w.assign_id ,sum(wlog_hours) as total_hours_worked
      from worklog w join assign a on w.assign_id = a.assign_id 
      join task t on a.task_id = t.task_id 
      join skill s on t.skill_id = s.skill_id 
      group by w.assign_id
      ) thw on thw.assign_id = a.assign_id 
group by a.assign_id
order by t.task_description, total_dollar_amount desc;
 

#f) Write a query to display all the customers in each region. Sort by region then customer.
select cust_name ,region_name
from customer c join region r on c.region_id = r.region_id 
order by region_name, cust_name;
 




#g) Write a query to display the total number of employees by skill description in each region.
select region_name, skill_description, count(e.emp_id) as Total_number_of_emp
from employee e join region r on e.region_id = r.region_id 
join empskill em on e.emp_id = em.emp_id 
join skill s on em.skill_id = s.skill_id 
group by s.skill_id ,r.region_id 
order by r.region_name;
 

#h) Write a query to display all tasks for the project. Include the task scheduled start and end dates, required 
#skills description, employee last and first names, and actual assigned start and end dates. Order by 
#scheduled start dates.
select t.task_id ,task_begindate ,task_enddate , skill_description, emp_lname, emp_fname, assign_begindate, assign_enddate  
from task t join skill s on t.skill_id = s.skill_id 
join assign a on t.task_id = a.task_id 
join employee e on e.emp_id = a.emp_id 
order by task_begindate;
 







#i) Write a query to display the employees, dates worked, hours worked, assignment, task description, and 
#skill description for each bill. Sort by task description.
select e.emp_id, task_begindate ,task_enddate, hours_worked, a.assign_id, task_description, skill_description
from employee e join assign a on e.emp_id = a.emp_id 
join task t on a.task_id = t.task_id 
join skill s on t.skill_id = s.skill_id 
join (select assign_id ,sum(wlog_hours) as hours_worked
      from worklog
      group by assign_id
      ) hw on hw.assign_id = a.assign_id 
order by task_description;
 

#j) Write a query to display the total hours worked and total amount billed for the project.
select sum(total_hours_worked) as total_hours_worked, sum(total_hours_worked*skill_rate) as project_total_amount_billed
from (select task_quantity, w.assign_id ,skill_rate ,sum(wlog_hours) as total_hours_worked
      from worklog w join assign a on w.assign_id = a.assign_id 
      join task t on a.task_id = t.task_id 
      join skill s on t.skill_id = s.skill_id 
      group by w.assign_id
      )s;
      

#k) Write a query to display all employees (first and last name) on the project with more than 2 years’ 
#experience as of January 1, 2002. 
select concat(emp_lname, '', emp_fname) as emp_name
from employee 
where datediff('2002-1-1',emp_hiredate) > 730; 
 

#l) Write a query to display all employees by region. Include region description, employee name (first and 
#last), and employee hire date. Group by region.
select region_name , emp_lname ,emp_fname , emp_hiredate 
from employee e join region r on e.region_id = r.region_id 
group by e.emp_id;
 

#m) Write a SELECT statement using a DATE/TIME function.
select task_description, date(task_begindate)
from task
where task_begindate = '2018-03-11';
 

#n) Write an INSERT statement.
insert into employee(emp_id, emp_lname, emp_mi, emp_fname, emp_hiredate, region_id)
values (31, 'Park', null, 'Peter', '2003-01-01', 1);
 
#o) Write an UPDATE statement.
update employee 
set emp_mi = 'D'
where emp_id = 31;
 

#p) Write a DELETE statement.
delete from employee 
where emp_id = 31;
 

#q) Write a trigger to update the work-log entries when a bill is written and sent to the customer for the total hours 
#worked on the project during that period.
delimiter $

create trigger trg_updateworklog
after insert on bill 
for each row
begin 
	update worklog 
	set bill_id = new.bill_id
	where wlog_date = bill_date;
end $

delimiter ;




