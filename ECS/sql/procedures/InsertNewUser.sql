/*
=============================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Inserts new user into db.
=============================================
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure InsertNewUser(
  @FirstName       varchar(30)
, @LastName        varchar(30)
, @VolunteerTypeID int
, @CompanyID       int
, @Last4Digits     varchar(4)
, @UserId          varchar(20)
, @PIN             varchar(4)
)
-- exec InsertNewUser 'Cici','Carter',3,3,'3909','ccarter','0825'
as
begin
	insert dbo.Volunteer(FirstName,LastName,VolunteerTypeID,CompanyID,Last4DigitsOfPhone)
	values (@FirstName,@LastName,@VolunteerTypeID,@CompanyID,@Last4Digits)

	declare @VolunteerID int
	select @VolunteerID = SCOPE_IDENTITY() -- to get the ID of the row just created.

	insert dbo.UserLogon(UserID,PIN,VolunteerID)
	values (@UserId, @PIN, @VolunteerID)

end
go
