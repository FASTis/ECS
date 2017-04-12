/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Adds a staff type.
================================================
*/
Create Procedure AddStaffType
(
	 @StaffTypeDescr varchar(25)
)

as

begin
		Insert	StaffType (StaffTypeDescr)
		Values  (@StaffTypeDescr)
end