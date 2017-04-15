Create Procedure AddCenter
(
	 @centerName varchar(25)
	,@streetAddr varchar(25)
	,@city varchar(4)
	,@zip varchar(25)
)

as

begin

	INSERT dbo.Center (CenterName, StreetAddress, City, Zip, Active)
	VALUES (@centerName, @streetAddr, @city, @zip, 1)
		
end
GO
