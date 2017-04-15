Create Procedure GetChildrenByVolunteerID
(@volunteerId int)
as
begin
	select c.ChildID, c.LastName+', '+c.FirstName Child
    from Child c join Family f on c.ChildID=f.FamilyID
    where f.VolunteerID=@volunteerId
end