/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package laboratory.activities.cs129.pkg8l;
import java.io.IOException;


/**
 *
 * @author pc
 */  
        class ApplicantClass{
        public String appName;
        int appAge;
    }
public class LaboratoryActivitiesCS1298L {
    /**
     * @param args the command line arguments
     */
   
    public static void main(String[] args) {
        // TODO code application logic here
        boolean verify=false;
        int slotsBask=2;
        int slotsVoll=3;
        String[] nameBask = {" "," "};

       
        String[] nameVoll = {" "," "," "};
        
        do
{
        Scanner scan=new Scanner(System.in);
        System.out.println("Select Team ");
        System.out.println("------------------");
        System.out.println("[1] Basketball ");
        System.out.println("[2] Volleyball ");
        System.out.println("[3] Open Slots Left ");
        System.out.println("[4] Exit ");
        System.out.println("------------------");
        System.out.println("Choice:");
        int choice = scan.nextInt();
        scan.nextLine();    
        switch (choice)
    {
         case 1:
        //Java code
        
        if(slotsBask!=0)
        {
        
        System.out.println("Enter Name:");
        String name = scan.nextLine();
        System.out.println("Enter Age:");
        int age = scan.nextInt();
        
        ApplicantClass regApp = new ApplicantClass();
        regApp.appAge = age;
        regApp.appName = name;
         
        
            
                   if((age>=18)&&(age<=21))
                   {
                       System.out.println("Welcome to the Baskball Team! " + regApp.appName);

                       nameBask[slotsBask-1]=name;
                       
                       slotsBask=slotsBask-1;
                       
                   }
                   else
                       System.out.println("You're not Qualified, Sorry!");
                   try
                    {
                        System.in.read();
                    }  
                     catch(IOException e)
                    {}
        }
        else
            System.out.println("There are no more Slots Left in the Baskteball Team, sorry!");
                    try
                    {
                        System.in.read();
                    }  
                     catch(IOException e)
                    {}
        
        verify=true;
             break;
         case 2:
        //Java code
              if(slotsVoll!=0)
        {
        
        System.out.println("Enter Name:");
        String name = scan.nextLine();
        System.out.println("Enter Age:");
        int age = scan.nextInt();
        
        ApplicantClass regApp = new ApplicantClass();
        regApp.appAge = age;
        regApp.appName = name;
         
       
                   if((age>=17)&&(age<=19))
                   {
                       System.out.println("Welcome to the Volleyball Team! " + regApp.appName);
                       
                       nameVoll[slotsVoll-1]=name;
                       
                       
                       slotsVoll=slotsVoll-1;
                       
                   }
                   else
                       System.out.println("You're not Qualified, Sorry!");
                   try
                    {
                        System.in.read();
                    }  
                     catch(IOException e)
                    {}
        }
        else
              {
            System.out.println("There are no more Slots Left in the Volleyball Team, sorry!");
                    try
                    {
                        System.in.read();
                    }  
                     catch(IOException e)
                    {}
              } 
             verify=true;
             break;
         case 3:
        //Java code
             System.out.println("Current Number of Recruits:");
             System.out.println("Basketball:");
             
             System.out.println("Open Slot 1: " + nameBask[1]);
             System.out.println("Open Slot 2: " + nameBask[0]);

             System.out.println("Volleyball:");
             System.out.println("Open Slot 1: " + nameVoll[2]);
             System.out.println("Open Slot 2: " + nameVoll[1]);
             System.out.println("Open Slot 3: " + nameVoll[0]);
             
             try
                    {
                        System.in.read();
                    }  
                     catch(IOException e)
                    {}
             
             verify=true;
             break;
         case 4:
        //Java code
             System.out.println("Thank you for using this application. Goodbye");
             try
                    {
                        System.in.read();
                    }  
                     catch(IOException e)
                    {}
             verify=false;
             break; 
        default:
        {
        System.out.println("Number Entered is Invalid, Please Try Again");
        System.out.println("Enter Any key to try again...");
               verify=true;
               
                    try
                    {
                        System.in.read();
                    }  
                     catch(IOException e)
                    {}  
                   
        }
    }
        
} while(verify);
    }
    
}
