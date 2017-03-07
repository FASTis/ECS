declare @tbl table 
(Volunteer varchar(100), 
 VolunteerTypeDescr varchar(100), 
 CenterName varchar(100), 
 DateTimeLogged datetime,  
 TaskDescr varchar(100), 
 Child varchar(100), 
 NumberMinutes integer, 
 PricePerMinute decimal, 
 TotalValue decimal, 
 VolunteerID integer, 
 TaskID integer, 
 CenterID integer, 
 VolunteerTypeID integer, 
 ChildId integer)

insert @tbl
exec SelectReport

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
Having DateTimeLogged between @StartDate and @EndDate