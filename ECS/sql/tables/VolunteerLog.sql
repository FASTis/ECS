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
	,NumberMinutes integer
	,PRIMARY KEY (VolunteerLogID)
);