


INSERT INTO clv.historical_clv (
    Customer_ID, First_Order_Date, Last_Order_Date,
    Total_Orders, Total_Items, Total_Revenue,
    Avg_Order_Value, Customer_Lifespan_Days)
SELECT
    C.Customer_ID,
    MIN(O.InvoiceDate)                                    AS First_Order_Date,
    MAX(O.InvoiceDate)                                    AS Last_Order_Date,
    COUNT(DISTINCT O.Invoice)                             AS Total_Orders,
    SUM(OI.Quantity)                                      AS Total_Items,
    ROUND(SUM(OI.Quantity * OI.Price), 2)                 AS Total_Revenue,
    ROUND(SUM(OI.Quantity * OI.Price) /
          COUNT(DISTINCT O.Invoice), 2)                   AS Avg_Order_Value,
    DATEDIFF(DAY, MIN(O.InvoiceDate), MAX(O.InvoiceDate)) AS Customer_Lifespan_Days
FROM staging.crm_customers C
JOIN staging.orders O   ON C.Customer_ID = O.Customer_ID
JOIN staging.order_items OI ON O.Invoice = OI.Invoice
WHERE YEAR(O.InvoiceDate) <= 2010
GROUP BY C.Customer_ID;
