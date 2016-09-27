/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Create and populate lookup table.
=================================================
*/

Create Table Task
(
	 TaskID integer identity(1,1)
	,TaskDescr varchar(50)
	,PricePerMinute decimal(18,2)
	,RestrictToVolunteerTypes varchar(5)
	,PRIMARY KEY (TaskID)
);

Insert Task(TaskDescr, PricePerMinute, RestrictToVolunteerTypes)
Select 'Classroom (Teacher)',0.23,null
Union Select 'Kitchen Aide',(11.69/60),null
Union Select 'Program Assistant',(14.62/60),null
Union Select 'Facilities',(21.42/60),null
Union Select 'Gardening',(24.07/60),null
Union Select 'Home-based Curriculum',0.28,'1'
Union Select 'At-home Activity',0.23,'1,2'
Union Select 'UNF Psychology Intern',(20.67/60),null;