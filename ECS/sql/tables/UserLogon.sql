/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Stores login information.
=================================================
*/

Create Table UserLogon
(
	 UserID varchar(20)
	,PIN varchar(4)
	,VolunteerID integer
	,StaffID integer
	,PRIMARY KEY (UserID)
);