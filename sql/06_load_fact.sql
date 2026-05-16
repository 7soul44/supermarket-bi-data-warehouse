--LOAD FACT TABLE--

USE SupermarketDW;
GO

INSERT INTO dbo.Fact_Sales (
    InvoiceID,
    DateKey,
    ProductKey,
    CustomerKey,
    LocationKey,
    PaymentKey,
    UnitPrice,
    Quantity,
    TaxPct,
    Total,
    COGS,
    GrossIncome,
    Rating
)
SELECT
    s.InvoiceID,
    d.DateKey,
    p.ProductKey,
    c.CustomerKey,
    l.LocationKey,
    pay.PaymentKey,
    s.UnitPrice,
    s.Quantity,
    s.TaxPct,
    s.Total,
    s.COGS,
    s.GrossIncome,
    s.Rating
FROM dbo.stg_supermarket_sales s
JOIN dbo.Dim_Date d
    ON d.FullDate = TRY_CONVERT(DATE, s.SaleDate, 101)
JOIN dbo.Dim_Product p
    ON p.ProductLine = s.ProductLine
JOIN dbo.Dim_Customer c
    ON c.CustomerType = s.CustomerType
   AND c.Gender = s.Gender
JOIN dbo.Dim_Location l
    ON l.Branch = s.Branch
   AND l.City = s.City
JOIN dbo.Dim_Payment pay
    ON pay.PaymentMethod = s.Payment;
GO