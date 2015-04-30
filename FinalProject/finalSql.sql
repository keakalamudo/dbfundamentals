
/******************************************************************************  
CECS 323 Final Project Data Description

Date: April 28, 2015

Samuel Jacobs
Gordon Chen
Kelo Akalamudo
Rodney Bunkley

******************************************************************************/  

/*******************************************************************************
Airline

This table models an airline. Its PK is the ICAO designation.
It is used in the flight table and in the airportairline table
*/
/* Create the Airport Table */
CREATE TABLE Airline (
	AirlineIcaoCode 			VARCHAR(256) 		NOT NULL,	/* PK */
	AirlineName					VARCHAR(256),
	AirlineHeadquarters			VARCHAR(256)
); /* End of Creation of Airline Table */

/* Set up the Primary Key */
ALTER TABLE Airline
ADD CONSTRAINT AirlinePrimaryKey
PRIMARY KEY (AirlineIcaoCode);

/*******************************************************************************
Airport 

This table models an airport. Flights arrive and depart from an airport. There
are multiple airlines at each airport.
*/
CREATE TABLE Airport (
	AirportFaaCode 				VARCHAR(256) 		NOT NULL,	/* PK */
	AirpotName					VARCHAR(256),
	AirportLocation				VARCHAR(256)
); /* End of Creation of Airport Table */

/* Set up the Primary Key */
ALTER TABLE Airport
ADD CONSTRAINT AirportPrimaryKey
PRIMARY KEY (AirportFaaCode);


/*******************************************************************************
AirportAirline 

This table models an airline's presence at an airport. 
*/
create table AirportAirline (
	AirportAirlineTerminal 		VARCHAR(256) 		NOT NULL,	/* PK */
	AirlineIcaoCode 			VARCHAR(256) 		NOT NULL,	/* FK(Airline) -> PK */
	AirportFaaCode 				VARCHAR(256) 		NOT NULL,	/* FK(Airport) -> PK */

); /* End of Creation of Name Table */

/* Set up the Primary Keys */
ALTER TABLE AirportAirline
ADD CONSTRAINT AirportPrimaryKey
PRIMARY KEY (AirlineIcaoCode, AirportFaaCode);

/* Set up the AirlineIcaoCode Foreign Key */
ALTER TABLE AirportAirline
ADD CONSTRAINT  AirlineIcaoCodeForeignKey
FOREIGN KEY (AirlineIcaoCode)
REFERENCES Airline (AirlineIcaoCode);

/* Set up the AirportFaaCode Foreign Key */
ALTER TABLE AirportAirline
ADD CONSTRAINT  AirportFaaCodeForeignKey
FOREIGN KEY (AirportFaaCode)
REFERENCES Airport (AirportFaaCode);

/*******************************************************************************
Name 

Description
*/
create table Name (
	Attr 						VARCHAR(256) 		not null,	/* PK */

); /* End of Creation of Name Table */

/*
	THIS IS THE TEMPLATE THIS IS THE TEMPLATE THIS IS THE TEMPLATE
*/
/*******************************************************************************
Name 

Description
*/
create table Name (
	Attr 						VARCHAR(256) 		not null,	/* PK */

); /* End of Creation of Name Table */