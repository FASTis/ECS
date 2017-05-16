Create Procedure GetUserByVolunteerId(
@volunteerId int
)
-- exec GetUserByVolunteerId 1
as
begin

	declare @isAdmin bit
	set @isAdmin = 0
	if exists (select 1 from Staff s join UserLogon u on s.VolunteerID=u.VolunteerID where u.VolunteerID= @volunteerId)
		set @isAdmin=1

	select v.VolunteerID, FirstName, LastName, v.VolunteerTypeID, vt.VolunteerTypeDescr, 
	c.CompanyID, c.CompanyName, v.Last4DigitsOfPhone, u.UserID, u.PIN, @isAdmin IsAdmin
	from Volunteer v 
	join VolunteerType vt on v.VolunteerTypeID=vt.VolunteerTypeID
	left join Company c on v.CompanyID=c.CompanyID
	join UserLogon u on v.VolunteerID=u.VolunteerID
	where u.VolunteerID=@volunteerId

end

GO


