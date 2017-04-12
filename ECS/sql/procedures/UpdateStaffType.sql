/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Updates a staff type.
================================================
*/

Create Procedure UpdateStaffType
(
	 @StaffTypeDescr varchar(25)
	,@StaffTypeId varchar(25)
)

as

begin
		Update	StaffType
		Set		StaffTypeDescr=@StaffTypeDescr
		WHERE	StaffTypeId=@StaffTypeId
end