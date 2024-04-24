drop database if exists WPAirways;
create database WPAirways;
use WPAirways;

-- Airport Schema
CREATE TABLE Airports (
    AirportID INT AUTO_INCREMENT PRIMARY KEY,
    AirportName VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL,
    Country VARCHAR(255) NOT NULL,
    IATACode CHAR(3) UNIQUE NOT NULL
);

-- Flight Schema
CREATE TABLE Flights (
    FlightID INT AUTO_INCREMENT PRIMARY KEY,
    FlightNumber VARCHAR(10) NOT NULL,
    OriginAirportID INT NOT NULL,
    DestinationAirportID INT NOT NULL,
    DepartureTime DATETIME NOT NULL,
    ArrivalTime DATETIME NOT NULL
);

-- Passenger Schema
CREATE TABLE Passengers (
    PassengerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Phone BIGINT NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

-- Bookings
CREATE TABLE Bookings (
    ReferenceID INT AUTO_INCREMENT PRIMARY KEY,
    PassengerID INT NOT NULL,
    BookingDate DATETIME NOT NULL,
    FlightID INT NOT NULL,
    SeatNumber VARCHAR(10) NOT NULL
);


-- flights have one dep. airport, one arrival airport (one-to-one)
-- a booking is associated with one flight and one passenger (one-to-one)


-- generate sample instances
-- Airports
INSERT INTO Airports (AirportName, City, Country, IATACode) VALUES
('Orlando International Airport', 'Orlando', 'USA', 'MCO'),
('Los Angeles International Airport', 'Los Angeles', 'USA', 'LAX'),
('John F. Kennedy International Airport', 'New York City', 'USA', 'JFK'),
('Heathrow Airport', 'London', 'United Kingdom', 'LHR'),
('Charles de Gaulle Airport', 'Paris', 'France', 'CDG'),
('Dubai International Airport', 'Dubai', 'United Arab Emirates', 'DXB'),
('Suvarnabhumi Airport', 'Bangkok', 'Thailand', 'BKK'),
('Narita International Airport', 'Tokyo', 'Japan', 'NRT'),
('Sydney Airport', 'Sydney', 'Australia', 'SYD'),
('Beijing Capital International Airport', 'Beijing', 'China', 'PEK');

-- Flights
INSERT INTO Flights (FlightNumber, OriginAirportID, DestinationAirportID, DepartureTime, ArrivalTime) VALUES
('WP101', 1, 2, '2023-05-01 08:00:00', '2023-05-01 10:30:00'),
('WP202', 2, 3, '2023-05-02 12:00:00', '2023-05-02 18:30:00'),
('WP303', 3, 4, '2023-05-03 14:00:00', '2023-05-04 06:30:00'),
('WP404', 4, 5, '2023-05-04 09:00:00', '2023-05-04 12:30:00'),
('WP505', 5, 6, '2023-05-05 16:00:00', '2023-05-06 00:30:00'),
('WP606', 6, 7, '2023-05-06 10:00:00', '2023-05-06 17:30:00'),
('WP707', 7, 8, '2023-05-07 14:00:00', '2023-05-08 04:30:00'),
('WP808', 8, 9, '2023-05-08 08:00:00', '2023-05-09 08:30:00'),
('WP909', 9, 10, '2023-05-09 12:00:00', '2023-05-10 04:30:00'),
('WP1010', 10, 1, '2023-05-10 16:00:00', '2023-05-11 06:30:00');

-- Passengers
INSERT INTO Passengers (FirstName, LastName, Phone, Email) VALUES
('John', 'Doe', 1234567890, 'john.doe@example.com'),
('Jane', 'Smith', 1234567891, 'jane.smith@example.com'),
('Michael', 'Johnson', 1634567891, 'michael.johnson@example.com'),
('Emily', 'Brown', 7778889996, 'emily.brown@example.com'),
('David', 'Wilson', 3334445556, 'david.wilson@example.com'),
('Sarah', 'Davis', 6667778889, 'sarah.davis@example.com'),
('Daniel', 'Taylor', 2223334444, 'daniel.taylor@example.com'),
('Olivia', 'Anderson', 9998887777, 'olivia.anderson@example.com'),
('William', 'Thomas', 5556667777, 'william.thomas@example.com'),
('Sophia', 'Martinez', 1112223333, 'sophia.martinez@example.com');

-- Bookings
INSERT INTO Bookings (PassengerID, BookingDate, FlightID, SeatNumber) VALUES
(1, '2023-04-20 10:00:00', 1, '12A'),
(2, '2023-04-21 12:00:00', 2, '20B'),
(3, '2023-04-22 14:00:00', 3, '35C'),
(4, '2023-04-23 16:00:00', 4, '8D'),
(5, '2023-04-24 09:00:00', 5, '25E'),
(6, '2023-04-25 11:00:00', 6, '18F'),
(7, '2023-04-26 13:00:00', 7, '32G'),
(8, '2023-04-27 15:00:00', 8, '5H'),
(9, '2023-04-28 17:00:00', 9, '42J'),
(10, '2023-04-29 19:00:00', 10, '10K');

SELECT * FROM bookings;