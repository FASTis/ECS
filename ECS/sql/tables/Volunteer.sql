/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Stores volunteer information.
=================================================
*/

Create Table Volunteer
(
	 VolunteerID integer identity(1,1)
	,FirstName varchar(30)
	,LastName varchar(30)
	,VolunteerTypeID integer
	,CompanyID integer
	,Last4DigitsOfPhone varchar(4)
	,PRIMARY KEY (VolunteerID)
);