



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
	Name					VARCHAR(64),
	City					VARCHAR(64),
	Country					VARCHAR(64)
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
	FaaCode 				VARCHAR(8) 			NOT NULL	/* FK(Airport) -> PK */

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
	Model 						VARCHAR(64)

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
	FlightId 					VARCHAR(20) 		NOT NULL,	/* PK */
	FlightType					Varchar(64),
	Length						AS ArrivalTime - DepartureTime	


); /* End of Creation of Flight Table*/
/* Set up the Primary Keys */
ALTER TABLE Flight
ADD CONSTRAINT FlightPrimaryKey
PRIMARY KEY (FlightId);

/*******************************************************************************
Flight */
CREATE TABLE FlightSchedule (
	FlightScheduleId			VARCHAR(20)		NOT NULL, /* PK */
	FlightId 				    VARCHAR(20),
	DepartureTime				Date,
	ArrivalTime					Date,
	DepartureAirport			Varchar(64),
	ArrivalAirport				Varchar(64)

);
ALTER TABLE FlightSchedule 
ADD CONSTRAINT FlightSchedulePrimaryKey
PRIMARY KEY (FlightScheduleId)


ALTER TABLE FlightSchedule
ADD CONSTRAINT FlightScheduleForeignKey
FOREIGN KEY (FlightId);
REFERENCES Flight (FlightId);
/*******************************************************************************
Employee

This table models employees at an airport. 
*/
create table Employee (
	EmployeeId					VARCHAR(20) 		NOT NULL,	/* PK */
	Name 						VARCHAR(70) 		NOT NULL,	
	Email 		 				VARCHAR(60), 			
	Phone 		 				VARCHAR(20) 		NOT NULL,	
	Address 		 			VARCHAR(60),	
	HireDate 		 			DATE 		        NOT NULL,	

); /* End of Creation of Name Table */

/* Set up the Primary Keys */
ALTER TABLE Employee
ADD CONSTRAINT EmplyeeIdPrimaryKey
PRIMARY KEY (EmployeeId);


/*******************************************************************************
CrewMemeber

This table models crew members at an airport. 
*/
create table CrewMember (
	EmployeeId					VARCHAR(20) 		NOT NULL,	/* PK */

); /* End of Creation of Name Table */

/* Set up the Primary Keys */
ALTER TABLE CrewMember
ADD CONSTRAINT EmplyeeIdForeignKey
FOREIGN KEY (EmployeeId);
REFERENCES Employee (EmployeeId);


/*******************************************************************************
FlightCrew

This table models crew members at an airport. 
*/
create table FlightCrew (
	FlightDuty					VARCHAR(25)			NOT NULL,	/* PK */
	EmployeeId					VARCHAR(20) 		NOT NULL,	/* FK */
	FlightId					VARCHAR(20) 		NOT NULL,	/* FK */

); /* End of Creation of Name Table */

/* Set up the Primary Keys */
ALTER TABLE FlightCrew
ADD CONSTRAINT EmplyeeIdForeignKey
FOREIGN KEY (EmployeeId);
REFERENCES Employee (EmployeeId);

ALTER TABLE FlightCrew
ADD CONSTRAINT FlightIdForeignKey
FOREIGN KEY (FlightId);
REFERENCES Flight (FlightId);



/*******************************************************************************
CrewMemeber

This table models Incident reports at an airport. 
*/
create table IncidenceReport (
	EmployeeId					VARCHAR(20) 		NOT NULL,	/* FK */
	FlightId					VARCHAR(70)			NOT NULL,	/* FK */
	ReportId					VARCHAR(20)			NOT NULL,   /* PK */
	IncidentDate				DATE				NOT NULL,
	Maintenance					VARCHAR(60)			NOT NULL,
	IncidentType				VARCHAR(35)			NOT NULL,
	IncidenceDescription		VARCHAR(256),

); /* End of Creation of Name Table */

/* Set up the Primary Keys */
ALTER TABLE IncidenceReport
ADD CONSTRAINT ReportIdPrimaryKey
PRIMARY KEY (ReportId);
REFERENCES Employee (ReportId);

ALTER TABLE IncidenceReport
ADD CONSTRAINT EmplyeeIdForeignKey
FOREIGN KEY (EmployeeId);
REFERENCES Employee (EmployeeId);

ALTER TABLE IncidenceReport
ADD CONSTRAINT FlightIdForeignKey
FOREIGN KEY (FlightId);
REFERENCES Flight (FlightId);


/*******************************************************************************
Passenger

This table models passengers at an airport. 
*/
create table Passenger (
	PassengerId					VARCHAR(25)			NOT NULL,	/* PK */
	PassengerName				VARCHAR(20) 		NOT NULL,	/* FK */
	isFrequentFlier				BOOLEAN		 		NOT NULL,	/* FK */

); /* End of Creation of Name Table */

/* Set up the Primary Keys */
ALTER TABLE Passenger
ADD CONSTRAINT PassengerIdPrimaryKey
PRIMARY KEY (PassengerId);

/*
	THIS IS THE TEMPLATE THIS IS THE TEMPLATE THIS IS THE TEMPLATE
*/
/*******************************************************************************
PassengerFlightAssignment

This table models Passenger flight assignment at an airport
*/
create table PassengerFlightAssignment (
	FlightId 					VARCHAR(20) 		NOT NULL,	/* FK */
	PassengerId					VARCHAR(20) 		NOT NULL,	/* FK */
	ExtraChargesId				VARCHAR(20) 		NOT NULL,	/* FK */
	SeatNumber 					VARCHAR(6) 			NOT NULL,	
	MealPreference				VARCHAR(15),	
	Baggage Count				INT,	

); /* End of Creation of Name Table */

ALTER TABLE PassengerFlightAssignment
ADD CONSTRAINT FlightIdForeignKey
FOREIGN KEY (FlightId);
REFERENCES Flight (FlightId);

ALTER TABLE PassengerFlightAssignment
ADD CONSTRAINT PassengerIdForeignKey
FOREIGN KEY (PassengerId);
REFERENCES Passenger (PassengerId);

ALTER TABLE PassengerFlightAssignment
ADD CONSTRAINT ExtraChargesIdForeignKey
FOREIGN KEY (ExtraChargesId);
REFERENCES ExtraCharges (ExtraChargesId);


*/
/*******************************************************************************
PassengerFlightAssignment

This table models Passenger flight assignment at an airport
*/

CREATE TABLE ExtraCharges (
	ExtraChargesId				VARCHAR(20)			NOT NULL,	/* PK */
	Name						VARCHAR(20),
	ChargeDate					DATE,
	Amount						MONEY,
)

ALTER TABLE ExtraCharges
ADD CONSTRAINT ExtraChargesPrimaryKey
PRIMARY KEY (ExtraChargesId)



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