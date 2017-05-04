/*
	Created by Cici Carter (with Tillman Chen)
	02-11-2017
*/

Create Proc SelectReportForMonth(@monthNum integer)
as
begin

	select v.FirstName, v.LastName, c.CenterName, vl.DateTimeLogged, vl.NumberMinutes, t.TaskDescr, t.PricePerMinute,
	vl.VolunteerID, vl.TaskID, vl.CenterID
	from VolunteerLog vl
	join Volunteer v on v.VolunteerID=vl.VolunteerID
	join Task t on t.TaskID=vl.TaskID
	join Center c on c.CenterID=vl.CenterID
	where DATEPART(m, vl.DateTimeLogged) = @monthNum
end

go