create procedure AddChild ( 
	  @volunteerID int
	, @childFName varchar(30)
	, @childLName varchar(30)
	, @dob datetime
	, @relationship varchar(20) -- Relationship of child to volunteer.
	)
as
-- AddChild 2, 'Lisa','Carter','3/29/2014','Child'
-- GetChildrenByVolunteerID 2
begin

	declare @familyID int
	declare @childID int

	insert Child (FirstName, LastName, DOB)
	values (@childFName, @childLName, @dob)

	set @childID=SCOPE_IDENTITY() -- to get the ID of the row just created.

	-- does this volunteer currently exist in the family table?
	select  @familyID=FamilyID from Family where VolunteerID=@volunteerID

	-- if volunteer does not exist, create a unique id for this volunteer.
	if (isnull(@familyID,0) = 0)
		select @familyID=isnull(max(FamilyID),0)+1 from Family
	
	-- insert record into Family table to join child to volunteer
	SET IDENTITY_INSERT Family ON
	insert Family (FamilyID, ChildID, VolunteerID, Descr)
	values (@familyID, @childID, @volunteerID, @relationship)
	SET IDENTITY_INSERT Family OFF
end

GO