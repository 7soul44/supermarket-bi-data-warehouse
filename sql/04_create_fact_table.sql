-- =====================================================
-- Project: Supermarket BI Data Warehouse
-- Script: 04_create_fact_table.sql
-- Description: Creation of the fact table and foreign key relationships
-- =====================================================

USE SupermarketDW;
GO

CREATE TABLE dbo.Fact_Sales (
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,
    InvoiceID NVARCHAR(30),
    DateKey INT,
    ProductKey INT,
    CustomerKey INT,
    LocationKey INT,
    PaymentKey INT,
    UnitPrice DECIMAL(10,2),
    Quantity INT,
    TaxPct DECIMAL(10,4),
    Total DECIMAL(10,2),
    COGS DECIMAL(10,2),
    GrossIncome DECIMAL(10,2),
    Rating DECIMAL(10,2),

    -- Foreign keys connect the fact table with the related dimension tables
    
    CONSTRAINT FK_FactSales_Date FOREIGN KEY (DateKey) REFERENCES dbo.Dim_Date(DateKey),
    CONSTRAINT FK_FactSales_Product FOREIGN KEY (ProductKey) REFERENCES dbo.Dim_Product(ProductKey),
    CONSTRAINT FK_FactSales_Customer FOREIGN KEY (CustomerKey) REFERENCES dbo.Dim_Customer(CustomerKey),
    CONSTRAINT FK_FactSales_Location FOREIGN KEY (LocationKey) REFERENCES dbo.Dim_Location(LocationKey),
    CONSTRAINT FK_FactSales_Payment FOREIGN KEY (PaymentKey) REFERENCES dbo.Dim_Payment(PaymentKey)
);
GO
