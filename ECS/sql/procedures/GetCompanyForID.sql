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