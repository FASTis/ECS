CREATE Procedure [dbo].[SelectAllUsers]
-- exec SelectAllUsers -- Cici Carter
as
begin

	select v.VolunteerID, FirstName, LastName, v.VolunteerTypeID, vt.VolunteerTypeDescr, 
	c.CompanyID, c.CompanyName, v.Last4DigitsOfPhone, u.UserID, u.PIN
	from dbo.Volunteer v 
	join dbo.VolunteerType vt on v.VolunteerTypeID=vt.VolunteerTypeID
	left join dbo.Company c on v.CompanyID=c.CompanyID
	join dbo.UserLogon u on v.VolunteerID=u.VolunteerID
	where v.Active=1
	order by LastName
	
end

GO


