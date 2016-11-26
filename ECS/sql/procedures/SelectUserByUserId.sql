/*
================================================
Author:      	Cici Carter
Create date:    09/25/2016
Description:    Returns info for specified user.
================================================
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure SelectUserByUserId(
@UserId          varchar(20)
)
-- exec SelectUserByUserId 'ccarter'
as
begin

	select v.VolunteerID, FirstName, LastName, VolunteerTypeDescr, CompanyName, Last4DigitsOfPhone, UserID, PIN
	from dbo.Volunteer v 
	join dbo.VolunteerType vt on v.VolunteerTypeID=vt.VolunteerTypeID
	left join dbo.Company c on v.CompanyID=c.CompanyID
	join dbo.UserLogon u on v.VolunteerID=u.VolunteerID
	where UserID=@UserId

end
go