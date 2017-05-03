/*
=============================================
Author:      	Ashley Darling (checked in by Cici on date below)
Create date:    05/03/2017
Description:    Determines if info provided is valid.
=============================================
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure ValidateUserInfo(
  @UserId varchar(20)
, @Last4DigitsOfPhone    varchar(4)
)
as
begin
	declare @ct int, @retVal int
	
	select @ct=count(1) from UserLogon u
	join Volunteer v on u.VolunteerID=v.VolunteerId
	where u.UserID=@UserId and v.Last4DigitsOfPhone=@Last4DigitsOfPhone

	if @ct > 0
		set @retVal=1
	else
		set @retVal=0

	select @retVal ReturnValue
end
go