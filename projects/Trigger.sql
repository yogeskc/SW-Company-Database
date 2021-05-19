DROP TRIGGER AccTableUpdate;
DELIMITER $$
CREATE TRIGGER AccTableUpdate AFTER INSERT on `User`
  FOR EACH ROW
  BEGIN 	
		-- Update Account Table
         	INSERT INTO `account`(created_date,user_id) 
            VALUES (NOW(), new.user_id);
END$$
DELIMITER ;


DROP PROCEDURE  AccountUpdate;
DELIMITER $$
CREATE PROCEDURE AccountUpdate(created_date DATE, password VARCHAR(45),user_id TINYINT, email VARCHAR(45))
BEGIN
		
        

      	-- INSERT INTO `account`(date, password, user_id, email) 
           -- VALUES (NOW(),last_insert_id(), new.user_id,last_insert_id());
            
            INSERT INTO Account(passkey,user_id ,email) 
            VALUES (1,1,'la');
 
END$$
DELIMITER ;
CALL AccountUpdate();