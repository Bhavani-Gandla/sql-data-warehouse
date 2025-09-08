/*
**********************************************************************************
Stored Procedure: Load Bronze Layer (Source -> Bronze)
*********************************************************************************
Script Purpose:
  This stored procedure loads data into the 'bronze' schema from external csv files.
  It performs the following actions:
  - Truncates the bronze tables before loading data.
  - Uses the 'BULK INSERT' command to load data from csv files to bronze tables.

Parameters;
None.
This stored procedure does not accept any parameters or return any values.

Usage Example:
EXEC bronze.load_bronze;
*********************************************************************************
*/

CREATE OR ALTER PROCEDURE Bronze.load_bronze AS
BEGIN
BEGIN TRY
	PRINT '===============================================================';
	PRINT 'Loading Bronze Layer';
	PRINT '===============================================================';

	PRINT '---------------------------------------------------------------';
	PRINT 'Loading CRM Tables';
	PRINT '----------------------------------------------------------------';

		PRINT '>>Truncating Table:Bronze.crm_cust_info';
		TRUNCATE TABLE Bronze.crm_cust_info;

		PRINT '>>Inserting Data Into:Bronze.crm_cust_info';
		BULK INSERT Bronze.crm_cust_info
		FROM 'C:\Users\gandl\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			ROWTERMINATOR='\n',
			TABLOCK
			);

		PRINT '>>Truncating Table:Bronze.crm_prd_info';
		TRUNCATE TABLE Bronze.crm_prd_info;

		PRINT '>>Inserting Data Into:Bronze.crm_prd_info';
		BULK INSERT Bronze.crm_prd_info
		FROM 'C:\Users\gandl\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			ROWTERMINATOR='\n',
			TABLOCK
			);

		PRINT '>>Truncating Table:Bronze.crm_sales_details';
		TRUNCATE TABLE Bronze.crm_sales_details;

		PRINT '>>Inserting Data Into:Bronze.crm_sales_details';
		BULK INSERT Bronze.crm_sales_details
		FROM 'C:\Users\gandl\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			ROWTERMINATOR='\n',
			TABLOCK
			);

	
		PRINT '>>Truncating Table:Bronze.erp_LOC_A101';
		TRUNCATE TABLE Bronze.erp_LOC_A101;

		PRINT '>>Inserting Data Into:Bronze.erp_LOC_A101';
		BULK INSERT Bronze.erp_LOC_A101
		FROM 'C:\Users\gandl\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			ROWTERMINATOR='\n',
			TABLOCK
			);
		PRINT '---------------------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '----------------------------------------------------------------';


		PRINT '>>Truncating Table:Bronze.erp_CUST_AZ12';
		TRUNCATE TABLE Bronze.erp_CUST_AZ12;

		PRINT '>>Inserting Data Into:Bronze.erp_CUST_AZ12';
		BULK INSERT Bronze.erp_CUST_AZ12
		FROM 'C:\Users\gandl\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			ROWTERMINATOR='\n',
			TABLOCK
			);

		PRINT '>>Truncating Table:Bronze.erp_PX_CAT_G1V2';
		TRUNCATE TABLE Bronze.erp_PX_CAT_G1V2;

		PRINT '>>Inserting Data Into:Bronze.erp_PX_CAT_G1V2';
		BULK INSERT Bronze.erp_PX_CAT_G1V2
		FROM 'C:\Users\gandl\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			ROWTERMINATOR='\n',
			TABLOCK
			);
		END TRY
		BEGIN CATCH
			PRINT '============================================================';
			PRINT 'ERROR OCCURED DURING BRONZE LAYER';
			PRINT 'Error Message'+ERROR_MESSAGE();
			PRINT 'Error Message'+CAST(ERROR_NUMBER() AS NVARCHAR);
			PRINT 'Error Message'+ CAST(ERROR_STATE() AS NVARCHAR);
		END CATCH

END
