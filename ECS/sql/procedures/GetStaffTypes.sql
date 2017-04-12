/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Gets all staff types.
================================================
*/

Create Procedure GetStaffTypes
as

begin
		select StaffTypeId
			 , StaffTypeDescr
		from StaffType		
end