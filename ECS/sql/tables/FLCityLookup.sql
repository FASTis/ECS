/*
=================================================
Author:      	Cici Carter
Create date:    05/03/2017
Description:    Create and populate city lookup table.
=================================================
*/

Create Table FLCityLookup
(
	City varchar(50)
);

Insert FLCityLookup (City) -- truncate table flcitylookup
	select 'Atlantic Beach' union 
	select 'Bostwick' union 
	select 'Bryceville' union 
	select 'Bunnell' union 
	select 'Callahan' union 
	select 'Crescent City' union 
	select 'Doctors Inlet' union 
	select 'East Palatka' union 
	select 'Elkton' union 
	select 'Fernandina Beach' union 
	select 'Flagler Beach' union 
	select 'Fleming Island' union 
	select 'Florahome' union 
	select 'Georgetown' union 
	select 'Glen Saint Mary' union 
	select 'Grandin' union 
	select 'Green Cove Springs' union 
	select 'Hampton' union 
	select 'Hastings' union 
	select 'Hilliard' union 
	select 'Hollister' union 
	select 'Interlachen' union 
	select 'Jacksonville Beach' union 
	select 'Jacksonville' union 
	select 'Lake Como' union 
	select 'Lawtey' union 
	select 'Macclenny' union 
	select 'Middleburg' union 
	select 'Neptune Beach' union 
	select 'Orange Park' union 
	select 'Palatka' union 
	select 'Palm Coast' union 
	select 'Penney Farms' union 
	select 'Pomona Park' union 
	select 'Ponte Vedra Beach' union 
	select 'Ponte Vedra' union 
	select 'Saint Augustine' union 
	select 'Saint Johns' union 
	select 'San Mateo' union 
	select 'Sanderson' union 
	select 'Satsuma' union 
	select 'Starke' union 
	select 'Welaka' union 
	select 'Yulee'