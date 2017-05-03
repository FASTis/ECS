Create Procedure SelectTask
as
begin
	Select TaskID, TaskDescr, PricePerMinute, PricePerMinute * 60 as PricePerHour, RestrictToVolunteerTypes from Task
	Order By TaskDescr
end
go