/*
=================================================
Author:      	Cici Carter
Create date:    09/23/2016
Description:    Create and populate lookup table.
=================================================
*/

Create Table Center
(
	 CenterID integer identity(1,1)
	,CenterName varchar(50)
	,StreetAddress varchar(50)
	,City varchar(30)
	,Zip varchar(5)
	,Active bit
	,PRIMARY KEY (CenterID)
);

Insert Center(CenterName, StreetAddress, City, Zip)
Select 'Administrative Office', '8443 Baymeadows Road, Suite 1','Jacksonville','32256'
Union Select 'Baker County','418 South 8th Street','Macclenny','32063'
Union Select 'Bradford County','1080 North Pine Street','Starke','32091'
Union Select 'Clay County c/o Careersource','1845 Town Center Blvd, Suite 150','Orange Park','32003'
Union Select 'Nassau County c/o Careersource','96042 Lofton Square','Yulee','32097'
Union Select 'Putnam County','821 State Road 19 South','Palatka','32177'
Union Select 'St. Johns County','5 Clark Street','St. Augustine','32084';
