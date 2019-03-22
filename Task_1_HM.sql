create database Task_1_HM
	
use Task_1_HM


create table Manager
(
ManagerID int primary key identity(1,1),	
ManagerName varchar(100),
ManagerEmail varchar(100),
ManagerPassword varchar(100)
)

create table Project
(
ProjectID int primary key identity(1001,1),
ProjectName varchar(100),
ProjectTechnologies varchar(100),
ProjectDuration varchar(100),
ProjectStartDate datetime,
ProjectEndDate datetime
)
drop table Employee

create table Employee	
(
EmployeeID int primary key identity(101,1),
EmployeeName varchar(100),
EmployeeExperience varchar(100),
EmployeeTechnologies varchar(100),
EmployeeJoiningDate datetime
)

select * from Employee

create table Allocate
(
ManagerName varchar(100),
ProjectName varchar(100),
EmployeeID int
)

drop table Allocate

select * from Manager
select * from Project
select * from Employee
select * from Allocate

create proc log_in(@email varchar(100),@password varchar(100))
as
begin
select ManagerEmail,ManagerPassword from Manager where ManagerEmail=@email and ManagerPassword=@password
end


alter proc add_manager(@name varchar(100),@email varchar(100),@password varchar(100))
as
begin
insert Manager values(@name,@email,@password)
end

alter proc add_project(@pname varchar(100),@ptechnologies varchar(100),@pduration varchar(100),@pstartdate datetime,@penddate datetime)
as
begin
insert Project values(@pname,@ptechnologies,@pduration,@pstartdate,@penddate)
end

alter proc add_employee(@name varchar(100),@experience varchar(100),@technologies varchar(100),@joiningdate datetime)
as
begin
insert Employee values(@name,@experience,@technologies,@joiningdate)
end	

alter proc allocate_proj(@mname varchar(100),@pname varchar(100),@eid int)
as
begin
insert Allocate values(@mname,@pname,@eid)
end

create proc view_projects
as
begin
select * from Project
end

create proc view_employees
as
begin
select * from Employee
end

create proc view_allocprj
as
begin
select * from Allocate
end

alter proc disallocate_proj(@id int)
as
begin
delete from Allocate where EmployeeID = @id
end


create proc view_prjid
as
begin
select ProjectName from Project 
end

create proc view_emplid
as
begin
select EmployeeID from Employee 
end

delete from Manager where ManagerID=8