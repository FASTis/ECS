Create Procedure GetCenterForID
(
	 @CenterId varchar(25)
)

as

begin
		SELECT	CenterName, StreetAddress, City, Zip
		FROM	Center
		WHERE	CenterID=@CenterId
end
GO


