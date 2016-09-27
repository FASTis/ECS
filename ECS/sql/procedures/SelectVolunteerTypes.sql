/*
================================================
Author:      	Cici Carter
Create date:    09/26/2016
Description:    Returns all volunteer types.
================================================
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure SelectVolunteerTypes 
as
begin
	Select VolunteerTypeID, VolunteerTypeDescr from VolunteerType
end
go