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
	 VolunteerID integer
	,StaffTypeID integer
	,Active bit
	,PRIMARY KEY (VolunteerID, StaffTypeID)
);