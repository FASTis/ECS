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