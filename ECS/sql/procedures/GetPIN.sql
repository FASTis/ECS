/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Gets PIN for user and phone.
================================================
*/
Create Procedure GetPIN
(
	 @userId varchar(25)
	,@last4Digits varchar(4)
)

as

begin
		select 	PIN
		from 	UserLogon u 
		join 	Volunteer v 
		on 		u.VolunteerID=v.VolunteerID
		where 	UserID=@userId 
		and 	Last4DigitsOfPhone=@last4Digits 
end