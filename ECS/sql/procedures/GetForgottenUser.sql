/****** Object:  StoredProcedure [dbo].[GetForgettenUser]    Script Date: 6/11/2017 6:58:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[GetForgottenUser]
(
	 @FirstName varchar(30)
	 ,@LastName varchar(30)
	,@Last4Digits varchar(4)
)

as

begin
		select 	UserID
		from 	UserLogon u 
		join 	Volunteer v 
		on 		u.VolunteerID=v.VolunteerID
		where 	UPPER(FirstName)=UPPER(@FirstName)
		and		UPPER(LastName)=UPPER(@LastName)
		and 	UPPER(Last4DigitsOfPhone)=UPPER(@last4Digits)
		and		v.Active=1
end