/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Create and populate lookup table.
=================================================
*/

Create Table VolunteerType
(
	 VolunteerTypeID integer identity(1,1)
	,VolunteerTypeDescr varchar(50)
	,Active bit
	,PRIMARY KEY (VolunteerTypeID)
);

Insert VolunteerType(VolunteerTypeDescr)
Values ('Parent/Guardian');
Insert VolunteerType(VolunteerTypeDescr)
Values ('Former Parent/Guardian');
Insert VolunteerType(VolunteerTypeDescr)
Values ('Professional Services Volunteer');