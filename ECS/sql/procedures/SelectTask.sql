﻿SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure SelectTask
as
begin
	Select TaskID, TaskDescr, PricePerMinute, PricePerMinute * 60 as PricePerHour from Task
end
go