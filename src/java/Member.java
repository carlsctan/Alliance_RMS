/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ma.NelleYap
 */
public class Member {
    private String name;
    private String[] months;

    public Member(){
        months=new String[12];
    }
    public String getName() {
        return name;
    }
    public String[] getMonths() {
        return months;
    }
    public void setMonths(String months, int num) {
        this.months[num] = months;
    }
    public void setName(String name) {
        this.name = name;
    }    
}
