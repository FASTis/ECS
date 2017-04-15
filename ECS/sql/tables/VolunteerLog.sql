/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Stores volunteer time logged.
=================================================
*/

Create Table VolunteerLog
(
	 VolunteerLogID integer identity(1,1)
	,VolunteerID integer
	,TaskID integer
	,CenterID integer
	,ChildID integer
	,NumberMinutes integer
	,DateTimeLogged datetime not null
	,SignatureReceived bit
	,PRIMARY KEY (VolunteerLogID)
);

ALTER TABLE [dbo].[VolunteerLog] ADD  CONSTRAINT [DF_VolunteerLog_DateTimeLogged]  DEFAULT (getdate()) FOR [DateTimeLogged]
GO

ALTER TABLE [dbo].[VolunteerLog] ADD  CONSTRAINT [DF_VolunteerLog_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

