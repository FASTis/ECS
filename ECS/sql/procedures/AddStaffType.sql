Create Procedure AddStaffType
(
	 @StaffTypeDescr varchar(25)
)

as

begin
		Insert	StaffType (StaffTypeDescr)
		Values  (@StaffTypeDescr)
end