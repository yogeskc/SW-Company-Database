package com.company;

import java.util.Scanner;
import java.security.MessageDigest;
import java.sql.*; 


public class Service {

    String email, fname, middlename, company,lname,password;
    static Scanner input = new Scanner(System.in); 

    private static final String INSERT_INFO = "INSERT INTO User"  +"(fname , middlename,lname) VALUES" + "(?,?,?);";
    private static final String Passkey = "INSERT INTO Account" + "(email,passkey) VALUES" +"(?,?);";
    private static final String Company = "INSERT INTO Company"  + "(name) VALUES" +"(?);";
    private static final String Search_db= "Select * FROM Company"  + "(name) VALUES" +"(?);";
    private static final String DELETE_INFO= "DELETE  FROM USER WHERE (fname, middlename,lname) VALUES" +"(?);";

    Service(){ 
     
        System.out.println("_____ Sign Up _______\n");
        System.out.print("Please Enter Firstname  : ");
        fname =  input.nextLine(); 

        System.out.print("Please Enter MiddleName : ");
        middlename =  input.nextLine(); 
        System.out.print("Please Enter LastName   : ");
        lname =  input.nextLine();  

        System.out.print("Enter Company Name      : ");
        company=  input.nextLine();  

        System.out.print("Please Enter Email      : ");
                      email =  input.nextLine(); 
        System.out.print("Please Enter Password   : ");
                    password =  input.nextLine();

      setInfo(email, password, fname, lname, middlename);
    
      createconnection();
     handlePassword(password,email);
      insertCompany(company);
      System.out.println("Account Created !!  \n");
      
    }
    

   
    private void createconnection() {
        System.out.print("\033[H\033[2J"); 
        System.out.println(" Creating Account....  ");

        try{            
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/swcompanydb","root","12345678");  
           
            //insert the data
            PreparedStatement preparedStatement = conn.prepareStatement(INSERT_INFO);
            // preparedStatement.setInt(1, userid);
          
            preparedStatement.setString(1, fname);
            preparedStatement.setString(2, middlename);
            preparedStatement.setString(3, lname);
            preparedStatement.executeUpdate();
           
            conn.close(); 
            
                    System.out.println("Adding Info....");
            }catch(Exception e){ System.out.println(e);}  
    }

    private void insertCompany(String com){ 
        try{            
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/swcompanydb","root","12345678");  
           
            //insert the data
            PreparedStatement preparedStatement = conn.prepareStatement(Company);
            preparedStatement.setString(1, com);
            preparedStatement.executeUpdate();
            conn.close(); 
            
             System.out.println("Company Added...");
            }catch(Exception e){ System.out.println(e);}  

    }

    private void handlePassword(String password,String email) {
            
                   
                    try{            
                        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/swcompanydb","root","12345678");  
                        MessageDigest hash = MessageDigest.getInstance("MD5");
                        hash.update(password.getBytes());
                        byte [] results = hash.digest();

                        StringBuilder  stinger = new StringBuilder(); 
                        for(byte b:results){ 
                            stinger.append(String.format("%02x", b));}

                        password = stinger.toString(); 
                        //insert the data
                        PreparedStatement preparedStatement = conn.prepareStatement(Passkey);
                        System.out.println("Password Hashed...");
                        
                        preparedStatement.setString(1, email);    
                        preparedStatement.setString(2, password);
                       
                        preparedStatement.executeUpdate();
                      
                        conn.close(); 
                        
                                
                        }catch(Exception e){ System.out.println(e);}  

    }



    public void setInfo(String email,String password, String fname,String lname, String middlename){
        this.email = email; 
        this.password = password; 
        this.fname = fname; 
        this.middlename = middlename; 
        this.lname = lname; 
    }


    public static void Search(){ 
        System.out.print("\033[H\033[2J"); 
        try{            
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/swcompanydb","root","12345678");  
           
            System.out.print("Search [Type anything]: ");
            String key =  input.nextLine(); 
           
            //insert the data
            PreparedStatement preparedStatement = conn.prepareStatement(Search_db);
            preparedStatement.setString(1, key);
            ResultSet rs =    preparedStatement.executeQuery();
            while (rs.next()){  
                System.out.println(rs.getString(1));
            }
            conn.close(); 
            
             System.out.println("Search Response...");
            }catch(Exception e){ System.out.println(e);}  

    }

    public static void InsertData(String email, String password, String fname, String lname, String middlename){ 
        System.out.print("\033[H\033[2J"); 
        try{            
           
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/swcompanydb","root","12345678");  
           
            //insert the data
            PreparedStatement preparedStatement = conn.prepareStatement(INSERT_INFO);
            // preparedStatement.setInt(1, userid);
          
            preparedStatement.setString(1, fname);
            preparedStatement.setString(2, middlename);
            preparedStatement.setString(3, lname);
            preparedStatement.executeUpdate();
           
           
            System.out.print("Please Enter Firstname  : ");
            fname =  input.nextLine(); 

           System.out.print("Please Enter MiddleName : ");
            middlename =  input.nextLine(); 
           System.out.print("Please Enter LastName   : ");
           lname =  input.nextLine();  

           preparedStatement.setString(1, fname);
           preparedStatement.setString(2, middlename);
           preparedStatement.setString(3, lname);
           preparedStatement.executeUpdate();
          
           conn.close(); }catch(Exception e){ 
               System.out.println(e);
           }
           
                   System.out.println("Inserting Info....");

    
    }

    

    public static void Delete(String email, String password, String fname, String lname, String middlename){ 
        System.out.print("\033[H\033[2J"); 
        try{            
           
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/swcompanydb","root","12345678");  
           
            //insert the data
            PreparedStatement preparedStatement = conn.prepareStatement(DELETE_INFO);
            // preparedStatement.setInt(1, userid);
          
            preparedStatement.setString(1, fname);
            preparedStatement.setString(2, middlename);
            preparedStatement.setString(3, lname);
            preparedStatement.executeUpdate();
           
           
            System.out.print("Please Enter Firstname to Delete : ");
            fname =  input.nextLine(); 

           System.out.print("Please Enter MiddleName to Delete: ");  
            middlename =  input.nextLine(); 
           System.out.print("Please Enter LastName  to Delete : ");
           lname =  input.nextLine();  

           preparedStatement.setString(1, fname);
           preparedStatement.setString(2, middlename);
           preparedStatement.setString(3, lname);
           preparedStatement.executeUpdate();
          
           conn.close(); }catch(Exception e){ 
               System.out.println(e);
           }
           
                   System.out.println("Deleteing Info....");

    
    }

        

    //Getters 
    public String getemail(){ 
        return email; 
    }
    public String password(){ 
        return password;
    }
    public String getfname(){ 
        return fname; 
    }
    public String getlname(){ 
        return lname; 
    }
    public String getmiddlename(){ 
        return middlename; 
    }
 
    
}
