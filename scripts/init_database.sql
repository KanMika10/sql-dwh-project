/* 
CREATE DATABASE AND SCHEMAS

Script Purpose:
This script creates new database named 'DataWarehouse' after checking if it already exists.
If it already exists, it is dropped and recreated. Additionally, the script sets up three 
schemas within database: 'bronze', 'silver', 'gold'.

WARNING
Running this script will drop entire database named 'DataWarehouse' if it already exists.
All data in the database will be permanently deleted. 
Make sure you have proper backup before running this code
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO
  
CREATE SCHEMA silver;
GO
  
CREATE SCHEMA gold;
GO









