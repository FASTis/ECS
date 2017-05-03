/*
	Created by Cici Carter
	02-24-2017 
	(to replace SelectReportByMonth; used by RunReports.aspx)

	03-01-2017 - Ccarter - modified to add parameters

	05-03-2017 - Ccarter - fixed bug (may not have checked in the update before)
*/

Create Proc SelectReport
(
 @MonthNum int,
 @TaskID int,
 @VolunteerTypeID int,
 @CenterID int
 )
 -- SelectReport 2, 0, 0, 1
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
	left join Child ch on vl.ChildID=ch.ChildID
	where	(@MonthNum = 0 or (datepart(month, vl.DateTimeLogged)=@MonthNum))
		and (@TaskID = 0 or t.TaskID=@TaskID)
		and (@VolunteerTypeID = 0 or vt.VolunteerTypeID=@VolunteerTypeID)
		and (@CenterID = 0 or c.CenterID=@CenterID)
end