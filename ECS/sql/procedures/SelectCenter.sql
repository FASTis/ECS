SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure SelectCenter
as
begin
	Select CenterID, CenterName, StreetAddress, City, Zip from Center
end
go