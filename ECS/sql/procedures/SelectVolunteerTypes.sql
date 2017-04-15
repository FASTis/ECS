/*
================================================
Author:      	Cici Carter
Create date:    09/26/2016
Description:    Returns all volunteer types.
================================================
*/

Create Procedure SelectVolunteerTypes 
as
begin
	Select VolunteerTypeID, VolunteerTypeDescr from VolunteerType
	where Active=1
end
go
