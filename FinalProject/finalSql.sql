
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
	IcaoCode 				VARCHAR(8) 			NOT NULL,	/* PK */
	Name					VARCHAR(64),
	Headquarters			VARCHAR(32)
); /* End of Creation of Airline Table */

/* Set up the Primary Key */
ALTER TABLE Airline
ADD CONSTRAINT AirlinePrimaryKey
PRIMARY KEY (IcaoCode);

/*******************************************************************************
Airport 

This table models an airport. Flights arrive and depart from an airport. There
are multiple airlines at each airport.
*/
CREATE TABLE Airport (
	FaaCode 				VARCHAR(16) 		NOT NULL,	/* PK */
	Name					VARCHAR(256),
	Location				VARCHAR(256)
); /* End of Creation of Airport Table */

/* Set up the Primary Key */
ALTER TABLE Airport
ADD CONSTRAINT AirportPrimaryKey
PRIMARY KEY (FaaCode);


/*******************************************************************************
AirportAirline 

This table models an airline's presence at an airport. 
*/
create table AirportAirline (
	Terminal 				VARCHAR(64) 		NOT NULL,	/* PK */
	IcaoCode 				VARCHAR(8) 			NOT NULL,	/* FK(Airline) -> PK */
	FaaCode 				VARCHAR(8) 			NOT NULL,	/* FK(Airport) -> PK */

); /* End of Creation of Name Table */



/* Set up the AirlineIcaoCode Foreign Key */
ALTER TABLE AirportAirline
ADD CONSTRAINT  AirlineIcaoCodeForeignKey
FOREIGN KEY (IcaoCode)
REFERENCES Airline (IcaoCode);

/* Set up the AirportFaaCode Foreign Key */
ALTER TABLE AirportAirline
ADD CONSTRAINT  AirportFaaCodeForeignKey
FOREIGN KEY (FaaCode)
REFERENCES Airport (FaaCode);

/* Set up the Primary Keys */
ALTER TABLE AirportAirline
ADD CONSTRAINT AirportPrimaryKey
PRIMARY KEY (IcaoCode, FaaCode);

/*******************************************************************************
Aircraft 

Description
*/
create table Aircraft (
	TailNumber 					VARCHAR(64) 		NOT NULL,	/* PK */
	Name 						VARCHAR(64),
	NumberOfPassengers 			Int,
	Model 						VARCHAR(64),

); /* End of Creation of Aircraft Table*/
/* Set up the Primary Keys */
ALTER TABLE Aircraft
ADD CONSTRAINT AircraftPrimaryKey
PRIMARY KEY (TailNumber);


/*******************************************************************************
Flight 

Description
*/
create table Flight (
	FlightId 					Int 				NOT NULL,	/* PK */
	DepartureTime				Date,
	ArrivalTime					Date,
	FlightType					Varchar(64),


); /* End of Creation of Flight Table*/
/* Set up the Primary Keys */
ALTER TABLE Flight
ADD CONSTRAINT FlightPrimaryKey
PRIMARY KEY ();




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