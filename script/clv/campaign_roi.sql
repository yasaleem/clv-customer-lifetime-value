

DROP TABLE IF EXISTS clv.campaign_roi;

CREATE TABLE clv.campaign_roi (
    Segment                NVARCHAR(20),
    Customer_Count         INT,
    Avg_Projected_CLV      FLOAT,
    Max_Spend_Per_Customer FLOAT,
    Total_Segment_CLV      FLOAT,
    Total_Campaign_Budget  FLOAT,
    Priority               NVARCHAR(20)
    dwh_create_date        DATETIME2 DEFAULT GETDATE()
);
