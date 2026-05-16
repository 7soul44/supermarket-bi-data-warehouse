-- CREATE DIMENSIONS --

USE SupermarketDW;
GO

CREATE TABLE dbo.Dim_Date (
    DateKey INT IDENTITY(1,1) PRIMARY KEY,
    FullDate DATE,
    DayNum INT,
    MonthNum INT,
    MonthName NVARCHAR(20),
    QuarterNum INT,
    YearNum INT
);

CREATE TABLE dbo.Dim_Product (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductLine NVARCHAR(100)
);

CREATE TABLE dbo.Dim_Customer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerType NVARCHAR(20),
    Gender NVARCHAR(10)
);

CREATE TABLE dbo.Dim_Location (
    LocationKey INT IDENTITY(1,1) PRIMARY KEY,
    Branch NVARCHAR(10),
    City NVARCHAR(50)
);

CREATE TABLE dbo.Dim_Payment (
    PaymentKey INT IDENTITY(1,1) PRIMARY KEY,
    PaymentMethod NVARCHAR(30)
);
