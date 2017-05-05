alter table Family add CenterID int
alter table Family add FamilyName varchar(50)
alter table Child add Gender char(1)
alter table Volunteer add RelationToChild varchar(20)
alter table Volunteer add DOB datetime
alter table Volunteer add Gender char(1)

--This was just for testing...
--alter table Family drop column CenterID 
--alter table Family drop column FamilyName 
--alter table Child drop column Gender
--alter table Volunteer drop column RelationToChild 
--alter table Volunteer drop column DOB 
--alter table Volunteer drop column Gender 