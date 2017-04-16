create procedure UpdateChild ( 
	  @childID int
	, @childFName varchar(30)
	, @childLName varchar(30)
	, @dob datetime
	)
as

begin

	update Child set FirstName=@childFName, LastName=@childLName, DOB=@dob
	where ChildID=@childID

end
