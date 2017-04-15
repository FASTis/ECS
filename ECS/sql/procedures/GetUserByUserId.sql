/*
================================================
Author:      	Cici Carter
Create date:    09/25/2016
Description:    Returns info for specified user.

4/15/2017 - Added IsAdmin flag.
================================================
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure GetUserByUserId(
@UserId          varchar(20)
)
-- exec GetUserByUserId 'ccarter'
-- exec GetUserByUserId 'jdoe'
as
begin

	declare @isAdmin bit
	set @isAdmin = 0
	if exists (select 1 from Staff s join UserLogon u on s.VolunteerID=u.VolunteerID where u.UserID= @UserId)
		set @isAdmin=1

	select v.VolunteerID, FirstName, LastName, v.VolunteerTypeID, vt.VolunteerTypeDescr, 
	c.CompanyID, c.CompanyName, v.Last4DigitsOfPhone, u.UserID, u.PIN, @isAdmin IsAdmin
	from dbo.Volunteer v 
	join dbo.VolunteerType vt on v.VolunteerTypeID=vt.VolunteerTypeID
	left join dbo.Company c on v.CompanyID=c.CompanyID
	join dbo.UserLogon u on v.VolunteerID=u.VolunteerID
	where UserID=@UserId

end
go