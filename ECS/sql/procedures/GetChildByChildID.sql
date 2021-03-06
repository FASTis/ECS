drop procedure GetChildByChildID
go

create procedure GetChildByChildID (@childId int, @volId int)
as

begin

	select c.ChildId, c.FirstName, c.LastName, c.DOB, f.Descr Relationship
	from Child c join Family f on c.ChildId=f.ChildId
	where c.ChildID=@childId and f.VolunteerId=@volId
end

go