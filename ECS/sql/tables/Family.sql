/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Stores parent-child map.
=================================================
*/

Create Table Family
(
	 FamilyID integer identity(1,1)
	,ChildID integer
	,VolunteerID integer
	,Descr varchar(20) -- father, mother, step-father, grandmother, etc.
	,PRIMARY KEY (FamilyID, ChildID)
);