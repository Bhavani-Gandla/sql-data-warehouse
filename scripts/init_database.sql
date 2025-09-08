/*
Create Database and Schemas
******************************************************************
Script Purpose:
  This script creates a new database named 'DataWareHouse' after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally, the script ets up three schemas within the database: 'bronze' , 'silver' , 'gold'.

Warning:
Running this script will drop the entire 'DataWareHouse' database if it exists.
All data in the database will be permanently deleted. Proceed with caution and ensure you have proper backups running this script.
*/
USE master;
GO

--Drop and recreate the 'DataWareHouse' database
  IF EXISTS (SELECT 1 FROM sys.dayabase WHERE name='DataWareHouse')
  BEGIN
      ALTER DATABASE DataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
      DROP DATABASE DataWareHouse;
  END;
  GO

--creating Database
CREATE DATABASE DataWareHouse;
GO

--Using Database
USE DataWareHouse;
GO

--creating Schema For Bronze Layer
CREATE SCHEMA Bronze;
GO

--creating Schema For Silver Layer
CREATE SCHEMA Silver;
GO

--creating Schema For Gold Layer
CREATE SCHEMA Gold;
GO
