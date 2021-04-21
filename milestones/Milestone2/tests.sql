-- Script name: tests.sql
-- Author:      Yangesh KC
-- Purpose:     test the integrity of this database system

	-- the database used to test the data into.

USE swcompanydb;
	
-- Testing User table
SELECT * FROM User; 
DELETE FROM User WHERE name = 'John';
UPDATE User SET user_id = 3 WHERE name = 'Trudi';
UPDATE User SET user_id = 2 WHERE name = 'Trudi';
SELECT * FROM User Where  company_id BETWEEN 2 AND 3;

-- Testing Company table 
SELECT * FROM Company;
UPDATE Company SET company_id = 2 WHERE name = "Alfa"; 
DELETE  FROM Company WHERE company_id= 1;    

 -- Testing Employee Table 
 SELECT * FROM Employee; 
 UPDATE Employee SET employee_id = 4 WHERE name = 'Givy';
 
  -- Testing Account Table
  SELECT * FROM Account; 
  DELETE FROM Account WHERE acc_id = 2;
       UPDATE Account SET user_id = 4 WHERE user_id = 2;

  -- Testing Account Table
  SELECT * FROM Address; 
  DELETE FROM Address WHERE addr_id = 2;
       UPDATE Address SET addr_id = 4 WHERE addr_id = 2;
	
    -- Testing Employee Table
  SELECT * FROM Employee; 
  DELETE FROM Employee WHERE employee_id = 2;
       UPDATE Employee SET employee_id = 4 WHERE employee_id = 2;

  -- Testing Device Table
  SELECT * FROM Device; 
  DELETE FROM Device WHERE device_id = 2;
       UPDATE Device SET pid= 4 WHERE device_id = 2;
       UPDATE Device Set device_id=1 WHERE device_id =2;
       

	


