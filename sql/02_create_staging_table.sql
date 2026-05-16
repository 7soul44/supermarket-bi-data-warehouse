-- CREATE STAGING TABLE--

USE SupermarketDW;
GO

CREATE TABLE dbo.stg_supermarket_sales (
    InvoiceID NVARCHAR(30),
    Branch NVARCHAR(10),
    City NVARCHAR(50),
    CustomerType NVARCHAR(20),
    Gender NVARCHAR(10),
    ProductLine NVARCHAR(100),
    UnitPrice DECIMAL(10,2),
    Quantity INT,
    TaxPct DECIMAL(10,4),
    Total DECIMAL(10,2),
    SaleDate NVARCHAR(20),
    SaleTime NVARCHAR(20),
    Payment NVARCHAR(30),
    COGS DECIMAL(10,2),
    GrossIncome DECIMAL(10,2),
    Rating DECIMAL(10,2)
);