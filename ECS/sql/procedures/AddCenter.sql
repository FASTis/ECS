Create Procedure AddCenter
(	-- Make sure lengths match the table!
	 @centerName varchar(50)
	,@streetAddr varchar(50)
	,@city varchar(30)
	,@zip varchar(5)
)

as

begin

	INSERT dbo.Center (CenterName, StreetAddress, City, Zip, Active)
	VALUES (@centerName, @streetAddr, @city, @zip, 1)
		
end
GO
