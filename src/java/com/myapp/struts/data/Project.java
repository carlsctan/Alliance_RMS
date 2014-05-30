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
public class Project {
    private int id;
    private String project_name;
    private Date start_date;
    private Date end_date;
    private String type;
    private String status;
    private String business_unit;
    private String color;

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
    public Project( int id, String project_name, Date start_date, Date end_date, 
    String type, String status, String business_unit){
        this.id=id;
    this.project_name=project_name;
    this.start_date=start_date;
    this.end_date=end_date;
    this.type=type;
    this.status=status;
    this.business_unit=business_unit;
    }
    
    public String getBusiness_unit() {
        return business_unit;
    }

    public void setBusiness_unit(String business_unit) {
        this.business_unit = business_unit;
    }
         
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean setProject(ResultSet rs){
       boolean notEmpty=false;
        try{
                notEmpty=rs.next();
                id=rs.getInt("project_id");
                project_name = rs.getString("project_name");
                start_date= rs.getDate("start_date");
                end_date= rs.getDate("end_date");
                type=rs.getString("type");
                status=rs.getString("status");
                business_unit=rs.getString("business_unit");
                System.out.print(", Project_name " + project_name );
                System.out.print(", start_date " + start_date);
                
            }
        catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        }
        return notEmpty;
    }
        
   
    
        
}
