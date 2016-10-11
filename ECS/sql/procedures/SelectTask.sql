SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure SelectTask
as
begin
	Select TaskID, TaskDescr from Task
end
go