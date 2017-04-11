Create Procedure GetCompanies
as

begin
		SELECT	CompanyId, CompanyName
		FROM	Company
end