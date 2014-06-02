/* 
 * To change this license header, choose License Headers in Project Properties. 
 * To change this template file, choose Tools | Templates 
 * and open the template in the editor. 
*/ 
package com.myapp.data; 
import java.sql.*;

/**
 *
 * @author Carl
 */
    
public class Effort { 
    private int effort_id;
    private int mem_id; 
    private float[]months; 
    private int year;
    
     public Effort(){ 
         months=new float[12];
     } 
     
     public int getMem_id() {
        return mem_id; 
    }

    public void setMem_id(int mem_id) {
        this.mem_id = mem_id;
    }
    
    public int getEffort_id() {
        return effort_id;
    } 
    
    public void setEffort_id(int effort_id) {
        this.effort_id = effort_id;
    }
    
    public float[] getMonths() {
        return months;
    }
    
    public void setMonths(float[] months) {
        this.months = months;
    }
    
    public int getYear() {
        return year;
    }
    
    public void setYear(int year){
        this.year = year;
    }
        
    public boolean setEffort(ResultSet rs){ 
        String[] mth= {"jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"};
        int i; 
        boolean notEmpty=false;
        try{ 
            notEmpty=rs.next();
            effort_id=rs.getInt("gen_id");
            mem_id = rs.getInt("emp_id");
            year=rs.getInt("year"); 
            for(i=0;i<12; i++){ 
                months[i]=rs.getFloat(mth[i]); 
            } 
        }catch (SQLException se) { 
            se.printStackTrace(); 
        } 
    return notEmpty; 
    }
}