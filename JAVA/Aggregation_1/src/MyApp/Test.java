/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyApp;

import MyLib.*;

/**
 *
 * @author Ckxsl023
 */
public class Test {
    public static void main(String[] args) {
        
        //GETTING INPUTS
        //        School school = new School("SOIT");
        //        Student stud = new Student("John Smith", school);
        Student stud = new Student("John Smith", new School("SOIT"));
        stud.getDept().setLocation("MAKATI");
        
        stud.setCourse(new Course("CS129-8","OOP",3));
        // stud.getCourse().setGrade(new Grade(80,"(PASSED)"));
        
        //DISPLAYING OUTPUT
        
        System.out.println("Name: " + stud.getName());
        stud.getDept().getSchoolDetails();
        System.out.println("Course: " + stud.getCourse().getCode() + "[" + stud.getCourse().getName() + "]" + stud.getCourse().getUnits() + " units");
        System.out.println("Grade: " + stud.getCourse().getGrade().getFinalGrade() + "[" + stud.getCourse().getGrade().getRemark() + "]");
    }
}
