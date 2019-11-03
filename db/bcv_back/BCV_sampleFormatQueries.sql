# Joseph Picolo
# CMSC 447: Next Century Baltimore Crime Visualizer
# BCV_triggersAll.sql

# QUERY TESTING FOR EXAMPLE TABLES
# Talbes at this url: https://imgur.com/a/3Y715SM

#Tables have been modified to work with new database design.

USE baltimoreCrimeData;

# Table 3, 7, and 8

# Query from the "already-joined" table
SELECT weapon, count(crimeId) AS counter
FROM InputData
GROUP BY weapon
ORDER BY counter DESC;

#Query from the three joined sub-tables
SELECT weapon, count(crimeId) AS counter
FROM CrimeInstances NATURAL JOIN Crimetypes NATURAL JOIN LocationData
GROUP BY weapon
ORDER BY counter DESC;

# Table 5
SELECT description, count(crimeId) AS counter
FROM Crimetypes
GROUP BY description
ORDER BY counter DESC;

# Table 6
SELECT district, count(crimeId) AS counter
FROM LocationData 
GROUP BY district
ORDER BY counter DESC;

