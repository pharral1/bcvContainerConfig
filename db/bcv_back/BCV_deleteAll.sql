# Joseph Picolo
# CMSC 447: Next Century Baltimore Crime Visualizer
# BCV_deleteAll.sql

USE baltimoreCrimeData;

# Deletion statements to clear database tables.
DELETE FROM CrimeInstances;
DELETE FROM CrimeTypes;
DELETE FROM LocationData;
DELETE FROM InputData;