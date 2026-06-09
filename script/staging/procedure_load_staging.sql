============================================================================================================
Stored procedure: Load Staging Layer (Raw -> Staging)
============================================================================================================
Purpose:
  This Procedure performs the ETL (Extract, Transform, Load) process to populate the 'staging' schema tables
  from the 'raw' schema.
Actions Performed:
  - Truncate Staging tables
  - Inserts transformed and cleansed data from Raw into Staging tables.

Parameters:
  None.
  This stored procedure does not accept any parameters or return any values.

Usage Example:
  EXEC Staging.load_staging;
============================================================================================================

CREATE OR ALTER PROCEDURE staging.load_staging as
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '====================================================';
        PRINT 'Loading Staging Layer';
        PRINT '====================================================';

        PRINT '----------------------------------------------------';
        PRINT 'Loading CRM Table';
        PRINT '----------------------------------------------------';

	--- Loading staging.crm_customers
	SET @start_time = GETDATE();
	PRINT '>> Truncating Table: staging.crm_customers'
	TRUNCATE TABLE staging.crm_customers;

	PRINT '>> Inserting Data Into: staging.crm_customers'
	INSERT INTO staging.crm_customers (
    Customer_ID,
    Email,
    City,
    Country,
    Registration_Date)
SELECT
    TRY_CAST(Customer_ID AS INT),
    Email,
    City,
    Country,
    TRY_CAST(Registration_Date AS DATE)
FROM raw.crm_customers
WHERE TRY_CAST(Customer_ID AS INT) IS NOT NULL;

		SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';
        PRINT '----------------';

		PRINT '----------------------------------------------------';
        PRINT 'Loading Orders Tables';
        PRINT '----------------------------------------------------';

	--- Loading staging.orders
	 SET @start_time = GETDATE();
	 PRINT '>> Truncating Table: staging.orders'
	 TRUNCATE TABLE staging.orders;

	PRINT '>> Inserting Data Into: staging.orders'
	INSERT INTO staging.orders (Invoice, Customer_ID, InvoiceDate)
SELECT
    Invoice,
    TRY_CAST(TRY_CAST(Customer_ID AS FLOAT) AS INT),
    TRY_CAST(InvoiceDate AS DATETIME)
FROM (
    SELECT *,
        CASE WHEN Invoice NOT LIKE 'C%' THEN 1 ELSE 0 END AS valid_orders
    FROM raw.orders
) t
WHERE valid_orders = 1
AND TRY_CAST(InvoiceDate AS DATETIME) IS NOT NULL
AND TRY_CAST(TRY_CAST(Customer_ID AS FLOAT) AS INT) IS NOT NULL;

	SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';
        PRINT '----------------';

		PRINT '----------------------------------------------------';
        PRINT 'Loading ERP Tables';
        PRINT '----------------------------------------------------';

	--- Loading staging.orders_cancellations
	 SET @start_time = GETDATE();
	 PRINT '>> Truncating Table: staging.orders_cancellations'
	 TRUNCATE TABLE staging.orders_cancellations;

	PRINT '>> Inserting Data Into: staging.orders_cancellations'
  INSERT INTO staging.orders_cancellations (Invoice, Customer_ID, InvoiceDate)
  SELECT
      Invoice,
      TRY_CAST(TRY_CAST(Customer_ID AS FLOAT) AS INT),
      TRY_CAST(InvoiceDate AS DATETIME)
  FROM (
      SELECT *,
          CASE WHEN Invoice NOT LIKE 'C%' THEN 1 ELSE 0 END AS valid_orders
      FROM raw.orders
  ) t
  WHERE valid_orders = 0
  AND TRY_CAST(InvoiceDate AS DATETIME) IS NOT NULL


	-- Loading staging.order_items
	 SET @start_time = GETDATE();
	 PRINT '>> Truncating Table: staging.order_items'
	 TRUNCATE TABLE staging.order_items;

	PRINT '>> Inserting Data Into: staging.order_items'
	INSERT INTO staging.order_items (Invoice, StockCode, Description, Quantity, Price)
  SELECT 
      Invoice,
      UPPER(TRIM(StockCode)),
      UPPER(TRIM(Description)),
      TRY_CAST(Quantity AS FLOAT),
      TRY_CAST(Price AS FLOAT)
  FROM raw.order_items
  WHERE TRY_CAST(Quantity AS FLOAT) > 0
  AND   TRY_CAST(Price AS FLOAT)    > 0;

		SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';
        PRINT '----------------';

		 SET @batch_end_time = GETDATE();
        PRINT '===================================='
        PRINT 'Loading Staging Layer is Completed';
        PRINT '    - Total Load Duration: ' + CAST(DATEDIFF(SECOND,@batch_start_time,@batch_end_time) AS NVARCHAR) +' seconds';
        PRINT '===================================='
    END TRY
    BEGIN CATCH
        PRINT '========================================'
        PRINT 'ERROR OCCURED DURING LOADIND Staging LAYER'
        PRINT 'Error Message' + ERROR_MESSAGE();
        PRINT 'Error Message' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error Message' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '========================================'
    END CATCH   
END
