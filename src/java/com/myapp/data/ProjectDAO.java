/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.data;

import com.myapp.struts.data.Project;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Michael
 */
public class ProjectDAO {
    private static Database db = new Database();
    
    public static List<Project> getProjectList(int id) throws Exception{
    List <Project>e_list = new ArrayList<Project>();                //List of Projects an Employee is assigned to
    try {
        String sql = "SELECT project_id , project_name , start_date , end_date , business_unit , type , status"
                +" FROM project "
                +"LEFT JOIN memlist on project.project_id = memlist.proj_id "
                +"LEFT JOIN member on memlist.mem_id = member.mem_id "
                +"LEFT JOIN employee on member.emp_id = employee.EmpIDNum "
                +"WHERE employee.EmpIDNum = "+id;
        ResultSet rs = db.doQuery(sql);
        while(rs.next()){
            Project e = new Project(rs.getInt("project_id"), rs.getString("project_name"),rs.getDate("start_date"),rs.getDate("end_date"), rs.getString("type"),rs.getString("status"), rs.getString("business_unit"));
            e_list.add(e);
        }
    } catch(SQLException se){
        se.printStackTrace();
    }
    return e_list;
    }
}
