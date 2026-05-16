-- LOAD DIMENSION TABLES --

USE SupermarketDW;
GO

INSERT INTO dbo.Dim_Product (ProductLine)
SELECT DISTINCT ProductLine
FROM dbo.stg_supermarket_sales
WHERE ProductLine IS NOT NULL;

INSERT INTO dbo.Dim_Customer (CustomerType, Gender)
SELECT DISTINCT CustomerType, Gender
FROM dbo.stg_supermarket_sales
WHERE CustomerType IS NOT NULL
  AND Gender IS NOT NULL;

INSERT INTO dbo.Dim_Location (Branch, City)
SELECT DISTINCT Branch, City
FROM dbo.stg_supermarket_sales
WHERE Branch IS NOT NULL
  AND City IS NOT NULL;

INSERT INTO dbo.Dim_Payment (PaymentMethod)
SELECT DISTINCT Payment
FROM dbo.stg_supermarket_sales
WHERE Payment IS NOT NULL;

INSERT INTO dbo.Dim_Date (
    FullDate,
    DayNum,
    MonthNum,
    MonthName,
    QuarterNum,
    YearNum
)
SELECT DISTINCT
    TRY_CONVERT(DATE, SaleDate, 101) AS FullDate,
    DAY(TRY_CONVERT(DATE, SaleDate, 101)) AS DayNum,
    MONTH(TRY_CONVERT(DATE, SaleDate, 101)) AS MonthNum,
    DATENAME(MONTH, TRY_CONVERT(DATE, SaleDate, 101)) AS MonthName,
    DATEPART(QUARTER, TRY_CONVERT(DATE, SaleDate, 101)) AS QuarterNum,
    YEAR(TRY_CONVERT(DATE, SaleDate, 101)) AS YearNum
FROM dbo.stg_supermarket_sales
WHERE TRY_CONVERT(DATE, SaleDate, 101) IS NOT NULL;
GO