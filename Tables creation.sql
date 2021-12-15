-- Pre-run sanitization

ALTER TABLE Receipts DROP FOREIGN KEY UserID_FK;
ALTER TABLE Tickets DROP FOREIGN KEY ConfirmationNb_FK;
ALTER TABLE Tickets DROP FOREIGN KEY PassengerID_FK;
ALTER TABLE Tickets DROP FOREIGN KEY TripNb_Tickets_FK;
ALTER TABLE Trips DROP FOREIGN KEY RouteID_FK;
ALTER TABLE Trips DROP FOREIGN KEY TrainNb_FK;
ALTER TABLE Fare DROP FOREIGN KEY TripNb_Fare_FK;
ALTER TABLE Users DROP CHECK chk_Sub;
ALTER TABLE Tickets DROP CHECK chk_Tickets_Class;
ALTER TABLE Passengers DROP CHECK chk_Passengers_AgeCat;
ALTER TABLE Fare DROP CHECK chk_Fare_AgeCat;
ALTER TABLE Fare DROP CHECK chk_Fare_Class;
ALTER TABLE Routes DROP PRIMARY KEY;
ALTER TABLE Trains DROP PRIMARY KEY;
ALTER TABLE Users DROP PRIMARY KEY;
ALTER TABLE Receipts DROP PRIMARY KEY;
ALTER TABLE Tickets DROP PRIMARY KEY;
ALTER TABLE Passengers DROP PRIMARY KEY;
ALTER TABLE Trips DROP PRIMARY KEY;
ALTER TABLE Fare DROP PRIMARY KEY;

DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Receipts;
DROP TABLE IF EXISTS Tickets;
DROP TABLE IF EXISTS Passengers;
DROP TABLE IF EXISTS Trips;
DROP TABLE IF EXISTS Fare;
DROP TABLE IF EXISTS Routes;
DROP TABLE IF EXISTS Trains;

-- Create tables

CREATE TABLE Users (
	UserID				INT,
	FirstName			VARCHAR(30)		NOT NULL,
	LastName			VARCHAR(30)		NOT NULL,
	Email				VARCHAR(100)	NOT NULL	UNIQUE,
	Password			VARCHAR(30)		NOT NULL,
	Subscription		CHAR(3)			NOT NULL,
	PostalCode			CHAR(6)			NOT NULL,
	Province			VARCHAR(50)		NOT NULL,
	Country				VARCHAR(50)		NOT NULL,
	PhoneNumber			VARCHAR(12)		NOT NULL,
	CONSTRAINT UserID_PK PRIMARY KEY (UserID),
	CONSTRAINT chk_Sub CHECK (Subscription IN ('Yes', 'No'))
	);

CREATE TABLE Receipts (
	ConfirmationNb		CHAR(6),
	UserID				INT,
	TotalFare			INT				NOT NULL,
	PaymentMethod		VARCHAR(30)		NOT NULL,
	ReceiptDate			DATE 			NOT NULL,
	CONSTRAINT ConfirmationNb_PK PRIMARY KEY (ConfirmationNb),
	CONSTRAINT UserID_FK FOREIGN KEY (UserID) REFERENCES Users(UserID)
	);

CREATE TABLE Passengers (
	PassengerID			INT,
	FirstName			VARCHAR(30)		NOT NULL,
	LastName			VARCHAR(30)		NOT NULL,
	AgeCategory			CHAR(5)			NOT NULL,
	CONSTRAINT PassengerID_PK PRIMARY KEY (PassengerID),
	CONSTRAINT chk_Passengers_AgeCat CHECK (AgeCategory IN ('Child', 'Adult'))
	);

CREATE TABLE Routes (
	RouteID				CHAR(2),			
	DepartureCity		VARCHAR(40)		NOT NULL,
	ArrivalCity			VARCHAR(40)		NOT NULL,
	CONSTRAINT RouteID_PK PRIMARY KEY (RouteID)
	);

CREATE TABLE Trains (
	TrainNb				DECIMAL(4),
	Carrier				CHAR(8)			NOT NULL		DEFAULT "Via Rail",
	Capacity			DECIMAL(3)		NOT NULL,
	CONSTRAINT TrainNb_PK PRIMARY KEY (TrainNb)
	);

CREATE TABLE Trips (
	TripNb				CHAR(10),
	RouteID				CHAR(2),
	TrainNb				Decimal(4),
	TripDate			DATE  			NOT NULL,
	DepartureTime		TIME 			NOT NULL,
	ArrivalTime			TIME  			NOT NULL,
	CONSTRAINT TripNb_PK PRIMARY KEY (TripNb),
	CONSTRAINT RouteID_FK FOREIGN KEY (RouteID) REFERENCES Routes(RouteID),
	CONSTRAINT TrainNb_FK FOREIGN KEY (TrainNb) REFERENCES Trains(TrainNb)
	);

CREATE TABLE Tickets (
	TicketNb			INT, 			
	ConfirmationNb		CHAR(6),			
	PassengerID			INT,		
	TripNb				CHAR(10),		
	Class				CHAR(8)			NOT NULL,
	Car 				DECIMAL(2),		
	SeatNb				DECIMAL(3),		
	CONSTRAINT TicketNb_PK PRIMARY KEY (TicketNb),
	CONSTRAINT ConfirmationNb_FK FOREIGN KEY (ConfirmationNb) REFERENCES Receipts(ConfirmationNb),
	CONSTRAINT PassengerID_FK FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
	CONSTRAINT TripNb_Tickets_FK FOREIGN KEY (TripNb) REFERENCES Trips(TripNb),
	CONSTRAINT chk_Tickets_Class CHECK (Class IN ('Economy', 'Business'))
	);

CREATE TABLE Fare (
	TripNb				CHAR(10),
	Class				CHAR(8)			NOT NULL,
	AgeCategory			CHAR(5)			NOT NULL,
	NbOfAvailableSeats	DECIMAL(3)		NOT NULL,
	Fare				INT				NOT NULL,
	CONSTRAINT TripNb_Class_AgeC_PK PRIMARY KEY (TripNb, Class, AgeCategory),
	CONSTRAINT TripNb_Fare_FK FOREIGN KEY (TripNb) REFERENCES Trips(TripNb),
	CONSTRAINT chk_Fare_AgeCat CHECK (AgeCategory IN ('Child', 'Adult')),
	CONSTRAINT chk_Fare_Class CHECK (Class IN ('Economy', 'Business'))
	);