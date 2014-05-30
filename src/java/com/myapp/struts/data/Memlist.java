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
public class Memlist {
    
    private int memlist_id;
    private int mem_id;
    private int proj_id;

    public int getMemlist_id() {
        return memlist_id;
    }

    public void setMemlist_id(int memlist_id) {
        this.memlist_id = memlist_id;
    }

    public int getMem_id() {
        return mem_id;
    }

    public void setMem_id(int mem_id) {
        this.mem_id = mem_id;
    }

    public int getProj_id() {
        return proj_id;
    }

    public void setProj_id(int proj_id) {
        this.proj_id = proj_id;
    }

    public boolean setMemlist(ResultSet rs){
       boolean notEmpty=false;
        try{
                notEmpty=rs.next();
                mem_id=rs.getInt("mem_id");
                proj_id=rs.getInt("proj_id");
                memlist_id=rs.getInt("memlist_id");

                
            }
        catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        }
        return notEmpty;
    }
    
    
}
