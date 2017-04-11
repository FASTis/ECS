Create Procedure GetStaffTypeForID
(
	 @StaffTypeId varchar(25)
)

as

begin
		SELECT	StaffTypeDescr
		FROM	StaffType
		WHERE	StaffTypeId=@StaffTypeId
end