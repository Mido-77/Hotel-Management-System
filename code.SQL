CREATE DATABASE HotelManagement;
use  HotelManagement;

CREATE TABLE Guest (
    GuestID INT PRIMARY KEY,
    GuestSSN VARCHAR(20) UNIQUE NOT NULL,
    GEmail VARCHAR(100) ,
    GPhone VARCHAR(20) not null,
);
CREATE TABLE GuestName (
    GuestID INT PRIMARY KEY,
    FName VARCHAR(50) NOT NULL,
    MName VARCHAR(50),
    LName VARCHAR(50) NOT NULL
);

create table Room (
    RNo int primary key identity(1,1),
    Rtype varchar(20) check(Rtype='Single' or Rtype='Double' or Rtype='Suite') default 'single',
    Rate money default 1000,
    Rstatus varchar(15) check(Rstatus='Available' or Rstatus='Occupied' or Rstatus='Maintenance') default 'Available',
)



CREATE TABLE StaffRole (
    SRole VARCHAR(50) PRIMARY KEY,
    Salary money not null,
    Shift varchar(40) check(Shift = 'Day' or Shift = 'Night') default 'Day',
);




create table Staff (
    Staff_ID int primary key identity(1,1),
    Staff_name varchar(40) not null,   
)

CREATE TABLE Service (
    SType VARCHAR(50) PRIMARY KEY,
    SInCharge INT foreign key references Staff(Staff_ID),
    Cost money NOT NULL,
);



CREATE TABLE Reservation (
    ResNo int primary key identity(1,1),
    GuestID INT foreign key references Guest,
    RNo INT foreign key references Room,
    ChkInDate DATE NOT NULL,
    ChkOutDate DATE NOT NULL,
    NoOfGuests INT NOT NULL,
);



CREATE TABLE Bill (
    BID INT PRIMARY KEY identity(1,1),
    ResNo INT foreign key references Reservation,
    DateIssued DATE NOT NULL,
);


CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BID INT foreign key references Bill(BID),
    PayDate DATE NOT NULL,
    PayMethod VARCHAR(50) NOT NULL,
);

CREATE TABLE Requests (
    GuestID INT foreign key references Guest,
    SType VARCHAR(50) foreign key references Service(SType),
    TimeR TIME, 
    Cost money NOT NULL, 
);


CREATE TABLE Books (
    GID INT foreign key references Guest,
    RNO INT foreign key references Room(RNo),
    ResID INT foreign key references Reservation(ResNo),
);



-- Insert data into Guest
INSERT INTO Guest (GuestID, GuestSSN, GEmail, GPhone) VALUES
(1, 'SSN001', 'alice@example.com', '1234567890'),
(2, 'SSN002', 'bob@example.com', '2345678901'),
(3, 'SSN003', 'carol@example.com', '3456789012'),
(4, 'SSN004', 'dave@example.com', '4567890123'),
(5, 'SSN005', 'eve@example.com', '5678901234'),
(6, 'SSN006', 'frank@example.com', '6789012345'),
(7, 'SSN007', 'grace@example.com', '7890123456'),
(8, 'SSN008', 'heidi@example.com', '8901234567'),
(9, 'SSN009', 'ivan@example.com', '9012345678'),
(10,'SSN010', 'judy@example.com', '0123456789');

-- Insert data into GuestName
INSERT INTO GuestName (GuestID, FName, MName, LName) VALUES
(1, 'Alice', 'M', 'Smith'),
(2, 'Bob', 'J', 'Johnson'),
(3, 'Carol', 'A', 'Williams'),
(4, 'Dave', 'B', 'Brown'),
(5, 'Eve', 'C', 'Jones'),
(6, 'Frank', 'D', 'Garcia'),
(7, 'Grace', 'E', 'Martinez'),
(8, 'Heidi', 'F', 'Davis'),
(9, 'Ivan', 'G', 'Rodriguez'),
(10, 'Judy', 'H', 'Miller');

-- Insert data into Room
INSERT INTO Room (Rtype, Rate, Rstatus) VALUES
('Single', 1000, 'Available'),
('Double', 1500, 'Occupied'),
('Suite', 3000, 'Available'),
('Single', 1200, 'Maintenance'),
('Double', 1600, 'Available'),
('Suite', 3500, 'Occupied'),
('Single', 1100, 'Available'),
('Double', 1550, 'Available'),
('Suite', 3200, 'Maintenance'),
('Single', 1300, 'Occupied');

-- Insert data into StaffRole
INSERT INTO StaffRole (SRole, Salary, Shift) VALUES
('Manager', 5000, 'Day'),
('Receptionist', 2500, 'Night'),
('Housekeeping', 2000, 'Day'),
('Chef', 3000, 'Day'),
('Waiter', 1800, 'Night'),
('Security', 2200, 'Night'),
('Concierge', 2700, 'Day'),
('Bellboy', 1600, 'Day'),
('Maintenance', 2100, 'Night'),
('Accountant', 3500, 'Day');

-- Insert data into Staff
INSERT INTO Staff (Staff_name) VALUES
('John Doe'),
('Jane Smith'),
('Robert Brown'),
('Emily Davis'),
('Michael Wilson'),
('Sarah Moore'),
('David Taylor'),
('Laura Anderson'),
('James Thomas'),
('Linda Jackson');

-- Insert data into Service
INSERT INTO Service (SType, SInCharge, Cost) VALUES
('Room Cleaning', 3, 200),
('Laundry', 4, 150),
('Food Delivery', 5, 300),
('Spa', 6, 500),
('Gym', 7, 100),
('Airport Pickup', 8, 400),
('Tour Guide', 9, 350),
('Babysitting', 2, 250),
('Car Rental', 1, 600),
('WiFi', 10, 50);

-- Insert data into Reservation
INSERT INTO Reservation (GuestID, RNo, ChkInDate, ChkOutDate, NoOfGuests) VALUES
(1, 1, '2024-06-01', '2024-06-05', 1),
(2, 2, '2024-06-02', '2024-06-06', 2),
(3, 3, '2024-06-03', '2024-06-07', 1),
(4, 4, '2024-06-04', '2024-06-08', 3),
(5, 5, '2024-06-05', '2024-06-09', 2),
(6, 6, '2024-06-06', '2024-06-10', 1),
(7, 7, '2024-06-07', '2024-06-11', 2),
(8, 8, '2024-06-08', '2024-06-12', 1),
(9, 9, '2024-06-09', '2024-06-13', 4),
(10, 10, '2024-06-10', '2024-06-14', 2),
(1, 2, '2024-07-01', '2024-07-03', 1),
(2, 3, '2024-07-05', '2024-07-08', 2),
(3, 4, '2024-07-10', '2024-07-12', 1),
(1, 5, '2024-08-01', '2024-08-04', 1),
(2, 6, '2024-08-05', '2024-08-09', 2);

-- Insert data into Bill
INSERT INTO Bill (ResNo, DateIssued) VALUES
(1, '2024-06-05'),
(2, '2024-06-06'),
(3, '2024-06-07'),
(4, '2024-06-08'),
(5, '2024-06-09'),
(6, '2024-06-10'),
(7, '2024-06-11'),
(8, '2024-06-12'),
(9, '2024-06-13'),
(10, '2024-06-14'),
(11, '2024-07-03'),
(12, '2024-07-08'),
(13, '2024-07-12'),
(14, '2024-08-04'),
(15, '2024-08-09');

-- Insert data into Payment
INSERT INTO Payment (PaymentID, BID, PayDate, PayMethod) VALUES
(1, 1, '2024-06-05', 'Credit Card'),
(2, 2, '2024-06-06', 'Cash'),
(3, 3, '2024-06-07', 'Debit Card'),
(4, 4, '2024-06-08', 'Credit Card'),
(5, 5, '2024-06-09', 'Online'),
(6, 6, '2024-06-10', 'Cash'),
(7, 7, '2024-06-11', 'Credit Card'),
(8, 8, '2024-06-12', 'Debit Card'),
(9, 9, '2024-06-13', 'Online'),
(10, 10, '2024-06-14', 'Cash');

-- Insert data into Requests
INSERT INTO Requests (GuestID, SType, TimeR, Cost) VALUES
(1, 'Room Cleaning', '10:00', 200),
(2, 'Laundry', '11:00', 150),
(3, 'Food Delivery', '12:00', 300),
(4, 'Spa', '13:00', 500),
(5, 'Gym', '14:00', 100),
(6, 'Airport Pickup', '15:00', 400),
(7, 'Tour Guide', '16:00', 350),
(8, 'Babysitting', '17:00', 250),
(9, 'Car Rental', '18:00', 600),
(10, 'WiFi', '19:00', 50),
(1, 'Laundry', '20:00', 150),
(3, 'Spa', '21:00', 500),
(5, 'Food Delivery', '22:00', 300);
-- Insert data into Books
INSERT INTO Books (GID, RNO, ResID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(1, 2, 11),
(2, 3, 12),
(3, 4, 13),
(1, 5, 14),
(2, 6, 15);


-- 1. DELETE query: Delete a guest with GuestID = 10

DELETE FROM Requests WHERE GuestID = 10;

-- 2. UPDATE query: Update the status of Room 4 to 'Available'
UPDATE Room SET Rstatus = 'Available' WHERE RNo = 4;

-- 3. SELECT with WHERE and ORDER BY: Select all available rooms, ordered by Rate descending
SELECT * FROM Room WHERE Rstatus = 'Available' ORDER BY Rate DESC;

-- 4. SELECT with WHERE and ORDER BY: Select all staff working night shift, ordered by Salary
SELECT * FROM StaffRole WHERE Shift = 'Night' ORDER BY Salary;

-- 5. SELECT with WHERE and ORDER BY: Select all reservations for GuestID 2, ordered by ChkInDate
SELECT * FROM Reservation WHERE GuestID = 2 ORDER BY ChkInDate;

-- 6. SELECT using Aggregate function: Find the maximum, minimum, and average room rate
SELECT MAX(Rate) AS MaxRate, MIN(Rate) AS MinRate, AVG(Rate) AS AvgRate FROM Room;

-- 7. SELECT with GROUP BY and HAVING: Count number of reservations per guest, only guests with more than 1 reservation
SELECT GuestID, COUNT(*) AS ReservationCount
FROM Reservation
GROUP BY GuestID
HAVING COUNT(*) > 1;

-- 8. SELECT with GROUP BY and HAVING: Total payments by payment method, only methods with total payments over 2
SELECT PayMethod, COUNT(*) AS TotalPayments
FROM Payment
GROUP BY PayMethod
HAVING COUNT(*) > 2;

-- 9. JOIN query: List all guests with their room numbers (Reservation join Guest)
SELECT G.GuestID, GN.FName, GN.LName, R.RNo, R.Rtype
FROM Guest G
JOIN GuestName GN ON G.GuestID = GN.GuestID
JOIN Reservation Res ON G.GuestID = Res.GuestID
JOIN Room R ON Res.RNo = R.RNo;

-- 10. JOIN query: List all services with the staff in charge
SELECT S.SType, Stf.Staff_name
FROM Service S
JOIN Staff Stf ON S.SInCharge = Stf.Staff_ID;

-- 11. Derived attribute: TotalAmnt (total bill amount) and DysStyed (days stayed) for each reservation
SELECT 
    Res.ResNo,
    Res.GuestID,
    DATEDIFF(DAY, Res.ChkInDate, Res.ChkOutDate) AS DysStyed,
    (DATEDIFF(DAY, Res.ChkInDate, Res.ChkOutDate) * R.Rate) AS TotalAmnt
FROM Reservation Res
JOIN Room R ON Res.RNo = R.RNo;

-- 12. Derived attribute: TotalAmnt and DysStyed for a specific guest (e.g., GuestID = 1)
SELECT 
    Res.ResNo,
    Res.GuestID,
    DATEDIFF(DAY, Res.ChkInDate, Res.ChkOutDate) AS DysStyed,
    (DATEDIFF(DAY, Res.ChkInDate, Res.ChkOutDate) * R.Rate) AS TotalAmnt
FROM Reservation Res
JOIN Room R ON Res.RNo = R.RNo
WHERE Res.GuestID = 1;
