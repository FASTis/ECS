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
	 , @logDate datetime
)

as

begin
		Insert VolunteerLog (VolunteerId, ChildId, TaskId, CenterId, NumberMinutes, DateTimeLogged, SignatureReceived) 
		Values (@volunteerId, @childId, @taskId, @centerId, @totalMinutes, @logDate, 1) 

end