Create Procedure AddVolunteerType
(
	 @VolunteerTypeDescr varchar(25)
)

as

begin
		Insert	VolunteerType (VolunteerTypeDescr)
		Values  (@VolunteerTypeDescr)
end
GO

