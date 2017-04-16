Create Procedure GetChildrenByVolunteerID
(@volunteerId int)
as
begin
	select c.ChildID, c.LastName+', '+c.FirstName Child, c.DOB
    from Child c join Family f on c.ChildID=f.ChildID
    where f.VolunteerID=@volunteerId
end