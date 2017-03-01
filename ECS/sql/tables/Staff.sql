/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Stores center staff information.
=================================================
*/

Create Table Staff
(
	 StaffID integer identity(1,1)
	,FirstName varchar(30)
	,LastName varchar(30)
	,StaffTypeID integer
	,Active bit
	,PRIMARY KEY (StaffID)
);