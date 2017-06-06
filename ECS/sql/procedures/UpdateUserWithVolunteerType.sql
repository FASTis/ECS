/*
================================================
Author:      	Cici Carter
Create date:    06/06/2017
Description:    Updates a user.
================================================
*/

Create Procedure UpdateUserWithVolunteerType
(
	 @firstName varchar(25)
	,@lastName varchar(25)
	,@last4Digits varchar(4)
	,@userId varchar(25)
	,@pin varchar(25)
	,@volunteerType int
)

as

begin
		Update Volunteer 
		Set   FirstName=@firstName
			, LastName=@lastName
			, Last4DigitsOfPhone=@last4Digits 
			, VolunteerTypeID=@volunteerType
		Where  
             VolunteerID = 
			 (
			  select VolunteerID 
			  from   UserLogon 
			  where  UserId=@userId
			  )
		
		Update UserLogon
		Set PIN=@pin 
		Where  
             VolunteerID = 
			 (
			  select VolunteerID 
			  from   UserLogon 
			  where  UserId=@userId
			  )
		
end

go