Create Procedure EditTask
(
	 @id int
	,@taskDescr varchar(50)
	,@pricePerMinute decimal(18,2)
	,@restrictToTypes varchar(5)
)
as
begin
	UPDATE Task
	SET  TaskDescr=@taskDescr
		,PricePerMinute=@pricePerMinute
		,RestrictToVolunteerTypes=@restrictToTypes
	WHERE TaskID=@id
end
GO

--EditTask 1,'At Home Learning',0.23,'1,2'
