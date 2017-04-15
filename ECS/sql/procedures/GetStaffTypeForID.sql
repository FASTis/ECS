/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Gets staff type descr for id.

4/15/2017 - Added Active flag.
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
		AND		Active=1
end