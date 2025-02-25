-- Check for NULLS or Duplicates in Primary Key
-- Expectation: No Result
SELECT 
	prd_id,
	COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for unwanted spaces
-- Expectation is no results
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Data standardization & Consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

-- Check for invalid date orders
-- Expectation is no results
SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt

-- Check for nulls or negative number
-- Expectation is no results
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

SELECT * FROM silver.crm_sales_details

use DWH_project;
EXEC sp_help 'silver.crm_prd_info';
EXEC sp_help 'bronze.crm_prd_info';
