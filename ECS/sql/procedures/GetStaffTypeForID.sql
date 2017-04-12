/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Gets staff type descr for id.
================================================
*/

Create Procedure GetStaffTypeForID
(
	 @StaffTypeId varchar(25)
)

as

begin
		SELECT	StaffTypeDescr
		FROM	StaffType
		WHERE	StaffTypeId=@StaffTypeId
end