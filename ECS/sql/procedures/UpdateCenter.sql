Create Procedure UpdateCenter
(
	 @centerID int
	,@centerName varchar(25)
	,@streetAddr varchar(25)
	,@city varchar(4)
	,@zip varchar(25)
)

as

begin

	UPDATE dbo.Center
	   SET CenterName = @centerName
		  ,StreetAddress = @streetAddr
		  ,City = @city
		  ,Zip = @zip
	 WHERE CenterID=@centerID
		
end
GO


