/*
	Created by Cici Carter
	02-24-2017 
	(to replace SelectReportByMonth)
*/

Create Proc SelectReport
as
begin
	select v.LastName, v.FirstName, vt.VolunteerTypeDescr, c.CenterName, vl.DateTimeLogged, 
	t.TaskDescr, vl.NumberMinutes, t.PricePerMinute, vl.NumberMinutes * t.PricePerMinute TotalValue,
	v.VolunteerID, t.TaskID, c.CenterID, vt.VolunteerTypeID
	from VolunteerLog vl
	join Volunteer v on v.VolunteerID=vl.VolunteerID
	join Task t on t.TaskID=vl.TaskID
	join Center c on c.CenterID=vl.CenterID
	join VolunteerType vt on vt.VolunteerTypeID=v.VolunteerTypeID
end