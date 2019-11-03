# Joseph Picolo
# CMSC 447: Next Century Baltimore Crime Visualizer
# BCV_loadAll.sql

#'/var/lib/mysql-files/'

USE baltimoreCrimeData;

# Process to grab .csv file from soecified directory. The data is then sent into staging table
# "InputData" to be broken up into three sub tables, crimeTypes, LocaitonData, and crimeInstances.

LOAD DATA LOCAL INFILE  './BPD_Part_1_Victim_Based_Crime_Data_Sorted.txt'
INTO TABLE InputData
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@crimedate,crimetime,crimecode,location,description,@inside_outside,
weapon,post,district,neighborhood,longitude,latitude,location1,premise,vri_name1,total_incidents);


# Insertion statements that queries InputData and inserts the corresponding rows into
# the assigned tables

INSERT INTO CrimeTypes (crimeCode, description, crimeId)
	SELECT crimeCode, description, crimeId		
    FROM InputData;
    
INSERT INTO LocationData (location, inside_outside, post, district, neighborhood, 
longitude, latitude, location1, premise, vri_name1, crimeId)
	SELECT location, inside_outside, post, district, neighborhood, 
    longitude, latitude, location1, premise, vri_name1, crimeId
    FROM InputData;
    
INSERT INTO CrimeInstances (crimeDate, crimeTime, crimeCode, weapon, total_incidents, crimeId)
	SELECT DISTINCT crimeDate, crimeTime, crimeCode, weapon, total_incidents, crimeId
    FROM InputData;
    

# After all data is broken up into the three subtables, InputData is no longer used and thusly emptied.
# DELETE FROM InputData;
