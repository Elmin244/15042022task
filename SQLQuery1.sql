CREATE DATABASE FIORELLO
USE FIORELLO
Create table Categories(
ID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(255) NOT NULL,
)

Create table Product(
ID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(255) NOT NULL,
Price DECIMAL NOT NULL,
CategoryID INT FOREIGN KEY REFERENCES Categories(ID),
DiscountAmount DECIMAL NOT NULL,
isNew BIT NOT NULL,
Count INT NOT NULL,
Descc NVARCHAR(1500) NOT NULL,
Code NVARCHAR(10) NOT NULL,
CostPrice DECIMAL NOT NULL,	
)

Create table ProductImages(
ID INT PRIMARY KEY IDENTITY,
ProductID INT FOREIGN KEY REFERENCES Product(ID)
)
Create table Tags(
ID INT PRIMARY KEY IDENTITY,
Name NVARCHAR NOT NULL,
)
Create table ProductTags(
ID INT PRIMARY KEY IDENTITY,
ProductID INT FOREIGN KEY REFERENCES Product(ID),
TagID INT FOREIGN KEY REFERENCES Tags(ID)
)
Create table Users(
ID INT PRIMARY KEY IDENTITY,
FullName NVARCHAR(35),
Email NVARCHAR(100),
Image NVARCHAR(100),
PasswoordHash NVARCHAR(100),
Address NVARCHAR(100),
)
Create table Reviews(
ID INT PRIMARY KEY IDENTITY,
ProductID INT,
UserID INT FOREIGN KEY REFERENCES Users(ID),
Name NVARCHAR(35),
Email NVARCHAR(100),
Text NVARCHAR(350),
CreatedAt datetime2
)
Create table Orders(
ID INT PRIMARY KEY IDENTITY,
UserID INT FOREIGN KEY REFERENCES Users(ID),
CreatedAt DATETIME2,
Deliveried DATETIME2,
Status TINYINT,
PaymentStatus TINYINT,
TotalAmount DECIMAL,
Address NVARCHAR(100),
Email NVARCHAR(100),
FullName NVARCHAR(35),
)

Create table OrdersItem(
ID INT PRIMARY KEY IDENTITY,
ProductID INT FOREIGN KEY REFERENCES Product(ID),
OrderID INT FOREIGN KEY REFERENCES Orders(ID),
Count INT NOT NULL,
Price DECIMAL,
DiscountAmount DECIMAL,
CostPrice DECIMAL
)
Create table AdditionalInfoTypes(
ID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(30)
)
Create table AdditionalInfos(
ID INT PRIMARY KEY IDENTITY,
ProductID INT FOREIGN KEY REFERENCES AdditionalInfoTypes(ID),
AdditionalTypeID INT,
Value NVARCHAR NOT NULL
)
Create table Sliders(
ID INT PRIMARY KEY IDENTITY,
Title NVARCHAR(200),
Text NVARCHAR(500),
Image NVARCHAR(100),
[Order] INT NOT NULL
)

INSERT INTO Categories(Name)
Values ('Standart'),('Grouped'),('Variable'),('Virtual')


Select * from Product


SELECT U.FullName,(SELECT COUNT(*) FROM Orders WHERE Orders.UserID = U.ID)AS 'Countu 0 olan' FROM Users AS U
Left JOIN Orders ON U.Id = Orders.UserId
WHERE (SELECT COUNT(*) FROM Orders WHERE Orders.UserId = U.ID) = 0

CREATE VIEW Total 
AS
SELECT Users.ID,Users.FullName,Users.Email,Orders.TotalAmount from Users
Join Orders ON Orders.UserID=Users.ID



