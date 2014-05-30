/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.form;


import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.struts.action.ActionForm;

/**
 *
 * @author Ma.NelleYap
 */
public class ProjectForm extends ActionForm{
    private String project_name;
    private String type;
    private String status;
    private String business_unit;
    private String start_date;
    private String end_date;
    private String color;

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
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

    public String getBusiness_unit() {
        return business_unit;
    }

    public void setBusiness_unit(String business_unit) {
        this.business_unit = business_unit;
    }

   
    public int getYear(Date x)
    {
        return x.getYear();
    }
    public String getProperDate(Date D)
    {
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyymmdd");
        String sqlDate = sdf.format(D);
        return sqlDate;
    }
}
