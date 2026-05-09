/*
==============================================================================================
Stored Procedure: Load Bronze Layer
==============================================================================================
Script Purpose:
  This stored procedure loads data into the 'bronze' schema from external CSV files.
  It performs the following actions:
  - Truncate the bronze tables before loading data.
  - Uses the 'BULK INSERT' command to load data from csv files to bronze tables.

Parameters:
  None.
  This stored procedure does not accept any parameters or return any values.

Usage Example:
  EXEC bronze.load_bronze;
==============================================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @start_complete_time DATETIME, @end_complete_time DATETIME;
	BEGIN TRY
		SET @start_complete_time = GETDATE();
		PRINT '==========================================';
		PRINT 'Loading Bronze Layer';
		PRINT '==========================================';

		PRINT '------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '>> Inserting Data into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'D:\Data Analytics\SQL with BARAA\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '--------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>> Inserting Data into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\Data Analytics\SQL with BARAA\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '--------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '>> Inserting Data into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\Data Analytics\SQL with BARAA\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '--------------------------------';

		PRINT '------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT '>> Inserting Data into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\Data Analytics\SQL with BARAA\sql-data-warehouse-project-main\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '--------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT '>> Inserting Data into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\Data Analytics\SQL with BARAA\sql-data-warehouse-project-main\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '--------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.px_cat_g1v2';
		TRUNCATE TABLE bronze.px_cat_g1v2;
		PRINT '>> Inserting Data into: bronze.px_cat_g1v2';
		BULK INSERT bronze.px_cat_g1v2
		FROM 'D:\Data Analytics\SQL with BARAA\sql-data-warehouse-project-main\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '--------------------------------';
		SET @end_complete_time = GETDATE();
		PRINT 'Loading Bronze Layer is complete';
		PRINT '>> Bronze Layer Loading Duration: ' + CAST(DATEDIFF(second, @start_complete_time, @end_complete_time) AS NVARCHAR) + ' seconds';
	END TRY
	BEGIN CATCH
		PRINT '==================================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'ERROR ' + ERROR_MESSAGE();
		PRINT 'ERROR ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR ' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '==================================================';
	END CATCH
END
