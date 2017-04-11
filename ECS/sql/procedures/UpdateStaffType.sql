Create Procedure UpdateStaffType
(
	 @StaffTypeDescr varchar(25)
	,@StaffTypeId varchar(25)
)

as

begin
		Update	StaffType
		Set		StaffTypeDescr=@StaffTypeDescr
		WHERE	StaffTypeId=@StaffTypeId
end