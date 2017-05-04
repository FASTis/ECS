/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Stores center staff IDs.

4/15/2017 Modified to implement Admin functionality.
=================================================
*/

Create Table Staff
(
	 VolunteerID integer not null
	,StaffTypeID integer not null
	,Active bit null constraint DF_STAFF_ACTIVE default (1)
	,PRIMARY KEY (VolunteerID, StaffTypeID)
);
