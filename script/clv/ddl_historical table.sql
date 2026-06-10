

DROP TABLE IF EXISTS clv.historical_clv;

CREATE TABLE clv.historical_clv (
    Customer_ID            INT,
    First_Order_Date       DATETIME,
    Last_Order_Date        DATETIME,
    Total_Orders           INT,
    Total_Items            FLOAT,
    Total_Revenue          FLOAT,
    Avg_Order_Value        FLOAT,
    Customer_Lifespan_Days INT,
    dwh_create_date        DATETIME2 DEFAULT GETDATE()
);
