create procedure GetChildByChildID (@childId int)
as

begin

	select ChildId, FirstName, LastName, DOB
	from Child
	where ChildID=@childId
end