CREATE Procedure [dbo].[SelectAllUsers]
-- exec SelectAllUsers -- Cici Carter
as
begin

	select v.VolunteerID, FirstName, LastName, VolunteerTypeDescr, CompanyName, Last4DigitsOfPhone, UserID
	from dbo.Volunteer v 
	join dbo.VolunteerType vt on v.VolunteerTypeID=vt.VolunteerTypeID
	left join dbo.Company c on v.CompanyID=c.CompanyID
	join dbo.UserLogon u on v.VolunteerID=u.VolunteerID
	
end

GO


