
Create Procedure GetHoursForPeriodAndVolunteerID (@startDate datetime, @endDate datetime, @VolunteerId int)
As
/*
GetHoursForPeriodAndVolunteerID '3/1/2017','4/1/2017',4

declare @startDate datetime, @endDate datetime, @VolunteerId int
set @startDate='3/1/2017'
set @endDate='4/1/2017'
set @VolunteerId=4
*/
BEGIN
	select isnull(convert(decimal(18,2), sum(vl.NumberMinutes)/60.00),0.00) HoursForPeriod
	from VolunteerLog vl
	join Volunteer v on v.VolunteerID=vl.VolunteerID
	join VolunteerType vt on v.VolunteerTypeID=vt.VolunteerTypeID
	where vl.TaskId not in (1,5)
	and vl.DateTimeLogged between @startDate and @endDate
	and v.VolunteerId=@volunteerId
END