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
		and		v.Active=1
end


--updateuser 'Cici', 'Carter', '3909', 'ccarter','0825'
--getpin 'ccarter','3909'