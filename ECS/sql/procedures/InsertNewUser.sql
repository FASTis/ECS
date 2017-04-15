/*
=============================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Inserts new user into db.

4/15/2017 - Added Active field to insert.
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
-- exec InsertNewUser 'Double','Trouble',3,3,'3909','dtroub','1234'
as
begin
	insert dbo.Volunteer(FirstName,LastName,VolunteerTypeID,CompanyID,Last4DigitsOfPhone,Active)
	values (@FirstName,@LastName,@VolunteerTypeID,@CompanyID,@Last4Digits,1)

	declare @VolunteerID int
	select @VolunteerID = SCOPE_IDENTITY() -- to get the ID of the row just created.

	insert dbo.UserLogon(UserID,PIN,VolunteerID,Active)
	values (@UserId, @PIN, @VolunteerID,1)

end
go
