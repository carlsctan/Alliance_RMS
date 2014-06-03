/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.data;

import com.myapp.struts.data.Effort;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author administrator
 */
public class EffortDAO {
    private static Database db = new Database();
    
    public static List<Effort> getEffortList(int id) throws Exception{
    List <Effort>e_list = new ArrayList<Effort>();                //List of Effort an Employee is assigned to
    try {
        String sql = "SELECT gen_effort.* "
                + "FROM employee "
                + "LEFT JOIN gen_effort ON employee.EmpIDNum = gen_effort.emp_id "
                + "WHERE employee.EmpIDNum = "+id;
        ResultSet rs = db.doQuery(sql);
        while(rs.next()){
            Effort e = new Effort();
            e.setYear(rs.getInt("year"));
            e.setEffort(rs);
            e_list.add(e);
        }
    } catch(SQLException se){
        se.printStackTrace();
    }
    return e_list;
    }
}
