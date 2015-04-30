
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
	FlightID 					VARCHAR(20) 		NOT NULL,	/* PK */
	DepartureTime				Date,
	ArrivalTime					Date,
	FlightType					Varchar(64),
	Destination					,	/* This is multivalued */
	Length						AS ArrivalTime - DepartureTime	


); /* End of Creation of Flight Table*/
/* Set up the Primary Keys */
ALTER TABLE Flight
ADD CONSTRAINT FlightPrimaryKey
PRIMARY KEY (FlightID);

/*******************************************************************************
Employee

This table models employees at an airport. 
*/
create table Employee (
	EmployeeID					VARCHAR(20) 		NOT NULL,	/* PK */
	Name 						VARCHAR(70) 		NOT NULL,	
	Email 		 				VARCHAR(60), 			
	Phone 		 				VARCHAR(20) 		NOT NULL,	
	Address 		 			VARCHAR(60),	
	HireDate 		 			DATE 		        NOT NULL,	

); /* End of Creation of Name Table */

/* Set up the Primary Keys */
ALTER TABLE Employee
ADD CONSTRAINT EmplyeeID_PK
PRIMARY KEY (EmployeeID);


/*******************************************************************************
CrewMemeber

This table models crew members at an airport. 
*/
create table CrewMember (
	EmployeeID					VARCHAR(20) 		NOT NULL,	/* PK */

); /* End of Creation of Name Table */

/* Set up the Primary Keys */
ALTER TABLE CrewMember
ADD CONSTRAINT EmplyeeID_FK
FOREIGN KEY (EmployeeID);
REFERENCES Employee (EmployeeID);


/*******************************************************************************
FlightCrew

This table models crew members at an airport. 
*/
create table FlightCrew (
	FlightDuty					VARCHAR(25)			NOT NULL,	/* PK */
	EmployeeID					VARCHAR(20) 		NOT NULL,	/* FK */
	FlightID					VARCHAR(20) 		NOT NULL,	/* FK */

); /* End of Creation of Name Table */

/* Set up the Primary Keys */
ALTER TABLE FlightCrew
ADD CONSTRAINT EmplyeeID_FK
FOREIGN KEY (EmployeeID);
REFERENCES Employee (EmployeeID);

ALTER TABLE FlightCrew
ADD CONSTRAINT FlightID_FK
FOREIGN KEY (FlightID);
REFERENCES Flight (FlightID);



/*******************************************************************************
CrewMemeber

This table models incident reports at an airport. 
*/
create table IncidenceReport (
	EmployeeID					VARCHAR(20) 		NOT NULL,	/* FK */
	FlightID					VARCHAR(70)			NOT NULL,	/* FK */
	ReportID					VARCHAR(20)			NOT NULL,   /* PK */
	IncidentDate				DATE				NOT NULL,
	Maintenance					VARCHAR(60)			NOT NULL,
	IncidentType				VARCHAR(35)			NOT NULL,
	IncidenceDescription		VARCHAR(256),

); /* End of Creation of Name Table */

/* Set up the Primary Keys */
ALTER TABLE IncidenceReport
ADD CONSTRAINT ReportID_PK
PRIMARY KEY (ReportID);
REFERENCES Employee (ReportID);

ALTER TABLE IncidenceReport
ADD CONSTRAINT EmplyeeID_FK
FOREIGN KEY (EmployeeID);
REFERENCES Employee (EmployeeID);

ALTER TABLE IncidenceReport
ADD CONSTRAINT FlightID_FK
FOREIGN KEY (FlightID);
REFERENCES Flight (FlightID);


/*******************************************************************************
Passenger

This table models passengers at an airport. 
*/
create table Passenger (
	PassengerID					VARCHAR(25)			NOT NULL,	/* PK */
	PassengerName				VARCHAR(20) 		NOT NULL,	/* FK */
	isFrequentFlier				BOOLEAN		 		NOT NULL,	/* FK */

); /* End of Creation of Name Table */

/* Set up the Primary Keys */
ALTER TABLE Passenger
ADD CONSTRAINT PassengerID_PK
PRIMARY KEY (PassengerID);

/*
	THIS IS THE TEMPLATE THIS IS THE TEMPLATE THIS IS THE TEMPLATE
*/
/*******************************************************************************
PassengerFlightAssignment

This table models Passenger flight assignment at an airport
*/
create table PassengerFlightAssignment (
	FlightID 					VARCHAR(20) 		NOT NULL,	/* FK */
	PassengerID					VARCHAR(20) 		NOT NULL,	/* FK */
	ExtraChargesId				VARCHAR(20) 		NOT NULL,	/* FK */
	SeatNumber 					VARCHAR(6) 			NOT NULL,	
	MealPreference				VARCHAR(15),	
	Baggage Count				INT,	

); /* End of Creation of Name Table */

ALTER TABLE PassengerFlightAssignment
ADD CONSTRAINT FlightID_FK
FOREIGN KEY (FlightID);
REFERENCES Flight (FlightID);

ALTER TABLE PassengerFlightAssignment
ADD CONSTRAINT PassengerID_FK
FOREIGN KEY (PassengerID);
REFERENCES Passenger (PassengerID);

ALTER TABLE PassengerFlightAssignment
ADD CONSTRAINT ExtraChargesID_FK
FOREIGN KEY (ExtraChargesID);
REFERENCES ExtraCharges (ExtraChargesID);


*/
/*******************************************************************************
PassengerFlightAssignment

This table models Passenger flight assignment at an airport
*/

CREATE TABLE ExtraCharges (
	ExtraChargesID				VARCHAR(20)			NOT NULL,	/* PK */
	Name						VARCHAR(20),
	ChargeDate					DATE,
	Amount						MONEY,
)

ALTER TABLE ExtraCharges
ADD CONSTRAINT ExtraCharges_PK
PRIMARY KEY (ExtraChargesID)



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