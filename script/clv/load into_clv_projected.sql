
INSERT INTO clv.projected_clv (
    Customer_ID, Avg_Order_Value, Orders_Per_Month,
    Projected_Orders_12M, Projected_CLV_12M, CLV_Tier)
SELECT
    Customer_ID,
    Avg_Order_Value,
    Orders_Per_Month,
    Projected_Orders_12M,
    Projected_CLV_12M,
    CASE
        WHEN Projected_CLV_12M > 5000 THEN 'Platinum'
        WHEN Projected_CLV_12M > 1810 THEN 'Gold'
        WHEN Projected_CLV_12M > 741  THEN 'Silver'
        ELSE                               'Bronze'
    END AS CLV_Tier
FROM (
    SELECT
        Customer_ID,
        Avg_Order_Value,
        COALESCE(
            CAST(Total_Orders AS FLOAT) / 
            NULLIF(DATEDIFF(MONTH, First_Order_Date, Last_Order_Date), 0),
            Total_Orders
        )                                        AS Orders_Per_Month,
        COALESCE(
            CAST(Total_Orders AS FLOAT) / 
            NULLIF(DATEDIFF(MONTH, First_Order_Date, Last_Order_Date), 0),
            Total_Orders
        ) * 12                                   AS Projected_Orders_12M,
        ROUND(
            Avg_Order_Value * COALESCE(
                CAST(Total_Orders AS FLOAT) / 
                NULLIF(DATEDIFF(MONTH, First_Order_Date, Last_Order_Date), 0),
                Total_Orders
            ) * 12, 2
        )                                        AS Projected_CLV_12M
    FROM clv.historical_clv
) base;
