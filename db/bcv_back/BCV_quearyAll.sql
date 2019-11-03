# Joseph Picolo
# CMSC 447: Next Century Baltimore Crime Visualizer
# BCV_quearyAll.sql

# ---> Sample queries for testing purposes

#SHOW VARIABLES LIKE "secure_file_priv";

USE baltimoreCrimeData;

# These two queries would return the same thing, except after the insert functions are run
# the table InputData is cleared out. Comment out that line at the bottom of BCV_loadAll to test this.
SELECT * FROM InputData
order by crimeId;

Select * 
from crimeInstances natural join locationData natural join crimetypes
order by crimeId;

