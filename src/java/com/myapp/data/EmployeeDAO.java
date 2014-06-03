/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.data;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author Carl
 */
public class EmployeeDAO {
    private static Database db = new Database();
    

    public static List<Employee> getEmployeeList() throws Exception{
    Calendar now = Calendar.getInstance();
    int year = now.get(Calendar.YEAR);
    String stryear = String.valueOf(year);    
    List <Employee>e_list = new ArrayList<Employee>();                //List of Employees
    try {
        String sql = "SELECT employee.*, gen_effort.* "
                + "FROM employee "
                + "LEFT JOIN gen_effort ON employee.EmpIDNum = gen_effort.emp_id AND gen_effort.year= "+stryear;
            
        ResultSet rs = db.doQuery(sql);
        while(rs.next()){
            Employee e = new Employee(rs.getInt("EmpIDNum"), rs.getString("FirstName"), rs.getString("MiddleName"),
                    rs.getString("LastName"), rs);
            e_list.add(e);
        }
    } catch(SQLException se){
        se.printStackTrace();
    }
    return e_list;
    }
    
    public static Employee getEmployeeInfo(int empID) throws SQLException, Exception{
        String sql = "SELECT EmpIDNum, FirstName, MiddleName, LastName, "
                + "BusinessUnit, DateHired, YearsITIndustry, CollegeSchool1, CollegeSchool2,"
                + "CollegeCourse1, CollegeCourse2, CollegeYear, JobTitles, NRIBatch "
                + "FROM employee "
                + "WHERE EmpIDNum ="+empID;
       ResultSet rs = db.doQuery(sql);
       rs.next();
       Employee e = new Employee();
       e.setEmpIDNum(rs.getInt("EmpIDNum"));
       e.setFirstName(rs.getString("FirstName"));
       e.setMiddleName(rs.getString("MiddleName"));
       e.setLastName(rs.getString("LastName"));
       e.setBusinessUnit(rs.getString("BusinessUnit"));
       e.setDateHired(rs.getDate("DateHired"));
       e.setYearsITIndustry(rs.getInt("YearsITIndustry"));
       e.setCollegeSchool1(rs.getString("CollegeSchool1"));
       e.setCollegeSchool2(rs.getString("CollegeSchool2"));
       e.setCollegeCourse1(rs.getString("CollegeCourse1"));
       e.setCollegeCourse2(rs.getString("CollegeCourse2"));
       e.setCollegeYear(rs.getInt("CollegeYear"));
       e.setJobTitles(rs.getString("JobTitles"));
       e.setNriBatch(rs.getInt("NRIBatch"));
       return e;
    }

}
