Create Procedure SelectCenter
as
begin
	Select CenterID, CenterName, StreetAddress, City, Zip from Center
	where Active=1
end
go
