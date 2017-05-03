Create Procedure AddTask
(
	 @taskDescr varchar(50)
	,@pricePerMinute decimal(18,2)
	,@restrictToTypes varchar(5)
)
as
begin
	INSERT INTO Task
			   (TaskDescr
			   ,PricePerMinute
			   ,RestrictToVolunteerTypes
			   ,Active)
		 VALUES
			   ( @taskDescr
				,@pricePerMinute
				,@restrictToTypes
				,1
			   )
end
GO

--AddTask 'At Home Reading',0.23,'1,2'
