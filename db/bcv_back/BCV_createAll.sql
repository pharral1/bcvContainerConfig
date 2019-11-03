#Joseph Picolo
#CMSC 447: Next Century Baltimore Crime Visualizer
#BCV_createAll.sql

# Statements to initialize and set up the database.
CREATE DATABASE if not exists baltimoreCrimeData;
USE baltimoreCrimeData;
SET SQL_SAFE_UPDATES = 0;
SET SESSION sql_mode = '';


# Statements to drop tables before they get reinstated.
DROP TABLE IF EXISTS CrimeInstances;
DROP TABLE IF EXISTS CrimeTypes;
DROP TABLE IF EXISTS LocationData;
DROP TABLE IF EXISTS InputData;


#Statemetents to make the four tables used in the database.
CREATE TABLE IF NOT EXISTS InputData
(
  crimeDate					DATE 			DEFAULT NULL,
  crimeTime					TIME 			DEFAULT NULL,
  crimeCode					VARCHAR(8) 		DEFAULT NULL,
  location					VARCHAR(64)		DEFAULT NULL,
  description				VARCHAR(64) 	DEFAULT NULL,
  inside_outside			VARCHAR(7)		DEFAULT NULL, 
  weapon					VARCHAR(64)  	DEFAULT NULL,
  post						INT				DEFAULT NULL,
  district					VARCHAR(64) 	DEFAULT NULL,
  neighborhood				VARCHAR(64) 	DEFAULT NULL,
  longitude					DECIMAL(10, 8)  DEFAULT NULL,
  latitude					DECIMAL(10, 8)  DEFAULT NULL,
  location1					VARCHAR(48) 	DEFAULT NULL,
  premise					VARCHAR(48) 	DEFAULT NULL,
  vri_name1					VARCHAR(64) 	DEFAULT NULL,
  total_incidents			INT 			DEFAULT NULL,
  crimeId					INT 			NOT NULL UNIQUE AUTO_INCREMENT, 
  PRIMARY KEY (crimeId)
);

CREATE TABLE IF NOT EXISTS CrimeTypes
(
  crimeCode					VARCHAR(8) 		DEFAULT NULL,
  description				VARCHAR(64) 	DEFAULT NULL,
  crimeId					INT 			NOT NULL UNIQUE, 
  PRIMARY KEY (crimeId)
);

CREATE TABLE IF NOT EXISTS LocationData
(
  location					VARCHAR(64)		DEFAULT NULL,
  inside_outside			VARCHAR(7)		DEFAULT NULL, 
  post						INT				DEFAULT NULL,
  district					VARCHAR(64) 	DEFAULT NULL,
  neighborhood				VARCHAR(64) 	DEFAULT NULL,
  longitude					DECIMAL(10, 8)  DEFAULT NULL,
  latitude					DECIMAL(10, 8)  DEFAULT NULL,
  location1					VARCHAR(48) 	DEFAULT NULL,
  premise					VARCHAR(48) 	DEFAULT NULL,
  vri_name1					VARCHAR(64) 	DEFAULT NULL,
  crimeId					INT 			NOT NULL UNIQUE, 
  PRIMARY KEY (crimeId)
);

CREATE TABLE IF NOT EXISTS CrimeInstances
(
  crimeDate					DATE 			DEFAULT NULL,
  crimeTime					TIME 			DEFAULT NULL,
  crimeCode					VARCHAR(8) 		DEFAULT NULL,
  weapon					VARCHAR(64)  	DEFAULT NULL,
  total_incidents			INT 			DEFAULT NULL,
  crimeId					INT 			NOT NULL UNIQUE, 
  PRIMARY KEY (crimeId)
);

# Statements to create indexes.
CREATE INDEX cDate on CrimeInstances(crimeDate) USING BTREE;

# Statements to drop triggers before they get reinstated.
DROP TRIGGER IF EXISTS DateConvert;
DROP TRIGGER IF EXISTS InOutConvert;


# Trigger to turn crimeDate into a usable DATE format on the staging table InputData.
DELIMITER //
CREATE TRIGGER DateConvert 
	BEFORE INSERT ON InputData 
	FOR EACH ROW 
BEGIN
    SET NEW.crimeDate = STR_TO_DATE(@crimedate, '%m/%d/%Y');
END//
DELIMITER ;


# Trigger to convert all inside_outside values into a varchar(7) "Inside" or "Outside" value
# in the staging table InputData.
DELIMITER //
CREATE TRIGGER InOutConvert 
	BEFORE INSERT ON InputData 
	FOR EACH ROW  
BEGIN 
    IF STRCMP (@inside_outside, 'Inside') = 0 OR STRCMP (@inside_outside, 'I') = 0 THEN
		SET NEW.inside_outside = 'Inside';
	ELSEIF STRCMP (@inside_outside, 'Outside') = 0 OR STRCMP (@inside_outside, 'O') = 0 THEN
		SET NEW.inside_outside = 'Outside';
	ELSE
		SET NEW.inside_outside = '';
	END IF;
END//
DELIMITER ;