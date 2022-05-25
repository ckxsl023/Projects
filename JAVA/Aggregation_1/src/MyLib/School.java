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
public class School {
    private String name;
    private String location;

    public void setLocation(String location) {
        this.location = location;
    }

    

    public School(String name) {
        this.name = name;
    }
    
    public String getSchoolDetails()
    {
        return name + " " + location;
    }
    
    
}
