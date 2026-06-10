

DROP TABLE IF EXISTS clv.projected_clv;

CREATE TABLE clv.projected_clv (
    Customer_ID          INT,
    Avg_Order_Value      FLOAT,
    Orders_Per_Month     FLOAT,
    Projected_Orders_12M FLOAT,
    Projected_CLV_12M    FLOAT,
    CLV_Tier             NVARCHAR(20),
    dwh_create_date      DATETIME2 DEFAULT GETDATE()
);
