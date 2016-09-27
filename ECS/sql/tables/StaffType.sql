/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Create and populate lookup table.
=================================================
*/

Create Table StaffType
(
	 StaffTypeID integer identity(1,1)
	,StaffTypeDescr varchar(30)
	,PRIMARY KEY (StaffTypeID)
);

Insert StaffType(StaffTypeDescr)
Select  'Center Management' 
Union Select  'Family Advocate'   
Union Select  'Program Assistant' 
Union Select  'System Admin';