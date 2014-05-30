/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.data;
import java.sql.*;
/**
 *
 * @author Ma.NelleYap
 */
public class Member {
    
    private int mem_id;
    private int emp_id;
    private String type;

    public int getMem_id() {
        return mem_id;
    }

    public void setMem_id(int mem_id) {
        this.mem_id = mem_id;
    }

    public int getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(int emp_id) {
        this.emp_id = emp_id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    

    public boolean setMember(ResultSet rs){
       boolean notEmpty=false;
        try{
                notEmpty=rs.next();
                mem_id=rs.getInt("mem_id");
                emp_id=rs.getInt("emp_id");
                type=rs.getString("type");                             
                System.out.print(", mem_id " + mem_id );
                System.out.print(", emp_id " + emp_id);
                
            }
        catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        }
        return notEmpty;
    }
    
    
    
}
