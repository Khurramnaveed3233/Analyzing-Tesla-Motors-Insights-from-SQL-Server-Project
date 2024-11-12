
CREATE DATABASE TeslaMotors;

USE TeslaMotors;

CREATE TABLE Vehicles (
    VehicleID INT IDENTITY PRIMARY KEY,
    Model NVARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    BatteryCapacity DECIMAL(5, 2) NOT NULL -- in kWh
);

INSERT INTO Vehicles (Model, Year, Price, BatteryCapacity)
VALUES 
('Model S', 2021, 79999.99, 100.00),
('Model 3', 2021, 39999.99, 75.00),
('Model X', 2021, 89999.99, 100.00),
('Model Y', 2021, 49999.99, 75.00),
('Model S Plaid', 2022, 119999.99, 100.00),
('Model 3 Performance', 2022, 59999.99, 75.00),
('Model X Plaid', 2022, 119999.99, 100.00),
('Model Y Performance', 2022, 69999.99, 75.00),
('Cybertruck', 2023, 49999.99, 100.00),
('Roadster', 2023, 200000.00, 200.00),
('Model S Long Range', 2022, 89999.99, 100.00),
('Model X Long Range', 2022, 99999.99, 100.00),
('Model Y Long Range', 2022, 54999.99, 75.00),
('Model S Refresh', 2023, 84999.99, 100.00),
('Model X Refresh', 2023, 94999.99, 100.00);

====================================================================================

CREATE TABLE Customers (
    CustomerID INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone NVARCHAR(15)
);

INSERT INTO Customers (FirstName, LastName, Email, Phone)
VALUES 
('Elon', 'Musk', 'elon.musk@tesla.com', '123-456-7890'),
('Jared', 'Leto', 'jared.leto@tesla.com', '987-654-3210'),
('Mary', 'Smith', 'mary.smith@tesla.com', '555-555-5555'),
('John', 'Doe', 'john.doe@tesla.com', '111-222-3333'),
('Jane', 'Doe', 'jane.doe@tesla.com', '444-555-6666'),
('Alice', 'Johnson', 'alice.johnson@tesla.com', '777-888-9999'),
('Bob', 'Brown', 'bob.brown@tesla.com', '222-333-4444'),
('Charlie', 'Davis', 'charlie.davis@tesla.com', '333-444-5555'),
('Diana', 'Evans', 'diana.evans@tesla.com', '666-777-8888'),
('Ethan', 'Harris', 'ethan.harris@tesla.com', '888-999-0000'),
('Fiona', 'Green', 'fiona.green@tesla.com', '123-321-1234'),
('George', 'King', 'george.king@tesla.com', '234-432-2345'),
('Hannah', 'Lee', 'hannah.lee@tesla.com', '345-543-3456'),
('Isaac', 'Newton', 'isaac.newton@tesla.com','456-654-4567'),
('Jessica','Wang','jessica.wang@tesla.com','567-765-5678');

================================================================================

CREATE TABLE Orders (
    OrderID INT IDENTITY PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    VehicleID INT FOREIGN KEY REFERENCES Vehicles(VehicleID),
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10, 2) NOT NULL
);

INSERT INTO Orders (CustomerID, VehicleID, TotalAmount)
VALUES 
(1, 1, 79999.99), -- Elon Musk orders Model S
(2, 2, 39999.99), -- Jared Leto orders Model 3
(3, 3, 89999.99), -- Mary Smith orders Model X
(4, 4, 49999.99), -- John Doe orders Model Y
(5, 5,119999.99), -- Jane Doe orders Model S Plaid
(6,6 ,59999.99), -- Alice Johnson orders Model3 Performance
(7 ,7 ,119999.99), -- Bob Brown orders Model X Plaid
(8 ,8 ,69999.99), -- Charlie Davis orders Model Y Performance
(9 ,9 ,49999.99), -- Diana Evans orders Cybertruck
(10 ,10 ,200000.00), -- Ethan Harris orders Roadster
(11 ,11 ,89999.99), -- Fiona Green orders Model S Long Range
(12 ,12 ,99999.99), -- George King orders Model X Long Range
(13 ,13 ,54999.99), -- Hannah Lee orders Model Y Long Range
(14 ,14 ,84999.99), -- Isaac Newton orders Model S Refresh
(15 ,15 ,94999.99); -- Jessica Wang orders Model X Refresh

====================================================================================

CREATE TABLE ServiceRecords (
    ServiceID INT IDENTITY PRIMARY KEY,
    VehicleID INT FOREIGN KEY REFERENCES Vehicles(VehicleID),
    ServiceDate DATETIME NOT NULL,
    Description NVARCHAR(255),
    Cost DECIMAL(10, 2) NOT NULL
);

INSERT INTO ServiceRecords (VehicleID, ServiceDate, Description, Cost)
VALUES 
(1, '2024-01-15', 'Battery replacement.',5000),
(2,'2024-02-20','Tire rotation.',200),
(3,'2024-03-10','Software update.',150),
(4,'2024-01-25','Brake inspection.',300),
(5,'2024-02-15','General maintenance.',400),
(6,'2024-03-05','Battery check.',250),
(7,'2024-01-30','Tire alignment.',150),
(8,'2024-02-28','Software update.',200),
(9,'2024-03-15','Brake replacement.',600),
(10,'2024-01-20','General maintenance.',350),
(11,'2024-02-10','Battery replacement.',5000),
(12,'2024-03-01','Tire rotation.',200),
(13,'2024-01-18','Software update.',150),
(14,'2024-02-22','Brake inspection.',300),
(15,'2024-03-12','General maintenance.',400);

==============================================================================

CREATE TABLE Salespersons (
    SalespersonID INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone NVARCHAR(15)
);

INSERT INTO Salespersons (FirstName, LastName, Email, Phone)
VALUES 
('Alice','Williams','alice.williams@tesla.com','1234567890'),
('Bob','Johnson','bob.johnson@tesla.com','9876543210'),
('Charlie','Brown','charlie.brown@tesla.com','5555555555'),
('David','Smith','david.smith@tesla.com','1112223333'),
('Eva','Green','eva.green@tesla.com','4445556666'),
('Frank','White','frank.white@tesla.com','7778889999'),
('Grace','Lee','grace.lee@tesla.com','2223334444'),
('Henry','Miller','henry.miller@tesla.com','3334445555'),
('Ivy','Davis','ivy.davis@tesla.com','6667778888'),
('Jack','Wilson','jack.wilson@tesla.com','8889990000'),
('Kathy','Martinez','kathy.martinez@tesla.com','1233211234'),
('Leo','Harris','leo.harris@tesla.com ','2344322345'),
('Mia','Clarkson ','mia.clarkson @tesla.com ','3455433456'),
 ('Noah ','Rodriguez ','noah.rodriguez @tesla.com ','4566544567'), 
 ('Olivia ','Lewis ','olivia.lewis @tesla.com ','5677655678');

==============================================================================

CREATE TABLE Payments (
    PaymentID INT IDENTITY PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    PaymentDate DATETIME DEFAULT GETDATE(),
    PaymentMethod NVARCHAR(50) NOT NULL, -- e.g., Credit Card, Bank Transfer
    Amount DECIMAL(10, 2) NOT NULL
);

INSERT INTO Payments (OrderID, PaymentMethod, Amount)
VALUES 
(1,'Credit Card ',79999 ),
(2,'Bank Transfer ',3999 ),
(3,'Credit Card ',8999 ),
(4,'Debit Card ',4999 ),
(5,'Cash ',119999 ),
(6 ,'Credit Card ',5999 ),
(7 ,'Bank Transfer ',119999 ),
(8 ,'Debit Card ',6999 ),
(9 ,'Cash ',4999 ),
(10 ,'Credit Card ',200000 ),
(11 ,'Bank Transfer ',8999 ),
(12 ,'Debit Card ',9999 ),
(13 ,'Cash ',5499 ),
(14 ,'Credit Card ',8499 ),
(15 ,'Bank Transfer ',9499 );

===============================================================================

CREATE TABLE TestDrives (
    TestDriveID INT IDENTITY PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    VehicleID INT FOREIGN KEY REFERENCES Vehicles(VehicleID),
    TestDriveDate DATETIME DEFAULT GETDATE(),
    Feedback NVARCHAR(255)
);

INSERT INTO TestDrives (CustomerID, VehicleID)
VALUES 
 (1 ,1 ), 
 (2 ,2 ), 
 (3 ,3 ), 
 (4 ,4 ), 
 (5 ,5 ), 
 (6 ,6 ), 
 (7 ,7 ), 
 (8 ,8 ), 
 (9 ,9 ), 
 (10 ,10 ), 
 (11 ,11 ), 
 (12 ,12 ), 
 (13 ,13 ), 
 (14 ,14 ), 
 (15 ,15 );

============================================================================

CREATE TABLE Inventory (
    InventoryID INT IDENTITY PRIMARY KEY,
    VehicleID INT FOREIGN KEY REFERENCES Vehicles(VehicleID),
    QuantityAvailable INT NOT NULL,
    Location NVARCHAR(100) NOT NULL -- e.g., Showroom location
);

INSERT INTO Inventory (VehicleID, QuantityAvailable, Location)
VALUES 
(1, 10, 'Showroom A'),   -- Model S
(2, 5, 'Showroom B'),    -- Model 3
(3, 7, 'Showroom A'),    -- Model X
(4, 12, 'Showroom C'),   -- Model Y
(5, 20, 'Showroom A'),   -- Model S Plaid
(6, 15, 'Showroom B'),   -- Model 3 Performance
(7, 18, 'Showroom C'),   -- Model X Plaid
(8, 22, 'Showroom A'),   -- Model Y Performance
(9, 30, 'Showroom B'),   -- Cybertruck
(10, 25, 'Showroom C'),  -- Roadster
(11, 16, 'Showroom A'),  -- Model S Long Range
(12, 19, 'Showroom B'),  -- Model X Long Range
(13, 14, 'Showroom C'),  -- Model Y Long Range
(14, 17, 'Showroom A'),  -- Model S Refresh
(15, 21, 'Showroom B');  -- Model X Refresh

==================================================================================
CREATE TABLE Promotions (
    PromotionID INT IDENTITY PRIMARY KEY,
    Description NVARCHAR(255),
    DiscountPercentage DECIMAL(5, 2),
    StartDate DATETIME,
    EndDate DATETIME
);

INSERT INTO Promotions (Description, DiscountPercentage, StartDate, EndDate)
VALUES 
('Spring Sale - Save on Model S!', 10.00, '2024-03-01', '2024-05-31'),
('Holiday Discount on Model Y!', 15.00, '2024-12-01', '2024-12-31'),
('New Year Offer on Model X!', 20.00, '2024-01-01', '2024-01-31'),
('Black Friday Sale on Model S!', 25.00, '2024-11-24', '2024-11-30'),
('Cyber Monday Discount on Model Y!', 30.00, '2024-11-27', '2024-11-30'),
('Valentine''s Day Special on Roadster!', 35.00, '2024-02-01', '2024-02-14'), -- Fixed apostrophe
('Earth Day Promotion on all models!', 40.00, '2024-04-15', '2024-04-22'),
('Labor Day Sale on all vehicles!', 45.00, '2024-09-01', '2024-09-07'),
('Memorial Day Discount on all models!', 50.00, '2024-05-25', '2024-05-31'),
('Back to School Offer on Model Y!', 55.00, '2024-08-01', '2024-08-31'),
('Thanksgiving Sale on all models!', 60.00, '2024-11-20', '2024-11-26'),
('Christmas Special on all vehicles!', 65.00, '2024-12-15', '2024-12-25'),
('Anniversary Sale - All Models!', 70.00, '2024-06-01', '2024-06-30'),
('Summer Clearance Sale on all vehicles!', 75.00, '2024-07-01', '2024-08-31'),
('Fall Festival Discount on all models!', 80.00, '2024-09-15', '2024-10-15');

=================================================================================================

CREATE TABLE CustomerFeedback (
    FeedbackID INT IDENTITY PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    VehicleID INT FOREIGN KEY REFERENCES Vehicles(VehicleID),
    FeedbackDate DATETIME DEFAULT GETDATE(),
    Rating INT CHECK (Rating BETWEEN 1 AND 5), -- Rating scale from 1 to 5
    Comments NVARCHAR(255)
);

INSERT INTO CustomerFeedback (CustomerID, VehicleID, Rating, Comments)
VALUES  
(1, 1, 5, 'Absolutely love my Model S!'),
(2, 2, 4, 'Great car but could use more features.'),
(3, 3, 5, 'The performance is amazing!'),
(4, 4, 3, 'Good but not as expected.'),
(5, 5, 5, 'Best car I have ever owned!'),
(6, 6, 4, 'Very comfortable and spacious.'),
(7, 7, 5, 'Excellent service and quality!'),
(8, 8, 5, 'I love the autopilot feature!'),
(9, 9, 2, 'Had some issues with the battery.'),
(10, 10, 5, 'Roadster is a dream car!'),
(11, 11, 3, 'Decent but could be better.'),
(12, 12, 5, 'Fantastic experience overall!'),
(13, 13, 4, 'Really happy with my purchase.'),
(14, 14, 5, 'Tesla has changed my driving experience!'),
(15, 15, 5, 'Highly recommend to everyone!');

==========================================================================================
select * from Vehicles
select * from Customers
select * from Orders
select * from ServiceRecords
select * from Salespersons
select * from Payments
select * from TestDrives
select * from Inventory
select * from Promotions
select * from CustomerFeedback
===============================================================

============================= Sales Performance Analysis ======================

--- What are the total sales for each vehicle model in the last year? 

select v.vehicleid , sum(o.totalamount) as total_sale
from orders o
join  vehicles v  on v.vehicleid = o.vehicleid 
where o.orderdate = year(getdate())-1 
group by v.vehicleid 

---- Which vehicle model has the highest sales volume?

select top 1  v.vehicleid , v.model ,  sum(o.totalamount) as highest_sales_volume  
from orders o 
join vehicles v on o.vehicleid = v.vehicleid 
group by v.vehicleid , v.model
order by highest_sales_volume desc 

---- Are there any seasonal trends in vehicle sales?

SELECT 
    v.Model,YEAR(o.OrderDate) AS SaleYear, MONTH(o.OrderDate) AS SaleMonth, SUM(o.TotalAmount) AS TotalSales
FROM 
    Orders o
JOIN 
    Vehicles v ON o.VehicleID = v.VehicleID
GROUP BY 
    YEAR(o.OrderDate), MONTH(o.OrderDate), v.Model
ORDER BY  SaleYear, SaleMonth, TotalSales DESC;

================ Customer Feedback Insights=================================
select * from vehicles 

---- What is the average rating for each vehicle model? 

select model , avg(rating) as average_rating 
from vehicles v 
join CustomerFeedback cf on v.vehicleid = cf.vehicleid 
group by model 

--- How many customers have provided feedback on their vehicles? 

select count(*) as number_of_customers 
from CustomerFeedback

----- Are there any common themes in customer comments?

select * from CustomerFeedback 

select comments 
from CustomerFeedback

=============================== 3 .  Inventory Management =================================

----- What is the current inventory level ( quantityavailable) for each vehicle model? 

select * from Inventory

select v.model , i.quantityavailable 
from vehicles v 
join inventory i on v.vehicleid = i.vehicleid 

------ Are there any vehicles with low inventory that need restocking?

select v.model , i.quantityavailable 
from  inventory i
join vehicles v on  i.vehicleid =  v.vehicleid 
where i.quantityavailable < 2 ; 

---------- How does inventory correlate with sales data over the past year? 

SELECT  v.Model,  SUM(o.TotalAmount) AS TotalSales,i.QuantityAvailable
FROM  Orders o
JOIN  Vehicles v ON o.VehicleID = v.VehicleID
JOIN  Inventory i ON v.VehicleID = i.VehicleID
WHERE  o.OrderDate >= DATEADD(YEAR, -1, GETDATE())  -- Sales in the last year
GROUP BY  v.Model,  i.QuantityAvailable;

select v.model , sum(o.totalamount) as total_sales , i.quantityavailable 
from orders o 
join vehicles v on o.vehicleid = v.vehicleid 
join inventory i on v.vehicleid = i.vehicleid 
where o.orderdate >= dateadd(year,-1,getdate()) 
group by v.Model,  i.QuantityAvailable;

==================== 4. Service Record Analysis ===============================

--- 1. What are the most common types of service requests? 


select * from ServiceRecords 
select * from orders 

select description , count(serviceid) as no_of_requests 
from ServiceRecords 
group by description
order by no_of_requests  desc 

---- 2. Which vehicle models have the highest service costs? 

select vehicleid , sum(cost) as service_cost 
from ServiceRecords 
group by vehicleid 

--- 3. Is there a correlation between service frequency and customer satisfaction ratings?

select v.vehicleid , count(sr.serviceid) as service_frequency , 
       avg(cf.rating) as average_rating 
from vehicles v 
left join ServiceRecords sr ON v.VehicleID = sr.VehicleID
left join CustomerFeedback cf ON v.VehicleID = cf.VehicleID
group by v.vehicleid

================== 5 . Promotions Effectiveness =============================

select * from Promotions
select * from orders 

---- How much revenue was generated during promotional periods compared to non-promotional periods? 

select 
case when o.orderdate between p.startdate and p.enddate then 'Promotional' else 'Non_Promotional'
end as 'Promotion_Period' , 
sum(o.totalamount) as Revenue 
from orders o 
join promotions p on o.OrderDate BETWEEN p.StartDate AND p.EndDate
group by case when o.orderdate between p.startdate and p.enddate then 'Promotional' else 'Non_Promotional'
end ; 

---------- Which promotions resulted in the highest sales increase?

select p.description , sum(o.totalamount) as highest_sales 
from orders o 
join promotions p on o.OrderDate BETWEEN p.StartDate AND p.EndDate
group by  p.description
ORDER BY  highest_sales DESC;

------ Are there specific models that benefit more from promotions?

SELECT 
    v.Model, 
    SUM(o.TotalAmount) AS TotalSalesDuringPromotion
FROM 
    Orders o
JOIN 
    Vehicles v ON o.VehicleID = v.VehicleID
JOIN 
    Promotions p ON o.OrderDate BETWEEN p.StartDate AND p.EndDate
GROUP BY 
    v.Model
ORDER BY 
    TotalSalesDuringPromotion DESC;












