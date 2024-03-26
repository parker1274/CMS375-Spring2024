drop database if exists airlines1;
create database airlines1;
use airlines1;

-- Airline Schema
CREATE TABLE Airlines (
    AirlineID INT AUTO_INCREMENT PRIMARY KEY,
    AirlineName VARCHAR(255) NOT NULL,
    IATACode CHAR(2) UNIQUE NOT NULL
);

-- Airport Schema
CREATE TABLE Airports (
    AirportID INT AUTO_INCREMENT PRIMARY KEY,
    AirportName VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL,
    Country VARCHAR(255) NOT NULL,
    IATACode CHAR(3) UNIQUE NOT NULL
);

-- Aircraft Schema
CREATE TABLE Aircraft (
    AircraftID INT AUTO_INCREMENT PRIMARY KEY,
    AircraftType VARCHAR(255) NOT NULL,
    Capacity INT NOT NULL
);

-- Flight Schema
CREATE TABLE Flights (
    FlightID INT AUTO_INCREMENT PRIMARY KEY,
    FlightNumber VARCHAR(10) NOT NULL,
    AirlineID INT NOT NULL,
    OriginAirportID INT NOT NULL,
    DestinationAirportID INT NOT NULL,
    DepartureTime DATETIME NOT NULL,
    ArrivalTime DATETIME NOT NULL,
    AircraftID INT NOT NULL,
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID),
    FOREIGN KEY (OriginAirportID) REFERENCES Airports(AirportID),
    FOREIGN KEY (DestinationAirportID) REFERENCES Airports(AirportID),
    FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID)
);

-- Passenger Schema
CREATE TABLE Passengers (
    PassengerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

-- Reservation Schema
CREATE TABLE Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    PassengerID INT NOT NULL,
    FlightID INT NOT NULL,
    SeatNumber VARCHAR(10) NOT NULL,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

-- add instances to schemas
-- Insert data into Airlines table
INSERT INTO Airlines (AirlineName, IATACode) VALUES
('Delta Air Lines', 'DL'),
('United Airlines', 'UA'),
('American Airlines', 'AA'),
('Southwest Airlines', 'WN'),
('Lufthansa', 'LH'),
('Air France', 'AF'),
('British Airways', 'BA'),
('Qantas', 'QF'),
('Emirates', 'EK'),
('Singapore Airlines', 'SQ');


-- Insert data into Airports table
INSERT INTO Airports (AirportName, City, Country, IATACode) VALUES
('John F. Kennedy International Airport', 'New York', 'USA', 'JFK'),
('London Heathrow Airport', 'London', 'United Kingdom', 'LHR'),
('Charles de Gaulle Airport', 'Paris', 'France', 'CDG'),
('Hartsfield-Jackson Atlanta International Airport', 'Atlanta', 'USA', 'ATL'), -- Delta Air Lines
('Chicago OHare International Airport', 'Chicago', 'USA', 'ORD'), -- United Airlines
('Dallas/Fort Worth International Airport', 'Dallas', 'USA', 'DFW'), -- American Airlines
('Denver International Airport', 'Denver', 'USA', 'DEN'), -- Southwest Airlines
('Frankfurt Airport', 'Frankfurt', 'Germany', 'FRA'), -- Lufthansa
('Amsterdam Airport Schiphol', 'Amsterdam', 'Netherlands', 'AMS'), -- KLM
('Dubai International Airport', 'Dubai', 'UAE', 'DXB'), -- Emirates
('Changi Airport', 'Singapore', 'Singapore', 'SIN'), -- Singapore Airlines
('Sydney Kingsford Smith Airport', 'Sydney', 'Australia', 'SYD'); -- Qantas


-- Insert data into Aircraft table
INSERT INTO Aircraft (AircraftType, Capacity) VALUES
('Boeing 737-800', 180),
('Airbus A320', 150),
('Boeing 777-300ER', 350),
('Airbus A380', 525), -- Emirates
('Boeing 787-9 Dreamliner', 290), -- Qantas, United Airlines
('Airbus A350-900', 325), -- Singapore Airlines, Lufthansa
('Boeing 737 MAX 8', 178), -- Southwest Airlines, United Airlines
('Airbus A330-300', 277), -- Delta Air Lines, Lufthansa
('Boeing 747-400', 416), -- British Airways
('Embraer E190', 100), -- American Airlines for regional routes
('Airbus A319', 134); -- American Airlines, Delta Air Lines for shorter routes


-- Insert data into Flights table
INSERT INTO Flights (FlightNumber, AirlineID, OriginAirportID, DestinationAirportID, DepartureTime, ArrivalTime, AircraftID) VALUES
('AA1234', 1, 1, 2, '2023-06-15 09:00:00', '2023-06-15 11:30:00', 1), 
('BS456', 2, 2, 3, '2023-06-16 14:00:00', '2023-06-16 16:15:00', 2),
('CA789', 3, 3, 1, '2023-06-17 18:00:00', '2023-06-17 21:30:00', 3),
('DL2468', 4, 4, 5, '2023-06-18 06:00:00', '2023-06-18 08:30:00', 8), -- Delta from Atlanta to Chicago
('UA1011', 5, 5, 6, '2023-06-19 10:00:00', '2023-06-19 11:45:00', 5), -- United from Chicago to Dallas
('AA3322', 6, 6, 7, '2023-06-20 12:30:00', '2023-06-20 14:15:00', 10), -- American from Dallas to Denver 
('WN678', 7, 7, 1, '2023-06-21 07:00:00', '2023-06-21 11:00:00', 7), -- Southwest from Denver to New York
('LH890', 8, 8, 9, '2023-06-22 09:30:00', '2023-06-22 11:45:00', 6), -- Lufthansa from Frankfurt to Amsterdam
('EK215', 9, 10, 11, '2023-06-23 08:00:00', '2023-06-23 16:30:00', 4), -- Emirates from Dubai to Singapore
('QF127', 10, 12, 11, '2023-06-24 22:00:00', '2023-06-25 06:15:00', 5); -- Qantas from Sydney to Singapore


-- Insert data into Passengers table
INSERT INTO Passengers (FirstName, LastName, Email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Michael', 'Johnson', 'michael.johnson@example.com'),
('David', 'Williams', 'david.williams@email.com'),
('Emily', 'Jones', 'emily.jones@email.com'),
('Christopher', 'Brown', 'chris.brown@email.com'),
('Sarah', 'Davis', 'sarah.davis@email.com'),
('Matthew', 'Miller', 'matt.miller@email.com'),
('Ashley', 'Wilson', 'ashley.wilson@email.com'),
('Daniel', 'Moore', 'daniel.moore@email.com'),
('Jessica', 'Garcia', 'jessica.garcia@email.com'),
('Andrew', 'Taylor', 'andrew.taylor@email.com'),
('Sophia', 'Martinez', 'sophia.martinez@email.com'),
('Benjamin', 'Anderson', 'benjamin.anderson@email.com'),
('Olivia', 'Thomas', 'olivia.thomas@email.com'),
('William', 'Jackson', 'william.jackson@email.com'),
('Emma', 'White', 'emma.white@email.com');

-- Insert data into Reservations table
INSERT INTO Reservations (PassengerID, FlightID, SeatNumber) VALUES
((SELECT PassengerID FROM Passengers WHERE Email = 'jessica.garcia@email.com'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'DL2468'), '15A'),
((SELECT PassengerID FROM Passengers WHERE Email = 'andrew.taylor@email.com'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'UA1011'), '22B'),
((SELECT PassengerID FROM Passengers WHERE Email = 'sophia.martinez@email.com'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'AA3322'), '8C'),
((SELECT PassengerID FROM Passengers WHERE Email = 'benjamin.anderson@email.com'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'WN678'), '30D'),
((SELECT PassengerID FROM Passengers WHERE Email = 'olivia.thomas@email.com'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'LH890'), '14E'),
((SELECT PassengerID FROM Passengers WHERE Email = 'william.jackson@email.com'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'EK215'), '42F'),
((SELECT PassengerID FROM Passengers WHERE Email = 'emma.white@email.com'), (SELECT FlightID FROM Flights WHERE FlightNumber = 'QF127'), '18G');

SELECT * FROM Reservations;

