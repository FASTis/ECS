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