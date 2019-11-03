Database Change Notes 10/5:

To split the crime data into multiple parts, we are now using four tables, InputData (the staging table), crimeTypes, LocationData, and crimeInstances.
Input is taken from the .csv and inserted into the staging table. From there it is divided into the three sub tables, then the staging table is emptied out.

To obtain a query of all the original data, we must use this:
	SELECT * 
	FROM crimeInstances NATURAL JOIN LocationData NATURAL JOIN crimeTypes
	ORDER BY crimeId;

All crimeInstances share a unique crimeId with their corresponding row in LocationData. This is made possible by giving a row a unique ID in the staging table and giving both rows in the subtables the same ID value.

CrimeInstances has a FOREIGN KEY pointing to the crimeCode in the table CrimeTypes.

BCV_triggersAll is no longer used as I merged the trigger functions into the BCV_createAll file.

Example of queries that we will likely use are found in BCV_sampleFormatQueries.

A tenative index has been created on crimeDate in BCV_createAll using a BTree data structure.


