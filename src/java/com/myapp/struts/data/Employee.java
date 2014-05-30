/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.data;
import java.sql.*;
import java.sql.Date;

/**
 *
 * @author Ma.NelleYap
 */
public class Employee{
    
    private int emp_id;
    private String emp_fn;
    private String emp_mn;
    private String emp_ln;
    private Date dateHired;

    public int getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(int emp_id) {
        this.emp_id = emp_id;
    }

    public String getEmp_fn() {
        return emp_fn;
    }

    public void setEmp_fn(String emp_fn) {
        this.emp_fn = emp_fn;
    }

    public String getEmp_mn() {
        return emp_mn;
    }

    public void setEmp_mn(String emp_mn) {
        this.emp_mn = emp_mn;
    }

    public String getEmp_ln() {
        return emp_ln;
    }

    public void setEmp_ln(String emp_ln) {
        this.emp_ln = emp_ln;
    }

    public Date getDateHired() {
        return dateHired;
    }

    public void setDateHired(Date dateHired) {
        this.dateHired = dateHired;
    }

    public boolean setEmployee(ResultSet rs){
       boolean notEmpty=false;
        try{
                notEmpty=rs.next();
                emp_id=rs.getInt("EmpIDNum");
                emp_fn = rs.getString("FirstName");
                emp_mn=rs.getString("MiddleName");
                emp_ln=rs.getString("LastName");
                dateHired= rs.getDate("DateHired");

                              
                System.out.print(", emp_fn " + emp_fn );
                System.out.print(", emp_ln " + emp_ln);
                
            }
        catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        }
        return notEmpty;
    }
}
