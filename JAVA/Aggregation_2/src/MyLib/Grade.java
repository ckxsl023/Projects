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
public class Grade {
    private double finalGrade;
    private String remark;

    public double getFinalGrade() {
        return finalGrade;
    }

    public String getRemark() {
        return remark;
    }

    public Grade(double finalGrade) {
        this.finalGrade = finalGrade;
    }
    
    public void determineRemark()
    {
        if(finalGrade >= 70)
            remark="Passed";
        else
            remark="Failed";
    }
    
    
}
