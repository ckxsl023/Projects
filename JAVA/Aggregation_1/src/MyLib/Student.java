/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyLib;

/**
 *
 * @author pc
 */
public class Student {
    private String name;

    public String getName() {
        return name;
    }
    private School dept;

    public School getDept() {
        return dept;
    }

    public void setDept(School dept) {
        this.dept = dept;
    }
    private Course course;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Student(String name, School dept) {
        this.name = name;
        this.dept = dept;
    }
    
    
    
}
