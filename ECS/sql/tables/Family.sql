/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Stores parent-child map.
=================================================
*/

Create Table Family
(
	 FamilyID integer identity(1,1) not null
	,ChildID integer not null
	,VolunteerID integer null
	,Descr varchar(20) null -- father, mother, step-father, grandmother, etc.
	,Active bit NULL CONSTRAINT [DF_Family_Active]  DEFAULT (1)
	,PRIMARY KEY (FamilyID, ChildID)
);