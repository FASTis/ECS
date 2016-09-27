/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Stores child information.
=================================================
*/

Create Table Child
(
	 ChildID integer identity(1,1)
	,FirstName varchar(30)
	,LastName varchar(30)
	,DOB datetime
	,PRIMARY KEY (ChildID)
);