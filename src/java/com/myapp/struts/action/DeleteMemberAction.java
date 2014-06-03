/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.action;

import com.myapp.struts.data.DBconnection;
import com.myapp.struts.form.DeleteMemberForm;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Ma.NelleYap
 */
public class DeleteMemberAction extends Action{
    public ActionForward execute(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        Connection conn;
        ResultSet rs, ra;
        DBconnection db= new DBconnection(); 
        String sql; int id, year;
        conn=db.toConnect();
        DeleteMemberForm mem= (DeleteMemberForm) form;
        id=mem.getId();
        year=mem.getYear();
        System.out.println("DELETEE" + id + " " + year);
        try{
            
        sql= "SELECT * FROM `effort` join member on effort.mem_id = member.mem_id where effort.mem_id=" + id +" && effort.year= " + year;  
        db.setSql(sql);
        db.executeQuery(conn);
        rs = db.getRs();
        rs.next();
        
        sql= "SELECT * FROM `gen_effort` WHERE emp_id=" + rs.getInt("emp_id") + "&& `year`=" + year;  
        db.setSql(sql);
        db.executeQuery(conn);
        ra = db.getRs();
        ra.next();
        
        sql= "UPDATE `gen_effort` SET `jan`=" + (ra.getFloat("jan")+rs.getFloat("jan")) + " ,`feb`=" + (ra.getFloat("feb")+rs.getFloat("feb")) + " ,`mar`="  + (ra.getFloat("mar")+rs.getFloat("mar"))+ " ,`apr`="  + (ra.getFloat("apr")+rs.getFloat("apr")) + " ,`may`="  + (ra.getFloat("may")+rs.getFloat("may"))+ " ,`jun`=" +(ra.getFloat("jun")+rs.getFloat("jun"))+ " ,`jul`="  + (ra.getFloat("jul")+rs.getFloat("jul")) + " ,`aug`="  + (ra.getFloat("aug")+rs.getFloat("aug")) + " ,`sep`="  + (ra.getFloat("sep")+rs.getFloat("sep")) + " ,`oct`="  + (ra.getFloat("oct")+rs.getFloat("oct")) + " ,`nov`="  + (ra.getFloat("nov")+rs.getFloat("nov")) + " ,`dec`="  + (ra.getFloat("dec")+rs.getFloat("dec"))
                   + " WHERE emp_id = "+ rs.getInt("emp_id") +"&& year =" + year;
           System.out.println(sql);
           db.setSql(sql);
           db.executeUpdate(conn);
        
        sql= "DELETE FROM `effort` WHERE `mem_id`=" + id + "&& `year`=" + year;  
        db.setSql(sql);
        db.executeUpdate(conn);
        
        sql = "SELECT * FROM `effort` WHERE `mem_id`=" + id;
        db.setSql(sql);
        db.executeQuery(conn);
        ra = db.getRs();
        
        if(ra.next() == false){
        sql= "DELETE FROM `member` WHERE `mem_id`=" + id;
        db.setSql(sql);
        db.executeUpdate(conn);
        
        sql= "DELETE FROM `memlist` WHERE `mem_id`= " + id;
        db.setSql(sql);
        db.executeUpdate(conn);
        }
        
        }
        catch(Exception E){}
        
         return mapping.findForward("resource");
    }
}
