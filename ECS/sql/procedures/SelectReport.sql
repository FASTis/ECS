/*
	Created by Cici Carter
	02-24-2017 
	(to replace SelectReportByMonth)
*/

Create Proc SelectReport
as
begin
	select v.LastName + ', ' + v.FirstName Volunteer, vt.VolunteerTypeDescr, c.CenterName, vl.DateTimeLogged, 
	t.TaskDescr, ch.LastName + ', ' + ch.FirstName Child, vl.NumberMinutes, t.PricePerMinute, vl.NumberMinutes * t.PricePerMinute TotalValue,
	v.VolunteerID, t.TaskID, c.CenterID, vt.VolunteerTypeID,
	ch.ChildId -- added for Parent volunteers
	from VolunteerLog vl
	join Volunteer v on v.VolunteerID=vl.VolunteerID
	join Task t on t.TaskID=vl.TaskID
	join Center c on c.CenterID=vl.CenterID
	join VolunteerType vt on vt.VolunteerTypeID=v.VolunteerTypeID
	left join Family f on f.VolunteerID=v.VolunteerID
	left join Child ch on ch.ChildID=f.ChildID
end