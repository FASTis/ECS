Create Procedure UpdateVolunteerType
(@volunteerTypeId int,
 @volunteerTypeDescr varchar(50)
 )
 as

 begin
	Update VolunteerType 
	set VolunteerTypeDescr=@volunteerTypeDescr
	where VolunteerTypeID=@volunteerTypeId
 end
 go