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
public class DBconnection {
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/alliance";
    //  Database credentials
    static final String USER = "root";
    static final String PASS = "";
    private Connection conn;
    private String sql;
    private ResultSet rs;
    
    public DBconnection(){
        conn = null;
    }

    public ResultSet getRs() {
        return rs;
    }

    public void setRs(ResultSet rs) {
        this.rs = rs;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }
       
    public Connection toConnect (){
        boolean isValid = false;
        try {
            //STEP 2: Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            //STEP 3: Open a connection
            System.out.println("Connecting to a selected database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected database successfully...");
    }
catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        }
        return conn;
    }
    
        public void executeQuery(Connection conn){
        Statement stmt;
        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
        }
        catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        }
    }
        
          public void executeUpdate(Connection conn){
        Statement stmt;
        try{
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
        }
        catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        }
    }
    
    public void closeConnection(){
    try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
    }
}
