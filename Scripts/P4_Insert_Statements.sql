USE CMS;

--------------------------------------------------------------------------------------------------------------------------------
-- Insert statements for Building table
INSERT INTO Building ([Name], [Number], [Location], ConstructionYear)
VALUES
('Longwood', 'A', '1575 Tremont St', 2000),
('Longwood', 'B', '1575 Tremont St', 1995),
('Longwood', 'C', '1575 Tremont St', 1980),
('Lakeview', 'A', '1575 Tremont St', 2010),
('Lakeview', 'B', '1575 Tremont St', 2005),
('Jvue', 'Apt', '1575 Tremont St', 1990),
('Oakridge', 'Apt', '1575 Tremont St', 2015),
('Riverside', 'A', '1575 Tremont St', 2008),
('Riverside', 'B', '1575 Tremont St', 2003),
('MissionHill', 'A', '1575 Tremont St', 1998);
--------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------
-- Insert statements for Apartment table
INSERT INTO Apartment (BuildingID, NumOfBedrooms, NumOfBathrooms, [Status], LeaseStartDate, LeaseEndDate)
VALUES
(1, 1, 1, 'Occupied', NULL, NULL),
(1, 2, 2, 'Available', NULL, NULL),
(1, 3, 2, 'Occupied', '2023-03-01', '2024-03-01'),
(1, 2, 1, 'Available', NULL, NULL),
(1, 1, 1, 'Occupied', '2023-05-01', '2024-05-01'),
(1, 3, 1, 'Occupied', '2023-07-01', '2024-07-01'),
(1, 2, 2, 'Available', NULL, NULL),
(1, 3, 2, 'Occupied', NULL, NULL),
(1, 1, 1, 'Occupied', '2023-11-01', '2024-11-01'),
(1, 2, 1, 'Available', NULL, NULL),
(2, 2, 1, 'Available', NULL, NULL),
(2, 1, 1, 'Occupied', NULL, NULL),
(2, 3, 2, 'Occupied', NULL, NULL),
(2, 2, 2, 'Available', NULL, NULL),
(2, 1, 1, 'Occupied', '2023-06-01', '2024-06-01'),
(2, 2, 1, 'Occupied', '2023-08-01', '2024-08-01'),
(2, 3, 1, 'Available', NULL, NULL),
(2, 1, 1, 'Occupied', NULL, NULL),
(2, 3, 2, 'Occupied', NULL, NULL),
(2, 2, 2, 'Available', NULL, NULL),
(3, 1, 1, 'Occupied', '2023-01-15', '2024-01-15'),
(3, 2, 1, 'Available', NULL, NULL),
(3, 3, 2, 'Occupied', NULL, NULL),
(3, 2, 2, 'Occupied', NULL, NULL),
(3, 1, 1, 'Available', NULL, NULL),
(4, 2, 1, 'Available', NULL, NULL),
(4, 1, 1, 'Occupied', '2023-04-10', '2024-04-10'),
(4, 3, 1, 'Available', NULL, NULL),
(4, 2, 2, 'Occupied', '2023-05-15', '2024-05-15'),
(4, 1, 1, 'Occupied', NULL, NULL),
(8, 2, 2, 'Occupied', '2023-01-05', '2024-01-05'),
(8, 1, 1, 'Available', NULL, NULL),
(8, 3, 1, 'Occupied', '2023-02-10', '2024-02-10'),
(8, 2, 1, 'Occupied', NULL, NULL),
(8, 1, 1, 'Available', NULL, NULL),
(9, 3, 2, 'Available', NULL, NULL),
(9, 2, 2, 'Occupied', '2023-04-20', '2024-04-20'),
(9, 1, 1, 'Available', NULL, NULL),
(9, 3, 1, 'Occupied', NULL, NULL),
(9, 2, 1, 'Occupied', NULL, NULL),
(10, 1, 1, 'Occupied', NULL, NULL),
(10, 2, 2, 'Available', NULL, NULL),
(10, 3, 2, 'Occupied', '2023-08-10', '2024-08-10'),
(10, 1, 1, 'Available', NULL, NULL),
(10, 2, 1, 'Occupied', NULL, NULL),
(5, 3, 2, 'Occupied', '2023-07-05', '2024-07-05'),
(5, 2, 2, 'Available', NULL, NULL),
(5, 1, 1, 'Occupied', NULL, NULL),
(5, 3, 1, 'Occupied', NULL, NULL),
(5, 2, 1, 'Available', NULL, NULL),
(6, 2, 1, 'Occupied', '2023-10-01', '2024-10-01'),
(6, 1, 1, 'Available', NULL, NULL),
(6, 3, 2, 'Occupied', '2023-11-05', '2024-11-05'),
(6, 2, 2, 'Available', NULL, NULL),
(6, 1, 1, 'Occupied', NULL, NULL),
(7, 3, 1, 'Available', NULL, NULL),
(7, 2, 1, 'Occupied', NULL, NULL),
(7, 1, 1, 'Available', NULL, NULL),
(7, 3, 2, 'Occupied', NULL, NULL),
(7, 2, 2, 'Occupied', NULL, NULL);
--------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------
-- Insert statements for Resident table
OPEN SYMMETRIC KEY SSNEncryptionKey
DECRYPTION BY CERTIFICATE SSNEncryptionCert;

INSERT INTO Resident (ApartmentID, FirstName, LastName, ContactNumber, Email, EmergencyContact, OccupancyType, SSN)
VALUES
(100, 'John', 'Doe', '1234567890', 'john.doe100@email.com', '0987654321', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '123-45-6789')),
(102, 'Jane', 'Smith', '1234567891', 'jane.smith102@email.com', '0987654322', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '234-56-7890')),
(104, 'Alice', 'Brown', '1234567892', 'alice.brown104@email.com', '0987654323', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '345-67-8901')),
(105, 'Bob', 'Johnson', '1234567893', 'bob.johnson105@email.com', '0987654324', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '456-78-9012')),
(107, 'Carol', 'Williams', '1234567894', 'carol.williams107@email.com', '0987654325', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '567-89-0123')),
(108, 'David', 'Jones', '1234567895', 'david.jones108@email.com', '0987654326', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '678-90-1234')),
(111, 'Eve', 'Miller', '1234567896', 'eve.miller111@email.com', '0987654327', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '789-01-2345')),
(112, 'Frank', 'Wilson', '1234567897', 'frank.wilson112@email.com', '0987654328', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '890-12-3456')),
(114, 'Grace', 'Moore', '1234567898', 'grace.moore114@email.com', '0987654329', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '901-23-4567')),
(115, 'Henry', 'Taylor', '1234567899', 'henry.taylor115@email.com', '0987654330', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '012-34-5678')),
(117, 'Isla', 'Anderson', '1234567800', 'isla.anderson117@email.com', '0987654331', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '123-45-6789')),
(118, 'Jack', 'Thomas', '1234567801', 'jack.thomas118@email.com', '0987654332', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '234-56-7891')),
(120, 'Kim', 'Lee', '1234567802', 'kim.lee120@email.com', '0987654333', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '345-67-8902')),
(122, 'Liam', 'Scott', '1234567803', 'liam.scott122@email.com', '0987654334', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '456-78-8903')),
(123, 'Mia', 'Young', '1234567804', 'mia.young123@email.com', '0987654335', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '567-89-8904')),
(126, 'Noah', 'Edwards', '1234567805', 'noah.edwards126@email.com', '0987654336', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '678-90-8905')),
(128, 'Olivia', 'Harris', '1234567806', 'olivia.harris128@email.com', '0987654337', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '789-01-8906')),
(129, 'Ethan', 'Martinez', '1234567807', 'ethan.martinez129@email.com', '0987654338', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '890-12-8907')),
(130, 'Sophia', 'Clark', '1234567808', 'sophia.clark130@email.com', '0987654339', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '901-23-8908')),
(132, 'James', 'Rodriguez', '1234567809', 'james.rodriguez132@email.com', '0987654340', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '012-34-8909')),
(133, 'Isabella', 'Lewis', '1234567810', 'isabella.lewis133@email.com', '0987654341', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '123-45-8910')),
(136, 'Alexander', 'Nguyen', '1234567811', 'alexander.nguyen136@email.com', '0987654342', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '234-56-8911')),
(138, 'Charlotte', 'Hill', '1234567812', 'charlotte.hill138@email.com', '0987654343', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '345-67-8912')),
(139, 'Daniel', 'Evans', '1234567813', 'daniel.evans139@email.com', '0987654344', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '456-78-8913')),
(140, 'Emma', 'Wilson', '1234567814', 'emma.wilson140@email.com', '0987654345', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '567-89-8914')),
(142, 'Fiona', 'Garcia', '1234567815', 'fiona.garcia142@email.com', '0987654346', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '678-90-8915')),
(124, 'George', 'Martinez', '1234567816', 'george.martinez144@email.com', '0987654347', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '789-01-8916')),
(120, 'John', 'Doe', '1234567890', 'john.doe100@email.com', '0987654321', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '123-45-6789')),
(120, 'Jane', 'Smith', '1234567891', 'jane.smith101@email.com', '0987654322', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '234-56-7890')),
(120, 'Alice', 'Brown', '1234567892', 'alice.brown102@email.com', '0987654323', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '345-67-8901')),
(120, 'Bob', 'Johnson', '1234567893', 'bob.johnson103@email.com', '0987654324', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '456-78-9012')),
(134, 'Carol', 'Williams', '1234567894', 'carol.williams104@email.com', '0987654325', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '567-89-0123')),
(134, 'David', 'Jones', '1234567895', 'david.jones105@email.com', '0987654326', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '678-90-1234')),
(134, 'Eve', 'Miller', '1234567896', 'eve.miller106@email.com', '0987654327', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '789-01-2345')),
(137, 'Frank', 'Wilson', '1234567897', 'frank.wilson107@email.com', '0987654328', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '890-12-3456')),
(137, 'Grace', 'Moore', '1234567898', 'grace.moore108@email.com', '0987654329', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '901-23-4567')),
(139, 'Henry', 'Taylor', '1234567899', 'henry.taylor109@email.com', '0987654330', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '012-34-5678')),
(139, 'John', 'Doe', '1234567890', 'john.doe100@email.com', '0987654321', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '123-45-6789')),
(132, 'Jane', 'Smith', '1234567891', 'jane.smith101@email.com', '0987654322', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '234-56-7890')),
(132, 'Alice', 'Brown', '1234567892', 'alice.brown102@email.com', '0987654323', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '345-67-8901')),
(133, 'Bob', 'Johnson', '1234567893', 'bob.johnson103@email.com', '0987654324', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '456-78-9012')),
(134, 'Carol', 'Williams', '1234567894', 'carol.williams104@email.com', '0987654325', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '567-89-0123')),
(135, 'David', 'Jones', '1234567895', 'david.jones105@email.com', '0987654326', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '678-90-1234')),
(136, 'Eve', 'Miller', '1234567896', 'eve.miller106@email.com', '0987654327', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '789-01-2345')),
(117, 'Frank', 'Wilson', '1234567897', 'frank.wilson107@email.com', '0987654328', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '890-12-3456')),
(108, 'Grace', 'Moore', '1234567898', 'grace.moore108@email.com', '0987654329', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '901-23-4567')),
(109, 'Henry', 'Taylor', '1234567899', 'henry.taylor109@email.com', '0987654330', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '012-34-5678')),
(100, 'John', 'Doe', '1234567890', 'john.doe100@email.com', '0987654321', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '123-45-6789')),
(101, 'Jane', 'Smith', '1234567891', 'jane.smith101@email.com', '0987654322', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '234-56-7890')),
(112, 'Alice', 'Brown', '1234567892', 'alice.brown102@email.com', '0987654323', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '345-67-8901')),
(103, 'Bob', 'Johnson', '1234567893', 'bob.johnson103@email.com', '0987654324', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '456-78-9012')),
(104, 'Carol', 'Williams', '1234567894', 'carol.williams104@email.com', '0987654325', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '567-89-0123')),
(105, 'David', 'Jones', '1234567895', 'david.jones105@email.com', '0987654326', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '678-90-1234')),
(106, 'Eve', 'Miller', '1234567896', 'eve.miller106@email.com', '0987654327', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '789-01-2345')),
(107, 'Frank', 'Wilson', '1234567897', 'frank.wilson107@email.com', '0987654328', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '890-12-3456')),
(118, 'Grace', 'Moore', '1234567898', 'grace.moore108@email.com', '0987654329', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '901-23-4567')),
(119, 'Henry', 'Taylor', '1234567899', 'henry.taylor109@email.com', '0987654330', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '012-34-5678')),
(110, 'John', 'Doe', '1234567890', 'john.doe100@email.com', '0987654321', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '123-45-6789')),
(111, 'Jane', 'Smith', '1234567891', 'jane.smith101@email.com', '0987654322', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '234-56-7890')),
(112, 'Alice', 'Brown', '1234567892', 'alice.brown102@email.com', '0987654323', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '345-67-8901')),
(113, 'Bob', 'Johnson', '1234567893', 'bob.johnson103@email.com', '0987654324', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '456-78-9012')),
(114, 'Carol', 'Williams', '1234567894', 'carol.williams104@email.com', '0987654325', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '567-89-0123')),
(115, 'David', 'Jones', '1234567895', 'david.jones105@email.com', '0987654326', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '678-90-1234')),
(116, 'Eve', 'Miller', '1234567896', 'eve.miller106@email.com', '0987654327', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '789-01-2345')),
(117, 'Frank', 'Wilson', '1234567897', 'frank.wilson107@email.com', '0987654328', 'Owner', EncryptByKey(Key_GUID('SSNEncryptionKey'), '890-12-3456')),
(118, 'Grace', 'Moore', '1234567898', 'grace.moore108@email.com', '0987654329', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '901-23-4567')),
(119, 'Henry', 'Taylor', '1234567899', 'henry.taylor109@email.com', '0987654330', 'Tenant', EncryptByKey(Key_GUID('SSNEncryptionKey'), '012-34-5678'));

CLOSE SYMMETRIC KEY SSNEncryptionKey;
--------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------
-- Insert statements for the Staff table
OPEN SYMMETRIC KEY SSNEncryptionKey
DECRYPTION BY CERTIFICATE SSNEncryptionCert;
INSERT INTO Staff (FirstName, LastName, [Role], [Address], ContactNumber, Email, SSN, EmployeeStartDate, EmploymentEndDate)
VALUES
('John', 'Doe', 'ParkingCoordinator', '123 Maple Dr', '1234567890', 'john.doe@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '133-45-6789'), '2021-01-01', NULL),
('Jane', 'Smith', 'Facilitator', '456 Oak St', '2345678901', 'jane.smith@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '134-45-6789'), '2021-02-01', NULL),
('Alice', 'Brown', 'Electrician', '789 Pine Ln', '3456789012', 'alice.brown@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '135-45-6789'), '2021-03-01', NULL),
('Bob', 'Johnson', 'Plumber', '101 Walnut St', '4567890123', 'bob.johnson@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '136-45-6789'), '2021-04-01', NULL),
('Carol', 'Williams', 'GeneralMaintenance', '202 Cherry Ln', '5678901234', 'carol.williams@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '137-45-6789'), '2021-05-01', NULL),
('David', 'Jones', 'ParkingCoordinator', '303 Birch Dr', '6789012345', 'david.jones@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '138-45-6789'), '2021-06-01', NULL),
('Eve', 'Miller', 'Facilitator', '404 Cedar St', '7890123456', 'eve.miller@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '139-45-6789'), '2021-07-01', NULL),
('Frank', 'Wilson', 'Electrician', '505 Spruce Ave', '8901234567', 'frank.wilson@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '140-45-6789'), '2021-08-01', NULL),
('Grace', 'Moore', 'Plumber', '606 Redwood Rd', '9012345678', 'grace.moore@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '141-45-6789'), '2021-09-01', NULL),
('Henry', 'Taylor', 'GeneralMaintenance', '707 Aspen St', '0123456789', 'henry.taylor@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '142-45-6789'), '2021-10-01', NULL),
('Isabella', 'Anderson', 'ParkingCoordinator', '808 Willow Dr', '1234567890', 'isabella.anderson@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '143-45-6789'), '2022-01-01', NULL),
('Jack', 'Thomas', 'Facilitator', '909 Maple Ave', '2345678901', 'jack.thomas@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '144-45-6789'), '2022-02-01', NULL),
('Kim', 'Lee', 'Electrician', '111 Elm St', '3456789012', 'kim.lee@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '145-45-6789'), '2022-03-01', NULL),
('Liam', 'Scott', 'Plumber', '222 Magnolia Ln', '4567890123', 'liam.scott@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '146-45-6789'), '2022-04-01', NULL),
('Mia', 'Young', 'GeneralMaintenance', '333 Palm Dr', '5678901234', 'mia.young@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '147-45-6789'), '2022-05-01', NULL),
('Noah', 'Edwards', 'ParkingCoordinator', '444 Pineapple St', '6789012345', 'noah.edwards@email.com', EncryptByKey(Key_GUID('SSNEncryptionKey'), '148-45-6789'), '2022-06-01', NULL);

CLOSE SYMMETRIC KEY SSNEncryptionKey;
--------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------
-- Insert statements for the Invoice table
INSERT INTO Invoice (ApartmentID, IssueDate, TotalAmount)
VALUES
(100, '2024-01-01', 2000.00),
(102, '2024-01-01', 5000.00),
(102, '2024-02-01', 5000.00),
(102, '2024-03-01', 5000.00),
(104, '2024-01-01', 2000.00), 
(105, '2024-01-01', 3000.00), 
(105, '2024-02-01', 3000.00), 
(107, '2024-01-01', 2000.00),
(108, '2024-01-01', 2000.00),
(111, '2024-02-01', 3000.00),
(112, '2024-03-01', 5000.00),
(114, '2024-01-01', 3000.00),
(114, '2024-02-01', 3000.00),
(114, '2024-03-01', 3000.00),
(115, '2024-01-01', 5000.00),
(120, '2024-01-01', 2000.00),
(126, '2024-01-01', 5000.00),
(126, '2024-02-01', 5000.00),
(128, '2024-03-01', 5000.00),
(130, '2024-01-01', 2000.00),
(132, '2024-01-01', 5000.00),
(136, '2024-01-01', 5000.00),
(136, '2024-02-01', 5000.00),
(142, '2024-01-01', 2000.00),
(142, '2024-02-01', 2000.00),
(142, '2024-03-01', 2000.00);
--------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------
-- Insert statements for the Payment table
DECLARE @paymentOutputMsg VARCHAR(500);
DECLARE @paymentCounter INT = 1;
DECLARE @MaxRownum INT;

DECLARE @InvoiceDataTemp TABLE (
    Rownum INT IDENTITY(1,1),
    ResidentID INT,
    InvoiceID INT,
    InvoiceTotalAmount DECIMAL(10, 2)
);

INSERT INTO @InvoiceDataTemp (ResidentID, InvoiceID, InvoiceTotalAmount)
SELECT DISTINCT r.ResidentID, i.InvoiceID, i.TotalAmount
FROM Invoice i
JOIN Apartment a ON a.ApartmentID = i.ApartmentID
JOIN Resident r ON r.ApartmentID = a.ApartmentID
WHERE i.[Status] != 'Paid';

SELECT @MaxRownum = MAX(Rownum) FROM @InvoiceDataTemp;
DECLARE @Midpoint INT = (@MaxRownum / 2) + (@MaxRownum % 2);

WHILE @paymentCounter <= @MaxRownum
BEGIN
    DECLARE @CurrentResidentID INT;
    DECLARE @CurrentInvoiceID INT;
    DECLARE @CurrentTotalAmount DECIMAL(10, 2);

    SELECT @CurrentResidentID = ResidentID, @CurrentInvoiceID= InvoiceID, @CurrentTotalAmount = InvoiceTotalAmount
    FROM @InvoiceDataTemp
    WHERE Rownum = @paymentCounter;

    IF @paymentCounter > @Midpoint
    BEGIN
        SET @CurrentTotalAmount = @CurrentTotalAmount - 500;
    END

    EXEC dbo.MakePayment @ResidentID = @CurrentResidentID, @Amount = @CurrentTotalAmount, @PaymentType = 'Maintenance', @PaymentMethod = 'CC', @PaymentMethodLastFour = '1979', @EntityID = @CurrentInvoiceID, @OutputMessage = @paymentOutputMsg OUTPUT;

    PRINT @paymentOutputMsg;

    SET @paymentCounter = @paymentCounter + 1;
END;
--------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------
-- Insert statements for the ServiceRequest table
DECLARE @sr INT = 1;
DECLARE @RequestType VARCHAR(50);
DECLARE @ScheduledDate DATE;
DECLARE @Priority VARCHAR(50);
DECLARE @srOutputMsg VARCHAR(500);

WHILE @sr <= 20
BEGIN
    SET @RequestType = CASE ABS(CHECKSUM(NEWID())) % 5
                            WHEN 0 THEN 'Plumbing'
                            WHEN 1 THEN 'Electrical'
                            WHEN 2 THEN 'Car Parking'
                            WHEN 3 THEN 'Common Area'
                            ELSE 'Other'
                        END;

    SET @ScheduledDate = DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 365, GETDATE() + 1);

    SET @Priority = CASE ABS(CHECKSUM(NEWID())) % 3
                        WHEN 0 THEN 'High'
                        WHEN 1 THEN 'Medium'
                        ELSE 'Low'
                    END;

    EXEC dbo.SubmitServiceRequest 
        @ResidentID = @sr, 
        @Description = 'Test Description', 
        @RequestType = @RequestType, 
        @ScheduledDate = @ScheduledDate, 
        @Priority = @Priority, 
        @RequestFee = NULL, 
        @OutputMessage = @srOutputMsg OUTPUT;

    PRINT @srOutputMsg;

    SET @sr = @sr + 1;
END;
--------------------------------------------------------------------------------------------------------------------------------


-- Insert statements for the Visitor table
INSERT INTO Visitor (FirstName, LastName, ContactNumber, VisitDate, EntryTime, ExitTime)
VALUES
('Emma', 'Miller', '1234567890', '2023-01-01', '08:00:00', '09:00:00'),
('Oliver', 'Brown', '2345678901', '2023-01-02', '09:00:00', '10:00:00'),
('Ava', 'Wilson', '3456789012', '2023-01-03', '10:00:00', '11:00:00'),
('James', 'Taylor', '4567890123', '2023-01-04', '11:00:00', '12:00:00'),
('Charlotte', 'Anderson', '5678901234', '2023-01-05', '12:00:00', '13:00:00'),
('Mia', 'Thomas', '6789012345', '2023-01-06', '13:00:00', '14:00:00'),
('Elijah', 'Jackson', '7890123456', '2023-01-07', '14:00:00', '15:00:00'),
('Harper', 'White', '8901234567', '2023-01-08', '15:00:00', '16:00:00'),
('Benjamin', 'Harris', '9012345678', '2023-01-09', '16:00:00', '17:00:00'),
('Amelia', 'Martin', '0123456789', '2023-01-10', '17:00:00', '18:00:00');

-- Insert statements for the VisitorLog table
INSERT INTO VisitorLog (VisitorID, ResidentID, Purpose)
VALUES
(1, 1, 'Meeting'),
(2, 2, 'Delivery'),
(3, 3, 'Social visit'),
(4, 4, 'Repair service'),
(5, 5, 'Guest'),
(6, 6, 'Family visit'),
(7, 7, 'Vendor visit'),
(8, 8, 'Maintenance'),
(9, 9, 'Appointment'),
(10, 10, 'Friend visit');

-- Insert statements for the Vehicle table
INSERT INTO Vehicle (OwnerID, LicensePlate, Make, Model, [Type])
VALUES
(1, 'ABC123', 'Toyota', 'Corolla', 'Sedan'),
(2, 'XYZ456', 'Honda', 'Civic', 'Sedan'),
(3, 'DEF789', 'Ford', 'F-150', 'Truck'),
(4, 'GHI012', 'Chevrolet', 'Malibu', 'Sedan'),
(5, 'JKL345', 'Nissan', 'Altima', 'Sedan'),
(6, 'MNO678', 'BMW', 'X5', 'SUV'),
(7, 'PQR901', 'Mercedes', 'E-Class', 'Sedan'),
(8, 'STU234', 'Audi', 'A4', 'Sedan'),
(9, 'VWX567', 'Toyota', 'Camry', 'Sedan'),
(10, 'YZA890', 'Ford', 'Mustang', 'Coupe');

-- Insert statements for the ParkingSlot table
INSERT INTO ParkingSlot (VehicleID, [Type], [Status])
VALUES
(1, 'Reserved', 'Occupied'),
(2, 'Guest', 'Available'),
(3, 'Reserved', 'Occupied'),
(4, 'Guest', 'Available'),
(5, 'Reserved', 'Occupied'),
(6, 'Guest', 'Available'),
(7, 'Reserved', 'Occupied'),
(8, 'Guest', 'Available'),
(9, 'Reserved', 'Occupied'),
(10, 'Guest', 'Available');

--------------------------------------------------------------------------------------------------------------------------------
-- Insert statements for the Amenity table
INSERT INTO Amenity ([Name], [Location], Capacity, AvailabilityHours, ReservationRequired)
VALUES
('Gym', 'Longwood A, Floor 1', 20, '06:00 - 22:00', 0),
('Pool', 'Clubhouse, GroundFloor', 50, '08:00 - 20:00', 1),
('BBQ Area', 'Longwood B, Courtyard', 10, '10:00 - 18:00', 1),
('Business Center', 'Oakridge Apt, Floor 2', 15, '08:00 - 18:00', 1),
('Dog Park', 'MissionHill A, Park', 10, '07:00 - 19:00', 0),
('Playground', 'Lakeview A, Courtyard', 20, '09:00 - 17:00', 0),
('Tennis Court', 'Clubhouse, Rooftop', 2, '08:00 - 22:00', 1),
('Golf Court', 'Riverside, Front', 2, '08:00 - 22:00', 1),
('Movie Theater', 'Clubhouse, Floor 3', 25, '12:00 - 22:00', 0),
('Spa', 'Clubhouse, Basement', 5, '10:00 - 20:00', 1);
--------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------
-- Insert statements for the randomly generating data for AmenityBooking table
DECLARE @ab INT = 1;
DECLARE @AmenityID INT;
DECLARE @BookingDate DATE;
DECLARE @StartTime TIME;
DECLARE @EndTime TIME;
DECLARE @BookingFee DECIMAL(10, 2);
DECLARE @NumOfAttendees INT;
DECLARE @abOutputMsg VARCHAR(500);

WHILE @ab <= 20
BEGIN
    SELECT TOP 1 @AmenityID = AmenityID
    FROM Amenity
    ORDER BY NEWID();

    SET @BookingDate = DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 365, GETDATE());

    SELECT @StartTime = DATEADD(MINUTE, ABS(CHECKSUM(NEWID())) % 120, '08:00'),
           @EndTime = DATEADD(MINUTE, ABS(CHECKSUM(NEWID())) % 120 + 60, '08:00');

    IF @ab <= 10
        SET @BookingFee = ROUND(RAND() * 100, 2);
    ELSE
        SET @BookingFee = NULL;

    SET @NumOfAttendees = ABS(CHECKSUM(NEWID())) % 5 + 1;

    -- Execute the procedure
    EXEC dbo.BookAmenity 
        @AmenityID = @AmenityID,
        @ResidentID = @ab, 
        @BookingDate = @BookingDate, 
        @StartTime = @StartTime, 
        @EndTime = @EndTime, 
        @BookingFee = @BookingFee, 
        @NumOfAttendees = @NumOfAttendees, 
        @OutputMessage = @abOutputMsg OUTPUT;

    PRINT @abOutputMsg;

    SET @ab = @ab + 1;
END;
--------------------------------------------------------------------------------------------------------------------------------