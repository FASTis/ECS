/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Logs volunteer hours.
================================================
*/

Create Procedure LogInKind
(
	   @volunteerId integer
	 , @childId integer
	 , @taskId integer
	 , @centerId integer
	 , @totalMinutes integer
)

as

begin
		Insert VolunteerLog (VolunteerId, ChildId, TaskId, CenterId, NumberMinutes) 
		Values (@volunteerId, @childId, @taskId, @centerId, @totalMinutes) 

end