drop database if exists airlines;
create database airlines;
use airlines;

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
('Acme Airlines', 'AA'),
('Blue Sky Airways', 'BS'),
('Coastal Air', 'CA');

-- Insert data into Airports table
INSERT INTO Airports (AirportName, City, Country, IATACode) VALUES
('John F. Kennedy International Airport', 'New York', 'USA', 'JFK'),
('London Heathrow Airport', 'London', 'United Kingdom', 'LHR'),
('Charles de Gaulle Airport', 'Paris', 'France', 'CDG');

-- Insert data into Aircraft table
INSERT INTO Aircraft (AircraftType, Capacity) VALUES
('Boeing 737-800', 180),
('Airbus A320', 150),
('Boeing 777-300ER', 350);

-- Insert data into Flights table
INSERT INTO Flights (FlightNumber, AirlineID, OriginAirportID, DestinationAirportID, DepartureTime, ArrivalTime, AircraftID) VALUES
('AA1234', 1, 1, 2, '2023-06-15 09:00:00', '2023-06-15 11:30:00', 1),
('BS456', 2, 2, 3, '2023-06-16 14:00:00', '2023-06-16 16:15:00', 2),
('CA789', 3, 3, 1, '2023-06-17 18:00:00', '2023-06-17 21:30:00', 3);

-- Insert data into Passengers table
INSERT INTO Passengers (FirstName, LastName, Email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Michael', 'Johnson', 'michael.johnson@example.com');

-- Insert data into Reservations table
INSERT INTO Reservations (PassengerID, FlightID, SeatNumber) VALUES
(1, 1, '15A'),
(2, 2, '22B'),
(3, 3, '7C');





-- DATA FROM A SPECIFIC AIRLINE DATA
SELECT f.FlightNumber, a.AirlineName, o.AirportName AS Origin, d.AirportName AS Destination, f.DepartureTime, f.ArrivalTime
FROM Flights f
JOIN Airlines a ON f.AirlineID = a.AirlineID
JOIN Airports o ON f.OriginAirportID = o.AirportID
JOIN Airports d ON f.DestinationAirportID = d.AirportID
WHERE a.AirlineName = 'Acme Airlines';

-- ALL FLIGHTS BETWEEN TWO AIRPORTS
SELECT f.FlightNumber, a.AirlineName, o.AirportName AS Origin, d.AirportName AS Destination, f.DepartureTime, f.ArrivalTime
FROM Flights f
JOIN Airlines a ON f.AirlineID = a.AirlineID
JOIN Airports o ON f.OriginAirportID = o.AirportID
JOIN Airports d ON f.DestinationAirportID = d.AirportID
WHERE o.AirportName = 'John F. Kennedy International Airport' AND d.AirportName = 'London Heathrow Airport';

-- ALL RESERVATIONS FOR A SPECIFIC PASSENGER
SELECT p.FirstName, p.LastName, f.FlightNumber, a.AirlineName, o.AirportName AS Origin, d.AirportName AS Destination, r.SeatNumber
FROM Reservations r
JOIN Passengers p ON r.PassengerID = p.PassengerID
JOIN Flights f ON r.FlightID = f.FlightID
JOIN Airlines a ON f.AirlineID = a.AirlineID
JOIN Airports o ON f.OriginAirportID = o.AirportID
JOIN Airports d ON f.DestinationAirportID = d.AirportID
WHERE p.FirstName = 'John' AND p.LastName = 'Doe';

-- NUMBER OF SEATS AVAILABLE ON A FLIGHT
SELECT f.FlightNumber, a.AircraftType, a.Capacity - COUNT(r.ReservationID) AS AvailableSeats
FROM Flights f
JOIN Aircraft a ON f.AircraftID = a.AircraftID
LEFT JOIN Reservations r ON f.FlightID = r.FlightID
WHERE f.FlightNumber = 'AA1234'
GROUP BY f.FlightNumber, a.AircraftType, a.Capacity;

