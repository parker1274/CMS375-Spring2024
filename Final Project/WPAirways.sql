-- Drop database if exists and create a new one
DROP DATABASE IF EXISTS WPAirways;
CREATE DATABASE WPAirways;
USE WPAirways;

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
    OriginAirportID VARCHAR(3) NOT NULL,
    DestinationAirportID VARCHAR(3) NOT NULL,
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

-- Airports data
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

-- Flights data
INSERT INTO Flights (FlightNumber, OriginAirportID, DestinationAirportID, DepartureTime, ArrivalTime) VALUES
('WP101', 'MCO', 'LAX', '2024-04-24 08:00:00', '2024-04-24 10:30:00'),
('WP202', 'LAX', 'JFK', '2024-04-24 12:00:00', '2024-04-24 18:30:00'),
('WP303', 'JFK', 'LHR', '2024-04-24 14:00:00', '2024-04-25 06:30:00'),
('WP404', 'LHR', 'CDG', '2024-04-24 09:00:00', '2024-04-24 12:30:00'),
('WP505', 'CDG', 'DXB', '2024-04-24 16:00:00', '2024-04-25 00:30:00'),
('WP606', 'DXB', 'BKK', '2024-04-24 10:00:00', '2024-04-24 17:30:00'),
('WP707', 'BKK', 'NRT', '2024-04-24 14:00:00', '2024-04-25 04:30:00'),
('WP808', 'NRT', 'SYD', '2024-04-24 08:00:00', '2024-04-25 08:30:00'),
('WP909', 'SYD', 'PEK', '2024-04-24 12:00:00', '2024-04-25 04:30:00'),
('WP1010', 'PEK', 'MCO', '2024-04-24 16:00:00', '2024-04-25 06:30:00'),

('WP111', 'MCO', 'LAX', '2024-04-24 11:00:00', '2024-04-24 13:30:00'),
('WP121', 'MCO', 'LAX', '2024-04-24 14:30:00', '2024-04-24 17:00:00'),
('WP131', 'MCO', 'LAX', '2024-04-24 18:00:00', '2024-04-24 20:30:00'),

('WP212', 'LAX', 'JFK', '2024-04-24 08:00:00', '2024-04-24 14:30:00'),
('WP222', 'LAX', 'JFK', '2024-04-24 15:00:00', '2024-04-24 21:30:00'),
('WP232', 'LAX', 'JFK', '2024-04-24 22:00:00', '2024-04-25 04:30:00'),

('WP313', 'JFK', 'LHR', '2024-04-24 09:00:00', '2024-04-24 21:30:00'),
('WP323', 'JFK', 'LHR', '2024-04-24 12:00:00', '2024-04-24 23:30:00'),
('WP333', 'JFK', 'LHR', '2024-04-24 15:00:00', '2024-04-25 02:30:00'),

('WP414', 'LHR', 'CDG', '2024-04-24 10:00:00', '2024-04-24 13:30:00'),
('WP424', 'LHR', 'CDG', '2024-04-24 14:00:00', '2024-04-24 17:30:00'),
('WP434', 'LHR', 'CDG', '2024-04-24 18:00:00', '2024-04-24 21:30:00'),

('WP515', 'CDG', 'DXB', '2024-04-24 07:00:00', '2024-04-24 13:30:00'),
('WP525', 'CDG', 'DXB', '2024-04-24 15:00:00', '2024-04-24 21:30:00'),
('WP535', 'CDG', 'DXB', '2024-04-24 22:00:00', '2024-04-25 04:30:00'),

('WP616', 'DXB', 'BKK', '2024-04-24 09:00:00', '2024-04-24 14:30:00'),
('WP626', 'DXB', 'BKK', '2024-04-24 15:00:00', '2024-04-24 20:30:00'),
('WP636', 'DXB', 'BKK', '2024-04-24 21:00:00', '2024-04-25 02:30:00'),

('WP717', 'BKK', 'NRT', '2024-04-24 08:00:00', '2024-04-24 15:30:00'),
('WP727', 'BKK', 'NRT', '2024-04-24 16:00:00', '2024-04-24 23:30:00'),
('WP737', 'BKK', 'NRT', '2024-04-24 23:59:59', '2024-04-25 07:30:00'),

('WP818', 'NRT', 'SYD', '2024-04-24 06:00:00', '2024-04-24 17:30:00'),
('WP828', 'NRT', 'SYD', '2024-04-24 10:00:00', '2024-04-24 21:30:00'),
('WP838', 'NRT', 'SYD', '2024-04-24 18:00:00', '2024-04-25 05:30:00'),

('WP919', 'SYD', 'PEK', '2024-04-24 11:00:00', '2024-04-24 23:30:00'),
('WP929', 'SYD', 'PEK', '2024-04-24 15:00:00', '2024-04-25 03:30:00'),
('WP939', 'SYD', 'PEK', '2024-04-24 19:00:00', '2024-04-25 07:30:00'),

('WP1010', 'PEK', 'MCO', '2024-04-24 08:00:00', '2024-04-24 19:30:00'),
('WP1020', 'PEK', 'MCO', '2024-04-24 12:00:00', '2024-04-24 23:30:00'),
('WP1030', 'PEK', 'MCO', '2024-04-24 20:00:00', '2024-04-25 07:30:00');


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
