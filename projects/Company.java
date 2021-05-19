package com.company;
import java.util.Scanner;


public class Company {

    boolean exit;

    private void header() {

        System.out.println("--------------------------------------");
        System.out.println("|           Welcome  to  our          |");
        System.out.println("|             SW COMPANY              |");
        System.out.println("--------------------------------------");
    }

    private void displayMenu() {

        System.out.println("Please make a selection:");
        System.out.println("> 1.Create Account");
        System.out.println("> 2.Login");
        System.out.println("> 3.Search");
        System.out.println("> 4.Insert");
        System.out.println("> 5.Update");
        System.out.println("> 6.Delete");
        System.out.println("> 7.Exit");
    }

    private void runMenu() {
        header();
        while (!exit) {
            displayMenu();
            int choice  = getInput();
            performAction(choice); 
        }
    }

    private void performAction(int choice) {
        
        switch(choice){
            case 1: 
                     new Service();
                    break;
            case 3: 
                     Service.Search();
                    break;

            case 7: exit=true;
                    System.out.println("Thank-you For using our Application      Ykc@2021");
                    break;
                 //Clear terminal screen
                 // System.out.print("\033[H\033[2J");  
                 
      }
    }

    private int getInput() {
        int choice =-1;
        Scanner sc = new Scanner(System.in);
        while(choice <1 || choice> 7){
            try {
                System.out.print("Enter Your Choice: ");
                choice  = Integer.parseInt(sc.nextLine());
            }catch (NumberFormatException e){
                System.out.println("Invalid Input! Please Try Again!");
                sc.close();
            }
       }
        return choice;
    }



    public static void main(String[] args) {
      Company c1 = new Company();
      c1.runMenu();
    }
}
