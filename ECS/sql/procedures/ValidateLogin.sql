/*
=============================================
Author:      	Cici Carter
Create date:    09/25/2016
Description:    Determines if login is valid.
=============================================
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure ValidateLogin(
  @UserId varchar(20)
, @PIN    varchar(4)
)
as
begin
	declare @ct int, @retVal int
	
	select @ct=count(1) from dbo.UserLogon where UserID=@UserId and PIN=@PIN

	if @ct > 0
		set @retVal=1
	else
		set @retVal=0

	select @retVal ReturnValue
end
go