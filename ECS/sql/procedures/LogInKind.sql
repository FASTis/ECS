Create Procedure LogInKind
(
	   @volunteerId integer
	 , @childId integer
	 , @taskId integer
	 , @centerId integer
	 , @numHrs integer
	 , @numMins integer
)

as

begin
		Insert VolunteerLog (VolunteerId, ChildId, TaskId, CenterId, NumberMinutes) 
		Values (@volunteerId, @childId, @taskId, @centerId, @totalMinutes) 

end