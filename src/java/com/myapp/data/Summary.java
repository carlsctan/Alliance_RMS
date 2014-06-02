/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.data;

import java.sql.ResultSet;

    
/**
 *
 * @author Carl
 */
public class Summary {
    private final Database db = new Database();
    private int numOfEmployees;             // Total employee count
    private int countPH;                    // Philippines/Local business unit count
    private int countJP;                    // JPIndependent business unit count
    private int countAl;                    // Alliance business unit count
    private int countRoW;                   // Rest of the World business unit count
    private int countJl;                    // Jobless
    
    public Summary() throws Exception{
            setNumOfEmployees();
            setCountPH();
            setCountJP();
            setCountAl();
            setCountRoW();
            setCountJl();
    }
    
    public int getNumOfEmployees() {
        return numOfEmployees;
    }

    private void setNumOfEmployees() throws Exception {
        String sql= "SELECT Count(*) AS count FROM employee";
        ResultSet rs = db.doQuery(sql);
        rs.next();
        numOfEmployees = rs.getInt("count");
    }

    public int getCountPH() {
        return countPH;
    }

    private void setCountPH() throws Exception {
        String sql= "SELECT Count(*) AS count FROM employee where BusinessUnit = 'Local'";
        ResultSet rs = db.doQuery(sql);
        rs.next();
        countPH = rs.getInt("count");
    }

    public int getCountJP() {
        return countJP;
    }

    private void setCountJP() throws Exception {
        String sql= "SELECT Count(*) AS count FROM employee where BusinessUnit = 'JPIndependent'";
        ResultSet rs = db.doQuery(sql);
        rs.next();
        countJP = rs.getInt("count");
    }

    public int getCountAl() {
        return countAl;
    }

    private void setCountAl() throws Exception {
        String sql= "SELECT Count(*) AS count FROM employee where BusinessUnit = 'Alliance'";
        ResultSet rs = db.doQuery(sql);
        rs.next();
        countAl = rs.getInt("count");
    }

    public int getCountRoW() {
        return countRoW;
    }

    private void setCountRoW() throws Exception {
        String sql= "SELECT Count(*) AS count FROM employee where BusinessUnit = 'ROW'";
        ResultSet rs = db.doQuery(sql);
        rs.next();
        countRoW = rs.getInt("count");
    }

    public int getCountJl() {
        return countJl;
    }

    private void setCountJl() throws Exception {
        String[] mth= {"jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"};
        String sql = "SELECT gen_effort.* "
                + "FROM employee "
                + "LEFT JOIN gen_effort ON employee.EmpIDNum = gen_effort.emp_id ";
        ResultSet rs = db.doQuery(sql);
        while(rs.next()){
            int effortcount = 0;
            for(int i=0;i<12; i++){ 
                effortcount +=rs.getFloat(mth[i]); 
            }
            countJl += (effortcount == 0)? 1 : 0;
        }
    }
    
    
}
