Create Procedure AddCompany (@companyName varchar(50))
as
begin
		Insert Company (CompanyName) 
		values (@companyName)
end