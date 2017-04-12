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