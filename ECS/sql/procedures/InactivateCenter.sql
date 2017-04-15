Create Procedure InactivateCenter
(
	 @centerID int
)

as

begin

	Update Center set Active=0 where CenterID=@centerID
		
end
GO


