/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author Carl
 */
public class Database {
    //database credentials
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost/alliance";
    private static final String USER = "root";
    private static final String PASS = "";
    private Connection conn = null;
    private Statement stmt = null;
    
    public Database(){
        try {
            dbConnect();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
        
    public ResultSet doQuery(String sql) throws SQLException, Exception{
        ResultSet rs;
        stmt = conn.createStatement();
        dbConnect();
        try{
            rs = stmt.executeQuery(sql);
            return rs;
        } catch(SQLException se){
            se.printStackTrace();
        } finally{
            rs = stmt.executeQuery(sql);
            return rs;
        }
    }
    
    public void dbConnect() throws SQLException, Exception{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to a selected database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected database successfully...");
        } catch(SQLException se) {
            se.printStackTrace();
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void dbClose() throws SQLException, Exception{
        try {
                if (stmt != null) {
                    conn.close();
                }
            } catch (SQLException se) {
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
    }  
}
