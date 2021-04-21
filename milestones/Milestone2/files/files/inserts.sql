-- Script name: inserts.sql
   -- Author:      Yangesh Kc 920771082
   -- Purpose:     insert sample data to test the integrity of this database system
   
   -- the database used to insert the data into.

USE swcompanydb;

SELECT * FROM Company;
 INSERT INTO Company (name, company_id) VALUES ("Netos", 1),("FinTech", 2),("AeroTech", 3);
 

SELECT * FROM Address; 
 INSERT INTO Address (addr_id, zipcode, country, state, city, street) 
			 VALUES (1, 77, "USA", "CA", "SFO", "Cipher ST" ),(2, 19, "USA", "TX", "Dallas", "Alcatraz CT" ),(3, 27, "Canada", "ON", "Toronto", "Alber ST" );

SELECT * FROM User; 
  INSERT INTO User (user_id, email, name , middlename,addr_id,lname, company_id) 
		 VALUES (1,"abc@gmail.com","John","A","1","Robets", 1),(2,"def@gmail.com","Trevor","W","2","Williams", 2),(3,"ghi@gmail.com","Cindy","C","3","Chan", 3);
                
			
SELECT * FROM Account;
	INSERT INTO Account (acc_id, created_date,user_id) VALUES (1,"01/10/2021",1), (2,"02/21/2021",2), (3,"05/21/2021",3);
    
SELECT * FROM Profile;
   INSERT INTO Profile(avatar, profile_id, alias) VALUES ('1ZasdA', 1 ,'Noob'),('1ZasdB', 3 ,'Amatuer'), ('1ZasdA', 3 ,'Advance');
   
SELECT * FROM Credentials;
	INSERT INTO Credentials (password, acc_id) VALUES ('password@1',1), ('password@2',2),('password@3',3);
    

SELECT * FROM RegisteredUser;
	INSERT INTO RegisteredUser (reg_acc_id) VALUES (1),(2),(3);
    
SELECT * FROM Client;
	INSERT INTO Client (clientID) VALUES (1),(2),(3);
   
SELECT * FROM CustomerOrder;
    INSERT INTO CustomerOrder (order_id, project_type, client_id, company_id)
		VALUES(1,"Contract", 1, 1),(2,"Contract", 2, 2), (3,"Contract", 3, 3);
    
SELECT * FROM BoardofDirectors;
     INSERT INTO BoardofDirectors(board_addr,phone_numner,company_id,dept_addrs,announcement) 
          VALUES("1111 Spruce St", 13, 1, 1,1),("212 Arizona St", 12, 2, 2,2),("111 South Stone St", 91, 3, 3,3);
        
	
 SELECT * FROM CEO;
         INSERT INTO CEO ( email, phone_number, firstname, midllename, lname, dept_addr)
				   VALUES("tony@gmail.com",93,"Tony", "W","Adams",1),("tim@gmail.com",93,"Tim", "M","Rogers",2),("alex@gmail.com",96,"Alex", "V","Atkinson",3);
				
SELECT * FROM CompanyRules;
	INSERT INTO CompanyRules(privacypolicy, termsofuse, date, announcement_id)
		  VALUES("Privacy 1", "Terms 1",date('21/02/1'), 1),("Privacy 1", "Terms 1",date('21/02/1'), 2),("Privacy 1", "Terms 1",date('21/02/1'), 3);
        
SELECT * FROM MessageBoard;  
        INSERT INTO MessageBoard(date, Message, annoncement_id)
        VALUES(date('21/02/2'), "Message1" ,1),(date('21/02/2'), "Message2" ,2),(date('21/02/2'), "Message3" ,3);
        

SELECT * FROM Employee; 
	INSERT INTO Employee(employee_id,name,middlename,lname, salary)
		VALUES(1,'Albert','', 'Einstien', 20),(2,'Givy','', 'Gonzalez', 230),(3,'Chris','K', 'Johnson', 200);
	
SELECT * FROM HireDate; 
      INSERT INTO HireDate(Date, eid)
		VALUES ( date('21/02/1'),1),( date('21/02/1'),2),( date('21/02/1'),3);
        
SELECT * FROM employeeAdr; 
  INSERT INTO employeeAdr(employee_id, addr_id)
		VALUES (1,1),(2,2),(3,3);
        
SELECT * FROM Manager; 
	INSERT INTO Manager(manager_id, employee_id)
		VALUES(1,1),(2,2),(3,3);
        

SELECT * FROM CompanyProjects;
   INSERT INTO CompanyProjects(work_id,employee_id, manager_id,pid)
		VALUES(1,1,1,1),(2,2,2,2),(3,3,3,3);

SELECT * FROM Joblist;
    INSERT INTO Joblist(work_id,manager_id)
		VALUES(1,1),(2,2),(3,3);

SELECT * FROM Task;
   INSERT INTO Task(Job_id, contract, fulltime, partime)
	VALUES(1,'13X3', 'Yes', 'No');
    
