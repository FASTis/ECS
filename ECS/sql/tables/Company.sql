/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Create and populate lookup table.
=================================================
*/

Create Table Company
(
	 CompanyID integer identity(1,1)
	,CompanyName varchar(30)
	,Active bit
	,PRIMARY KEY (CompanyID)
);

Insert Company(CompanyName)
Select 'UNF (Intern)' 
Union Select 'Acme Psychological Center' 
Union Select 'Acme Law Office';