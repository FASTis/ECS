create table FLCityLookup
(id int identity(1,1)
,County varchar(50)
,City varchar(50)
)

insert FLCityLookup (County, City)
select 'Alachua', 'Alachua' union 
select 'Alachua', 'Archer' union 
select 'Alachua', 'Earleton' union 
select 'Alachua', 'Evinston' union 
select 'Alachua', 'Gainesville' union 
select 'Alachua', 'Hawthorne' union 
select 'Alachua', 'High Springs' union 
select 'Alachua', 'Island Grove' union 
select 'Alachua', 'La Crosse' union 
select 'Alachua', 'Lochloosa' union 
select 'Alachua', 'Micanopy' union 
select 'Alachua', 'Newberry' union 
select 'Alachua', 'Waldo' union 
select 'Baker', 'Glen Saint Mary' union 
select 'Baker', 'Macclenny' union 
select 'Baker', 'Olustee' union 
select 'Baker', 'Sanderson' union 
select 'Bay', 'Fountain' union 
select 'Bay', 'Lynn Haven' union 
select 'Bay', 'Mexico Beach' union 
select 'Bay', 'Panama City' union 
select 'Bay', 'Panama City Beach' union 
select 'Bay', 'Youngstown' union 
select 'Bradford', 'Brooker' union 
select 'Bradford', 'Graham' union 
select 'Bradford', 'Hampton' union 
select 'Bradford', 'Lawtey' union 
select 'Bradford', 'Starke' union 
select 'Brevard', 'Cape Canaveral' union 
select 'Brevard', 'Cocoa' union 
select 'Brevard', 'Cocoa Beach' union 
select 'Brevard', 'Grant' union 
select 'Brevard', 'Indialantic' union 
select 'Brevard', 'Malabar' union 
select 'Brevard', 'Melbourne' union 
select 'Brevard', 'Melbourne Beach' union 
select 'Brevard', 'Merritt Island' union 
select 'Brevard', 'Mims' union 
select 'Brevard', 'Orlando' union 
select 'Brevard', 'Palm Bay' union 
select 'Brevard', 'Patrick AFB' union 
select 'Brevard', 'Rockledge' union 
select 'Brevard', 'Satellite Beach' union 
select 'Brevard', 'Scottsmoor' union 
select 'Brevard', 'Sebastian' union 
select 'Brevard', 'Sharpes' union 
select 'Brevard', 'Titusville' union 
select 'Broward', 'Coconut Creek' union 
select 'Broward', 'Coral Springs' union 
select 'Broward', 'Dania' union 
select 'Broward', 'Deerfield Beach' union 
select 'Broward', 'Fort Lauderdale' union 
select 'Broward', 'Hallandale' union 
select 'Broward', 'Hollywood' union 
select 'Broward', 'Margate' union 
select 'Broward', 'Pembroke Pines' union 
select 'Broward', 'Plantation' union 
select 'Broward', 'Pompano Beach' union 
select 'Calhoun', 'Altha' union 
select 'Calhoun', 'Blountstown' union 
select 'Calhoun', 'Clarksville' union 
select 'Calhoun', 'Wewahitchka' union 
select 'Charlotte', 'El Jobean' union 
select 'Charlotte', 'Englewood' union 
select 'Charlotte', 'Murdock' union 
select 'Charlotte', 'Placida' union 
select 'Charlotte', 'Port Charlotte' union 
select 'Charlotte', 'Punta Gorda' union 
select 'Charlotte', 'Rotonda West' union 
select 'Citrus', 'Beverly Hills' union 
select 'Citrus', 'Crystal River' union 
select 'Citrus', 'Dunnellon' union 
select 'Citrus', 'Floral City' union 
select 'Citrus', 'Hernando' union 
select 'Citrus', 'Holder' union 
select 'Citrus', 'Homosassa' union 
select 'Citrus', 'Homosassa Springs' union 
select 'Citrus', 'Inverness' union 
select 'Citrus', 'Lecanto' union 
select 'Clay', 'Doctors Inlet' union 
select 'Clay', 'Fleming Island' union 
select 'Clay', 'Green Cove Springs' union 
select 'Clay', 'Keystone Heights' union 
select 'Clay', 'Lake Geneva' union 
select 'Clay', 'Middleburg' union 
select 'Clay', 'Orange Park' union 
select 'Clay', 'Penney Farms' union 
select 'Collier', 'Chokoloskee' union 
select 'Collier', 'Copeland' union 
select 'Collier', 'Everglades City' union 
select 'Collier', 'Goodland' union 
select 'Collier', 'Immokalee' union 
select 'Collier', 'Marco Island' union 
select 'Collier', 'Naples' union 
select 'Collier', 'Ochopee' union 
select 'Columbia', 'Fort White' union 
select 'Columbia', 'Lake City' union 
select 'Columbia', 'Lulu' union 
select 'DeSoto', 'Arcadia' union 
select 'DeSoto', 'Fort Ogden' union 
select 'DeSoto', 'Nocatee' union 
select 'Dixie', 'Cross City' union 
select 'Dixie', 'Horseshoe Beach' union 
select 'Dixie', 'Old Town' union 
select 'Dixie', 'Suwannee' union 
select 'Duval', 'Atlantic Beach' union 
select 'Duval', 'Jacksonville' union 
select 'Duval', 'Jacksonville Beach' union 
select 'Duval', 'Neptune Beach' union 
select 'Escambia', 'Cantonment' union 
select 'Escambia', 'Century' union 
select 'Escambia', 'Gonzalez' union 
select 'Escambia', 'McDavid' union 
select 'Escambia', 'Molino' union 
select 'Escambia', 'Pensacola' union 
select 'Flagler', 'Bunnell' union 
select 'Flagler', 'Flagler Beach' union 
select 'Flagler', 'Palm Coast' union 
select 'Franklin', 'Apalachicola' union 
select 'Franklin', 'Carrabelle' union 
select 'Franklin', 'Eastpoint' union 
select 'Franklin', 'Lanark Village' union 
select 'Gadsden', 'Chattahoochee' union 
select 'Gadsden', 'Greensboro' union 
select 'Gadsden', 'Gretna' union 
select 'Gadsden', 'Havana' union 
select 'Gadsden', 'Midway' union 
select 'Gadsden', 'Quincy' union 
select 'Gilchrist', 'Bell' union 
select 'Gilchrist', 'Trenton' union 
select 'Glades', 'Moore Haven' union 
select 'Glades', 'Palmdale' union 
select 'Gulf', 'Port Saint Joe' union 
select 'Gulf', 'Wewahitchka' union 
select 'Hamilton', 'Jasper' union 
select 'Hamilton', 'Jennings' union 
select 'Hamilton', 'White Springs' union 
select 'Hardee', 'Bowling Green' union 
select 'Hardee', 'Ona' union 
select 'Hardee', 'Wauchula' union 
select 'Hardee', 'Zolfo Springs' union 
select 'Hendry', 'Clewiston' union 
select 'Hendry', 'Felda' union 
select 'Hendry', 'Labelle' union 
select 'Hernando', 'Brooksville' union 
select 'Hernando', 'Istachatta' union 
select 'Hernando', 'Nobleton' union 
select 'Hernando', 'Spring Hill' union 
select 'Highlands', 'Avon Park' union 
select 'Highlands', 'Lake Placid' union 
select 'Highlands', 'Lorida' union 
select 'Highlands', 'Sebring' union 
select 'Highlands', 'Venus' union 
select 'Hillsborough', 'Apollo Beach' union 
select 'Hillsborough', 'Balm' union 
select 'Hillsborough', 'Brandon' union 
select 'Hillsborough', 'Dover' union 
select 'Hillsborough', 'Durant' union 
select 'Hillsborough', 'Gibsonton' union 
select 'Hillsborough', 'Lithia' union 
select 'Hillsborough', 'Lutz' union 
select 'Hillsborough', 'Mango' union 
select 'Hillsborough', 'Odessa' union 
select 'Hillsborough', 'Plant City' union 
select 'Hillsborough', 'Riverview' union 
select 'Hillsborough', 'Ruskin' union 
select 'Hillsborough', 'Seffner' union 
select 'Hillsborough', 'Sun City' union 
select 'Hillsborough', 'Sun City Center' union 
select 'Hillsborough', 'Sydney' union 
select 'Hillsborough', 'Tampa' union 
select 'Hillsborough', 'Thonotosassa' union 
select 'Hillsborough', 'Valrico' union 
select 'Hillsborough', 'Wimauma' union 
select 'Holmes', 'Bonifay' union 
select 'Holmes', 'Noma' union 
select 'Holmes', 'Ponce de Leon' union 
select 'Holmes', 'Westville' union 
select 'Indian River', 'Fellsmere' union 
select 'Indian River', 'Roseland' union 
select 'Indian River', 'Sebastian' union 
select 'Indian River', 'Vero Beach' union 
select 'Indian River', 'Wabasso' union 
select 'Indian River', 'Winter Beach' union 
select 'Jackson', 'Alford' union 
select 'Jackson', 'Bascom' union 
select 'Jackson', 'Campbellton' union 
select 'Jackson', 'Cottondale' union 
select 'Jackson', 'Cypress' union 
select 'Jackson', 'Graceville' union 
select 'Jackson', 'Grand Ridge' union 
select 'Jackson', 'Greenwood' union 
select 'Jackson', 'Malone' union 
select 'Jackson', 'Marianna' union 
select 'Jackson', 'Sneads' union 
select 'Jefferson', 'Lamont' union 
select 'Jefferson', 'Lloyd' union 
select 'Jefferson', 'Monticello' union 
select 'Jefferson', 'Wacissa' union 
select 'Lafayette', 'Day' union 
select 'Lafayette', 'Mayo' union 
select 'Lake', 'Altoona' union 
select 'Lake', 'Astatula' union 
select 'Lake', 'Astor' union 
select 'Lake', 'Clermont' union 
select 'Lake', 'Eustis' union 
select 'Lake', 'Ferndale' union 
select 'Lake', 'Fruitland Park' union 
select 'Lake', 'Grand Island' union 
select 'Lake', 'Groveland' union 
select 'Lake', 'Howey in the Hills' union 
select 'Lake', 'Lady Lake' union 
select 'Lake', 'Leesburg' union 
select 'Lake', 'Mascotte' union 
select 'Lake', 'Minneola' union 
select 'Lake', 'Montverde' union 
select 'Lake', 'Mount Dora' union 
select 'Lake', 'Okahumpka' union 
select 'Lake', 'Paisley' union 
select 'Lake', 'Sorrento' union 
select 'Lake', 'Tavares' union 
select 'Lake', 'Umatilla' union 
select 'Lake', 'Yalaha' union 
select 'Lee', 'Alva' union 
select 'Lee', 'Boca Grande' union 
select 'Lee', 'Bokeelia' union 
select 'Lee', 'Bonita Springs' union 
select 'Lee', 'Cape Coral' union 
select 'Lee', 'Captiva' union 
select 'Lee', 'Estero' union 
select 'Lee', 'Fort Myers' union 
select 'Lee', 'Fort Myers Beach' union 
select 'Lee', 'Lehigh Acres' union 
select 'Lee', 'North Fort Myers' union 
select 'Lee', 'Pineland' union 
select 'Lee', 'Saint James City' union 
select 'Lee', 'Sanibel' union 
select 'Leon', 'Tallahassee' union 
select 'Leon', 'Woodville' union 
select 'Levy', 'Bronson' union 
select 'Levy', 'Cedar Key' union 
select 'Levy', 'Chiefland' union 
select 'Levy', 'Gulf Hammock' union 
select 'Levy', 'Inglis' union 
select 'Levy', 'Morriston' union 
select 'Levy', 'Otter Creek' union 
select 'Levy', 'Williston' union 
select 'Levy', 'Yankeetown' union 
select 'Liberty', 'Bristol' union 
select 'Liberty', 'Hosford' union 
select 'Liberty', 'Sumatra' union 
select 'Liberty', 'Telogia' union 
select 'Madison', 'Greenville' union 
select 'Madison', 'Lee' union 
select 'Madison', 'Madison' union 
select 'Madison', 'Pinetta' union 
select 'Manatee', 'Anna Maria' union 
select 'Manatee', 'Bradenton' union 
select 'Manatee', 'Bradenton Beach' union 
select 'Manatee', 'Cortez' union 
select 'Manatee', 'Ellenton' union 
select 'Manatee', 'Holmes Beach' union 
select 'Manatee', 'Myakka City' union 
select 'Manatee', 'Oneco' union 
select 'Manatee', 'Palmetto' union 
select 'Manatee', 'Parrish' union 
select 'Manatee', 'Sarasota' union 
select 'Manatee', 'Tallevast' union 
select 'Manatee', 'Terra Ceia' union 
select 'Marion', 'Anthony' union 
select 'Marion', 'Belleview' union 
select 'Marion', 'Candler' union 
select 'Marion', 'Citra' union 
select 'Marion', 'Dunnellon' union 
select 'Marion', 'Eastlake Weir' union 
select 'Marion', 'Fairfield' union 
select 'Marion', 'Fort McCoy' union 
select 'Marion', 'Lowell' union 
select 'Marion', 'McIntosh' union 
select 'Marion', 'Ocala' union 
select 'Marion', 'Ocklawaha' union 
select 'Marion', 'Orange Lake' union 
select 'Marion', 'Orange Springs' union 
select 'Marion', 'Reddick' union 
select 'Marion', 'Silver Springs' union 
select 'Marion', 'Sparr' union 
select 'Marion', 'Summerfield' union 
select 'Marion', 'Weirsdale' union 
select 'Martin', 'Hobe Sound' union 
select 'Martin', 'Indiantown' union 
select 'Martin', 'Jensen Beach' union 
select 'Martin', 'Palm City' union 
select 'Martin', 'Port Salerno' union 
select 'Martin', 'Stuart' union 
select 'Miami-Dade', 'Coral Gables' union 
select 'Miami-Dade', 'Hialeah' union 
select 'Miami-Dade', 'Homestead' union 
select 'Miami-Dade', 'Key Biscayne' union 
select 'Miami-Dade', 'Miami' union 
select 'Miami-Dade', 'Miami Beach' union 
select 'Miami-Dade', 'Miami Gardens' union 
select 'Miami-Dade', 'Milam Dairy' union 
select 'Miami-Dade', 'North Miami Beach' union 
select 'Miami-Dade', 'Opa Locka' union 
select 'Monroe', 'Big Pine Key' union 
select 'Monroe', 'Islamorada' union 
select 'Monroe', 'Key Colony Beach' union 
select 'Monroe', 'Key Largo' union 
select 'Monroe', 'Key West' union 
select 'Monroe', 'Long Key' union 
select 'Monroe', 'Marathon' union 
select 'Monroe', 'Marathon Shores' union 
select 'Monroe', 'Summerland Key' union 
select 'Monroe', 'Tavernier' union 
select 'Nassau', 'Bryceville' union 
select 'Nassau', 'Callahan' union 
select 'Nassau', 'Fernandina Beach' union 
select 'Nassau', 'Hilliard' union 
select 'Nassau', 'Yulee' union 
select 'Okaloosa', 'Baker' union 
select 'Okaloosa', 'Crestview' union 
select 'Okaloosa', 'Destin' union 
select 'Okaloosa', 'Eglin AFB' union 
select 'Okaloosa', 'Fort Walton Beach' union 
select 'Okaloosa', 'Holt' union 
select 'Okaloosa', 'Hurlburt Field' union 
select 'Okaloosa', 'Mary Esther' union 
select 'Okaloosa', 'Milligan' union 
select 'Okaloosa', 'Niceville' union 
select 'Okaloosa', 'Shalimar' union 
select 'Okaloosa', 'Valparaiso' union 
select 'Okeechobee', 'Okeechobee' union 
select 'Orange', 'Apopka' union 
select 'Orange', 'Christmas' union 
select 'Orange', 'Clarcona' union 
select 'Orange', 'Gotha' union 
select 'Orange', 'Killarney' union 
select 'Orange', 'Maitland' union 
select 'Orange', 'Oakland' union 
select 'Orange', 'Ocoee' union 
select 'Orange', 'Orlando' union 
select 'Orange', 'Plymouth' union 
select 'Orange', 'Tangerine' union 
select 'Orange', 'Windermere' union 
select 'Orange', 'Winter Garden' union 
select 'Orange', 'Winter Park' union 
select 'Orange', 'Zellwood' union 
select 'Osceola', 'Intercession City' union 
select 'Osceola', 'Kenansville' union 
select 'Osceola', 'Kissimmee' union 
select 'Osceola', 'Saint Cloud' union 
select 'Palm Beach', 'Belle Glade' union 
select 'Palm Beach', 'Boca Raton' union 
select 'Palm Beach', 'Boynton Beach' union 
select 'Palm Beach', 'Canal Point' union 
select 'Palm Beach', 'Delray Beach' union 
select 'Palm Beach', 'Greenacres' union 
select 'Palm Beach', 'Jupiter' union 
select 'Palm Beach', 'Lake Harbor' union 
select 'Palm Beach', 'Lake Worth' union 
select 'Palm Beach', 'Loxahatchee' union 
select 'Palm Beach', 'North Palm Beach' union 
select 'Palm Beach', 'Pahokee' union 
select 'Palm Beach', 'Palm Beach' union 
select 'Palm Beach', 'Palm Beach Gardens' union 
select 'Palm Beach', 'Royal Palm Beach' union 
select 'Palm Beach', 'South Bay' union 
select 'Palm Beach', 'Wellington' union 
select 'Palm Beach', 'West Palm Beach' union 
select 'Pasco', 'Aripeka' union 
select 'Pasco', 'Crystal Springs' union 
select 'Pasco', 'Dade City' union 
select 'Pasco', 'Elfers' union 
select 'Pasco', 'Holiday' union 
select 'Pasco', 'Hudson' union 
select 'Pasco', 'Lacoochee' union 
select 'Pasco', 'Land O Lakes' union 
select 'Pasco', 'New Port Richey' union 
select 'Pasco', 'Port Richey' union 
select 'Pasco', 'Saint Leo' union 
select 'Pasco', 'San Antonio' union 
select 'Pasco', 'Spring Hill' union 
select 'Pasco', 'Trilby' union 
select 'Pasco', 'Wesley Chapel' union 
select 'Pasco', 'Zephyrhills' union 
select 'Pinellas', 'Bay Pines' union 
select 'Pinellas', 'Belleair Beach' union 
select 'Pinellas', 'Clearwater' union 
select 'Pinellas', 'Clearwater Beach' union 
select 'Pinellas', 'Crystal Beach' union 
select 'Pinellas', 'Dunedin' union 
select 'Pinellas', 'Indian Rocks Beach' union 
select 'Pinellas', 'Largo' union 
select 'Pinellas', 'Oldsmar' union 
select 'Pinellas', 'Ozona' union 
select 'Pinellas', 'Palm Harbor' union 
select 'Pinellas', 'Pinellas Park' union 
select 'Pinellas', 'Safety Harbor' union 
select 'Pinellas', 'Saint Petersburg' union 
select 'Pinellas', 'Seminole' union 
select 'Pinellas', 'Tarpon Springs' union 
select 'Polk', 'Alturas' union 
select 'Polk', 'Auburndale' union 
select 'Polk', 'Babson Park' union 
select 'Polk', 'Bartow' union 
select 'Polk', 'Bradley' union 
select 'Polk', 'Davenport' union 
select 'Polk', 'Dundee' union 
select 'Polk', 'Eagle Lake' union 
select 'Polk', 'Eaton Park' union 
select 'Polk', 'Fort Meade' union 
select 'Polk', 'Frostproof' union 
select 'Polk', 'Haines City' union 
select 'Polk', 'Highland City' union 
select 'Polk', 'Homeland' union 
select 'Polk', 'Indian Lake Estates' union 
select 'Polk', 'Kathleen' union 
select 'Polk', 'Kissimmee' union 
select 'Polk', 'Lake Alfred' union 
select 'Polk', 'Lake Hamilton' union 
select 'Polk', 'Lake Wales' union 
select 'Polk', 'Lakeland' union 
select 'Polk', 'Lakeshore' union 
select 'Polk', 'Loughman' union 
select 'Polk', 'Mulberry' union 
select 'Polk', 'Nalcrest' union 
select 'Polk', 'Nichols' union 
select 'Polk', 'Polk City' union 
select 'Polk', 'River Ranch' union 
select 'Polk', 'Waverly' union 
select 'Polk', 'Winter Haven' union 
select 'Putnam', 'Bostwick' union 
select 'Putnam', 'Crescent City' union 
select 'Putnam', 'East Palatka' union 
select 'Putnam', 'Florahome' union 
select 'Putnam', 'Georgetown' union 
select 'Putnam', 'Grandin' union 
select 'Putnam', 'Hollister' union 
select 'Putnam', 'Interlachen' union 
select 'Putnam', 'Lake Como' union 
select 'Putnam', 'Melrose' union 
select 'Putnam', 'Palatka' union 
select 'Putnam', 'Pomona Park' union 
select 'Putnam', 'Putnam Hall' union 
select 'Putnam', 'San Mateo' union 
select 'Putnam', 'Satsuma' union 
select 'Putnam', 'Welaka' union 
select 'Saint Johns', 'Elkton' union 
select 'Saint Johns', 'Hastings' union 
select 'Saint Johns', 'Jacksonville' union 
select 'Saint Johns', 'Ponte Vedra' union 
select 'Saint Johns', 'Ponte Vedra Beach' union 
select 'Saint Johns', 'Saint Augustine' union 
select 'Saint Johns', 'Saint Johns' union 
select 'Saint Lucie', 'Fort Pierce' union 
select 'Saint Lucie', 'Port Saint Lucie' union 
select 'Santa Rosa', 'Bagdad' union 
select 'Santa Rosa', 'Gulf Breeze' union 
select 'Santa Rosa', 'Jay' union 
select 'Santa Rosa', 'Milton' union 
select 'Santa Rosa', 'Navarre' union 
select 'Sarasota', 'Englewood' union 
select 'Sarasota', 'Laurel' union 
select 'Sarasota', 'Longboat Key' union 
select 'Sarasota', 'Nokomis' union 
select 'Sarasota', 'North Port' union 
select 'Sarasota', 'Osprey' union 
select 'Sarasota', 'Sarasota' union 
select 'Sarasota', 'Venice' union 
select 'Seminole', 'Altamonte Springs' union 
select 'Seminole', 'Casselberry' union 
select 'Seminole', 'Geneva' union 
select 'Seminole', 'Goldenrod' union 
select 'Seminole', 'Lake Mary' union 
select 'Seminole', 'Lake Monroe' union 
select 'Seminole', 'Longwood' union 
select 'Seminole', 'Mid Florida' union 
select 'Seminole', 'Oviedo' union 
select 'Seminole', 'Sanford' union 
select 'Seminole', 'Winter Springs' union 
select 'Sumter', 'Bushnell' union 
select 'Sumter', 'Center Hill' union 
select 'Sumter', 'Coleman' union 
select 'Sumter', 'Lake Panasoffkee' union 
select 'Sumter', 'Oxford' union 
select 'Sumter', 'Sumterville' union 
select 'Sumter', 'The Villages' union 
select 'Sumter', 'Webster' union 
select 'Sumter', 'Wildwood' union 
select 'Suwannee', 'Branford' union 
select 'Suwannee', 'Live Oak' union 
select 'Suwannee', 'McAlpin' union 
select 'Suwannee', 'O Brien' union 
select 'Suwannee', 'Wellborn' union 
select 'Taylor', 'Perry' union 
select 'Taylor', 'Salem' union 
select 'Taylor', 'Shady Grove' union 
select 'Taylor', 'Steinhatchee' union 
select 'Union', 'Lake Butler' union 
select 'Union', 'Raiford' union 
select 'Union', 'Worthington Springs' union 
select 'Volusia', 'Barberville' union 
select 'Volusia', 'Cassadaga' union 
select 'Volusia', 'Daytona Beach' union 
select 'Volusia', 'De Leon Springs' union 
select 'Volusia', 'Debary' union 
select 'Volusia', 'Deland' union 
select 'Volusia', 'Deltona' union 
select 'Volusia', 'Edgewater' union 
select 'Volusia', 'Glenwood' union 
select 'Volusia', 'Lake Helen' union 
select 'Volusia', 'New Smyrna Beach' union 
select 'Volusia', 'Oak Hill' union 
select 'Volusia', 'Orange City' union 
select 'Volusia', 'Ormond Beach' union 
select 'Volusia', 'Osteen' union 
select 'Volusia', 'Pierson' union 
select 'Volusia', 'Port Orange' union 
select 'Volusia', 'Seville' union 
select 'Wakulla', 'Crawfordville' union 
select 'Wakulla', 'Panacea' union 
select 'Wakulla', 'Saint Marks' union 
select 'Wakulla', 'Sopchoppy' union 
select 'Walton', 'Argyle' union 
select 'Walton', 'Defuniak Springs' union 
select 'Walton', 'Freeport' union 
select 'Walton', 'Laurel Hill' union 
select 'Walton', 'Miramar Beach' union 
select 'Walton', 'Mossy Head' union 
select 'Walton', 'Paxton' union 
select 'Walton', 'Rosemary Beach' union 
select 'Walton', 'Santa Rosa Beach' union 
select 'Washington', 'Caryville' union 
select 'Washington', 'Chipley' union 
select 'Washington', 'Ebro' union 
select 'Washington', 'Vernon' union 
select 'Washington', 'Wausau'