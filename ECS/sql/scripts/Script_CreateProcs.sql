Create Procedure AddCenter
(	-- Make sure lengths match the table!
	 @centerName varchar(50)
	,@streetAddr varchar(50)
	,@city varchar(30)
	,@zip varchar(5)
)

as

begin

	INSERT dbo.Center (CenterName, StreetAddress, City, Zip, Active)
	VALUES (@centerName, @streetAddr, @city, @zip, 1)
		
end
GO

create procedure AddChild ( 
	  @volunteerID int
	, @childFName varchar(30)
	, @childLName varchar(30)
	, @dob datetime
	, @relationship varchar(20) -- Relationship of child to volunteer.
	)
as
-- AddChild 2, 'Lisa','Carter','3/29/2014','Child'
-- GetChildrenByVolunteerID 2
begin

	declare @familyID int
	declare @childID int

	insert Child (FirstName, LastName, DOB)
	values (@childFName, @childLName, @dob)

	set @childID=SCOPE_IDENTITY() -- to get the ID of the row just created.

	-- does this volunteer currently exist in the family table?
	select  @familyID=FamilyID from Family where VolunteerID=@volunteerID

	-- if volunteer does not exist, create a unique id for this volunteer.
	if (isnull(@familyID,0) = 0)
		select @familyID=isnull(max(FamilyID),0)+1 from Family
	
	-- insert record into Family table to join child to volunteer
	SET IDENTITY_INSERT Family ON
	insert Family (FamilyID, ChildID, VolunteerID, Descr)
	values (@familyID, @childID, @volunteerID, @relationship)
	SET IDENTITY_INSERT Family OFF
end

GO

Create Procedure AddCompany (@companyName varchar(50))
as
begin
		Insert Company (CompanyName) 
		values (@companyName)
end
GO

/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Adds a staff type.
================================================
*/
Create Procedure AddStaffType
(
	 @StaffTypeDescr varchar(25)
)

as

begin
		Insert	StaffType (StaffTypeDescr)
		Values  (@StaffTypeDescr)
end
go

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

Create Procedure AddVolunteerType
(
	 @VolunteerTypeDescr varchar(25)
)

as

begin
		Insert	VolunteerType (VolunteerTypeDescr)
		Values  (@VolunteerTypeDescr)
end
GO

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

Create Procedure GetCenterForID
(
	 @CenterId varchar(25)
)

as

begin
		SELECT	CenterName, StreetAddress, City, Zip
		FROM	Center
		WHERE	CenterID=@CenterId
end
GO

create procedure GetChildByChildID (@childId int)
as

begin

	select ChildId, FirstName, LastName, DOB
	from Child
	where ChildID=@childId
end
go

Create Procedure GetChildrenByVolunteerID
(@volunteerId int)
as
begin
	select c.ChildID, c.LastName+', '+c.FirstName Child, c.DOB, f.Descr Relationship, @volunteerId VolunteerID
    from Child c join Family f on c.ChildID=f.ChildID
    where f.VolunteerID=@volunteerId
end
go

/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Gets all companies.
================================================
*/

Create Procedure GetCompanies
as

begin
		SELECT	CompanyId, CompanyName, Active
		FROM	Company
end
go

/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Gets company name for given id.
================================================
*/
Create Procedure GetCompanyForID
(
	 @CompanyId varchar(25)
)

as

begin
		SELECT	CompanyName
		FROM	Company
		WHERE	CompanyId=@CompanyId
end
go


Create Procedure GetHoursForPeriodAndVolunteerID (@startDate datetime, @endDate datetime, @VolunteerId int)
As
/*
GetHoursForPeriodAndVolunteerID '4/1/2017','4/30/2017',4

declare @startDate datetime, @endDate datetime, @VolunteerId int
set @startDate='3/1/2017'
set @endDate='4/1/2017'
set @VolunteerId=4
*/
BEGIN
	select x.HoursForPeriod, y.HoursForPeriod as NonHomeHoursPerPeriod from
	(select @volunteerID ID, isnull(convert(decimal(18,2), sum(vl.NumberMinutes)/60.00),0.00) HoursForPeriod
	from VolunteerLog vl
	join Volunteer v on v.VolunteerID=vl.VolunteerID
	join VolunteerType vt on v.VolunteerTypeID=vt.VolunteerTypeID
	where vl.DateTimeLogged between @startDate and @endDate
	and v.VolunteerId=@volunteerId) as x
	join
	(select @volunteerID ID, isnull(convert(decimal(18,2), sum(vl.NumberMinutes)/60.00),0.00) HoursForPeriod
	from VolunteerLog vl
	join Volunteer v on v.VolunteerID=vl.VolunteerID
	join VolunteerType vt on v.VolunteerTypeID=vt.VolunteerTypeID
	where vl.TaskId not in (1,5)
	and vl.DateTimeLogged between @startDate and @endDate
	and v.VolunteerId=@volunteerId) as y
	on x.ID=y.ID

END

GO
create procedure GetMonthlySummaryReport(@monthNum int) -- GetMonthlySummaryReport 4
as
begin
	declare @tbl table 
	(Volunteer varchar(100), 
		VolunteerTypeDescr varchar(100), 
		CenterName varchar(100), 
		DateTimeLogged datetime,  
		TaskDescr varchar(100), 
		Child varchar(100), 
		NumberMinutes integer, 
		PricePerMinute decimal, 
		TotalValue money, 
		VolunteerID integer, 
		TaskID integer, 
		CenterID integer, 
		VolunteerTypeID integer, 
		ChildId integer)

	insert @tbl
	exec SelectReport @monthNum,0,0,0

	SELECT 	CenterName as Center,
		sum(TotalValue) as [Volunteers(6720)],
		0 as [Goods & Services(6740)],
		0 as [Donated Space(6740)],
		0 as [Donated Equipment(6740)],
		0 as [Prof. Svs(6740)],
		0 as [Travel(6730)],
		sum(TotalValue) as [Center Total],
		0 as [Rent(6710)],
		0 as [Small Grants],
		0 as [Canteen(6740)],
		sum(TotalValue) as [TOTAL]
	from @tbl
	Group By CenterName
end
go

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
go

--updateuser 'Cici', 'Carter', '3909', 'ccarter','0825'
--getpin 'ccarter','3909'

/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Gets staff type descr for id.

4/15/2017 - Added Active flag.
================================================
*/

Create Procedure GetStaffTypeForID
(
	 @StaffTypeId varchar(25)
)

as

begin
		SELECT	StaffTypeDescr
		FROM	StaffType
		WHERE	StaffTypeId=@StaffTypeId
		AND		Active=1
end
go

/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Gets all staff types.
================================================
*/

Create Procedure GetStaffTypes
as

begin
		select StaffTypeId
			 , StaffTypeDescr
		from StaffType		
		where Active=1
end

go

/*
================================================
Author:      	Cici Carter
Create date:    09/25/2016
Description:    Returns info for specified user.

4/15/2017 - Added IsAdmin flag.
================================================
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure GetUserByUserId(
@UserId          varchar(20)
)
-- exec GetUserByUserId 'ccarter'
-- exec GetUserByUserId 'jdoe'
as
begin

	declare @isAdmin bit
	set @isAdmin = 0
	if exists (select 1 from Staff s join UserLogon u on s.VolunteerID=u.VolunteerID where u.UserID= @UserId)
		set @isAdmin=1

	select v.VolunteerID, FirstName, LastName, v.VolunteerTypeID, vt.VolunteerTypeDescr, 
	c.CompanyID, c.CompanyName, v.Last4DigitsOfPhone, u.UserID, u.PIN, @isAdmin IsAdmin
	from dbo.Volunteer v 
	join dbo.VolunteerType vt on v.VolunteerTypeID=vt.VolunteerTypeID
	left join dbo.Company c on v.CompanyID=c.CompanyID
	join dbo.UserLogon u on v.VolunteerID=u.VolunteerID
	where UserID=@UserId

end
go

Create Procedure InactivateCenter
(
	 @centerID int
)

as

begin

	Update Center set Active=0 where CenterID=@centerID
		
end
GO

/*
=============================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Inserts new user into db.

4/15/2017 - Added Active field to insert.
=============================================
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure InsertNewUser(
  @FirstName       varchar(30)
, @LastName        varchar(30)
, @VolunteerTypeID int
, @CompanyID       int
, @Last4Digits     varchar(4)
, @UserId          varchar(20)
, @PIN             varchar(4)
)
-- exec InsertNewUser 'Double','Trouble',3,3,'3909','dtroub','1234'
as
begin
	insert dbo.Volunteer(FirstName,LastName,VolunteerTypeID,CompanyID,Last4DigitsOfPhone,Active)
	values (@FirstName,@LastName,@VolunteerTypeID,@CompanyID,@Last4Digits,1)

	declare @VolunteerID int
	select @VolunteerID = SCOPE_IDENTITY() -- to get the ID of the row just created.

	insert dbo.UserLogon(UserID,PIN,VolunteerID,Active)
	values (@UserId, @PIN, @VolunteerID,1)

end
go

/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Logs volunteer hours.
================================================
*/

Create Procedure LogInKind
(
	   @volunteerId integer
	 , @childId integer
	 , @taskId integer
	 , @centerId integer
	 , @totalMinutes integer
	 , @logDate datetime
)

as

begin
		Insert VolunteerLog (VolunteerId, ChildId, TaskId, CenterId, NumberMinutes, DateTimeLogged, SignatureReceived) 
		Values (@volunteerId, @childId, @taskId, @centerId, @totalMinutes, @logDate, 1) 

end
go

CREATE Procedure [dbo].[SelectAllUsers]
-- exec SelectAllUsers -- Cici Carter
as
begin

	select v.VolunteerID, FirstName, LastName, v.VolunteerTypeID, vt.VolunteerTypeDescr, 
	c.CompanyID, c.CompanyName, v.Last4DigitsOfPhone, u.UserID, u.PIN
	from dbo.Volunteer v 
	join dbo.VolunteerType vt on v.VolunteerTypeID=vt.VolunteerTypeID
	left join dbo.Company c on v.CompanyID=c.CompanyID
	join dbo.UserLogon u on v.VolunteerID=u.VolunteerID
	where v.Active=1
	order by LastName
	
end

GO

Create Procedure SelectCenter
as
begin
	Select CenterID, CenterName, StreetAddress, City, Zip from Center
	where Active=1
end
go

/*
	Created by Cici Carter
	02-24-2017 
	(to replace SelectReportByMonth; used by RunReports.aspx)

	03-01-2017 - Ccarter - modified to add parameters

	05-03-2017 - Ccarter - fixed bug (may not have checked in the update before)
*/

Create Proc SelectReport
(
 @MonthNum int,
 @TaskID int,
 @VolunteerTypeID int,
 @CenterID int
 )
 -- SelectReport 2, 0, 0, 1
as
begin
	select v.LastName + ', ' + v.FirstName Volunteer, vt.VolunteerTypeDescr, c.CenterName, vl.DateTimeLogged, 
	t.TaskDescr, ch.LastName + ', ' + ch.FirstName Child, vl.NumberMinutes, t.PricePerMinute, vl.NumberMinutes * t.PricePerMinute TotalValue,
	v.VolunteerID, t.TaskID, c.CenterID, vt.VolunteerTypeID,
	ch.ChildId -- added for Parent volunteers
	from VolunteerLog vl
	join Volunteer v on v.VolunteerID=vl.VolunteerID
	join Task t on t.TaskID=vl.TaskID
	join Center c on c.CenterID=vl.CenterID
	join VolunteerType vt on vt.VolunteerTypeID=v.VolunteerTypeID
	left join Child ch on vl.ChildID=ch.ChildID
	where	(@MonthNum = 0 or (datepart(month, vl.DateTimeLogged)=@MonthNum))
		and (@TaskID = 0 or t.TaskID=@TaskID)
		and (@VolunteerTypeID = 0 or vt.VolunteerTypeID=@VolunteerTypeID)
		and (@CenterID = 0 or c.CenterID=@CenterID)
end

go

/*
	Created by Cici Carter (with Tillman Chen)
	02-11-2017
*/

Create Proc SelectReportForMonth(@monthNum integer)
as
begin

	select v.FirstName, v.LastName, c.CenterName, vl.DateTimeLogged, vl.NumberMinutes, t.TaskDescr, t.PricePerMinute,
	vl.VolunteerID, vl.TaskID, vl.CenterID
	from VolunteerLog vl
	join Volunteer v on v.VolunteerID=vl.VolunteerID
	join Task t on t.TaskID=vl.TaskID
	join Center c on c.CenterID=vl.CenterID
	where DATEPART(m, vl.DateTimeLogged) = @monthNum
end

go

Create Procedure SelectTask
as
begin
	Select TaskID, TaskDescr, PricePerMinute, PricePerMinute * 60 as PricePerHour, RestrictToVolunteerTypes from Task
	Order By TaskDescr
end
go

/*
================================================
Author:      	Cici Carter
Create date:    09/25/2016
Description:    Returns info for specified user.
================================================
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure SelectUserByUserId(
@UserId          varchar(20)
)
-- exec SelectUserByUserId 'ccarter'
as
begin

	select v.VolunteerID, FirstName, LastName, v.VolunteerTypeID, vt.VolunteerTypeDescr, 
	c.CompanyID, c.CompanyName, v.Last4DigitsOfPhone, u.UserID, u.PIN
	from dbo.Volunteer v 
	join dbo.VolunteerType vt on v.VolunteerTypeID=vt.VolunteerTypeID
	left join dbo.Company c on v.CompanyID=c.CompanyID
	join dbo.UserLogon u on v.VolunteerID=u.VolunteerID
	where UserID=@UserId

end
go

/*
================================================
Author:      	Cici Carter
Create date:    09/26/2016
Description:    Returns all volunteer types.
================================================
*/

Create Procedure SelectVolunteerTypes 
as
begin
	Select VolunteerTypeID, VolunteerTypeDescr from VolunteerType
	where Active=1
end

go
Create Procedure UpdateCenter
(
	 @centerID int
	,@centerName varchar(25)
	,@streetAddr varchar(25)
	,@city varchar(50) -- increase length
	,@zip varchar(25)
)

as

begin

	UPDATE dbo.Center
	   SET CenterName = @centerName
		  ,StreetAddress = @streetAddr
		  ,City = @city
		  ,Zip = @zip
	 WHERE CenterID=@centerID
		
end
GO

create procedure UpdateChild ( 
	  @childID int
	, @childFName varchar(30)
	, @childLName varchar(30)
	, @dob datetime
	)
as

begin

	update Child set FirstName=@childFName, LastName=@childLName, DOB=@dob
	where ChildID=@childID

end
go

Create Procedure UpdateCompany
(@companyId int,
 @companyName varchar(50)
 )
 as

 begin
		Update Company set CompanyName=@companyName
		where CompanyID=@companyId
 end

 go
 
 /*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Updates a staff type.
================================================
*/

Create Procedure UpdateStaffType
(
	 @StaffTypeDescr varchar(25)
	,@StaffTypeId varchar(25)
)

as

begin
		Update	StaffType
		Set		StaffTypeDescr=@StaffTypeDescr
		WHERE	StaffTypeId=@StaffTypeId
end

go

/*
================================================
Author:      	Cici Carter
Create date:    04/11/2017
Description:    Updates a user.
================================================
*/

Create Procedure UpdateUser
(
	 @firstName varchar(25)
	,@lastName varchar(25)
	,@last4Digits varchar(4)
	,@userId varchar(25)
	,@pin varchar(25)
)

as

begin
		Update Volunteer 
		Set   FirstName=@firstName
			, LastName=@lastName
			, Last4DigitsOfPhone=@last4Digits 
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

Create Procedure UpdateVolunteerType
(@volunteerTypeId int,
 @volunteerTypeDescr varchar(50)
 )
 as

 begin
	Update VolunteerType 
	set VolunteerTypeDescr=@volunteerTypeDescr
	where VolunteerTypeID=@volunteerTypeId
 end
 go
 
 /*
=============================================
Author:      	Cici Carter
Create date:    09/25/2016
Description:    Determines if login is valid.
=============================================
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure ValidateLogin(
  @UserId varchar(20)
, @PIN    varchar(4)
)
as
begin
	declare @ct int, @retVal int
	
	select @ct=count(1) from dbo.UserLogon where UserID=@UserId and PIN=@PIN

	if @ct > 0
		set @retVal=1
	else
		set @retVal=0

	select @retVal ReturnValue
end
go

/*
=============================================
Author:      	Ashley Darling (checked in by Cici on date below)
Create date:    05/03/2017
Description:    Determines if info provided is valid.
=============================================
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure ValidateUserInfo(
  @UserId varchar(20)
, @Last4DigitsOfPhone    varchar(4)
)
as
begin
	declare @ct int, @retVal int
	
	select @ct=count(1) from UserLogon u
	join Volunteer v on u.VolunteerID=v.VolunteerId
	where u.UserID=@UserId and v.Last4DigitsOfPhone=@Last4DigitsOfPhone

	if @ct > 0
		set @retVal=1
	else
		set @retVal=0

	select @retVal ReturnValue
end
go

