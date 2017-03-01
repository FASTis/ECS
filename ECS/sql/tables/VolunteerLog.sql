/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Stores volunteer time logged.
=================================================
*/

Create Table VolunteerLog
(
	 VolunteerLogID integer identity(1,1)
	,VolunteerID integer
	,TaskID integer
	,CenterID integer
	,ChildID integer
	,NumberMinutes integer
	,DateTimeLogged datetime not null
	,SignatureReceived bit
	,Active bit
	,PRIMARY KEY (VolunteerLogID)
);