/****** Object:  StoredProcedure [dbo].[UpdateUserPin]    Script Date: 6/11/2017 7:10:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[UpdateUserPin]
(
	@UserId varchar(25)
	,@Pin varchar(4)
)

as

begin
		Update UserLogon
		Set PIN=@pin 
		where  
		VolunteerID = 
			 (select VolunteerID 
			  from   UserLogon 
			  where  UserId=@UserId)
end


