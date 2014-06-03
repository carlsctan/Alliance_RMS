/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.action;

import com.myapp.struts.data.DBconnection;
import com.myapp.struts.form.DeleteProjectForm;
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
public class DeleteProjectAction extends Action {
public ActionForward execute(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
 
        Connection conn;
        ResultSet rs, ra, rp, rm;
        DBconnection db= new DBconnection(); 
        String sql; int proj_id;
        conn=db.toConnect();
        DeleteProjectForm proj = (DeleteProjectForm) form;
        proj_id = proj.getProject_id();
        try{
            sql = "SELECT * FROM `memlist` WHERE proj_id=" + proj_id;
            db.setSql(sql);
            db.executeQuery(conn);
            rp = db.getRs();
            System.out.println(sql);
            boolean verify;

             sql= "DELETE FROM `project` WHERE `project_id`=" + proj_id;
             db.setSql(sql);
             db.executeUpdate(conn);
             System.out.println(sql);
            
            while(rp.next())
            {  sql= "SELECT year, effort.mem_id, emp_id FROM `effort` join member on effort.mem_id = member.mem_id where effort.mem_id=" + rp.getInt("mem_id");  
               db.setSql(sql);
               db.executeQuery(conn);
               rm = db.getRs(); 
               verify = rm.next();
               int mem_id, emp_id;
               mem_id = rm.getInt("mem_id"); emp_id = rm.getInt("emp_id");
               
            for(;verify!=false;)   
            {  ;
        sql= "SELECT * FROM `effort` WHERE mem_id=" + mem_id +" && year= " + rm.getInt("year");  
        db.setSql(sql);
        db.executeQuery(conn);
        rs = db.getRs();
        rs.next();
        System.out.println(sql);
        
        sql= "SELECT * FROM `gen_effort` WHERE emp_id=" + emp_id + "&& `year`=" + rm.getInt("year");  
        db.setSql(sql);
        db.executeQuery(conn);
        ra = db.getRs();
        ra.next();
        System.out.println(sql);
        
        sql= "UPDATE `gen_effort` SET `jan`=" + (ra.getFloat("jan")-rs.getFloat("jan")) + " ,`feb`=" + (ra.getFloat("feb")-rs.getFloat("feb")) + " ,`mar`="  + (ra.getFloat("mar")-rs.getFloat("mar"))+ " ,`apr`="  + (ra.getFloat("apr")-rs.getFloat("apr")) + " ,`may`="  + (ra.getFloat("may")-rs.getFloat("may"))+ " ,`jun`=" +(ra.getFloat("jun")-rs.getFloat("jun"))+ " ,`jul`="  + (ra.getFloat("jul")-rs.getFloat("jul")) + " ,`aug`="  + (ra.getFloat("aug")-rs.getFloat("aug")) + " ,`sep`="  + (ra.getFloat("sep")-rs.getFloat("sep")) + " ,`oct`="  + (ra.getFloat("oct")-rs.getFloat("oct")) + " ,`nov`="  + (ra.getFloat("nov")-rs.getFloat("nov")) + " ,`dec`="  + (ra.getFloat("dec")-rs.getFloat("dec"))
                   + " WHERE emp_id = "+ emp_id  +"&& year =" + rm.getInt("year");
           db.setSql(sql);
           db.executeUpdate(conn);
        
        System.out.println(sql);
           
        sql= "DELETE FROM `effort` WHERE `mem_id`=" + mem_id + "&& `year`=" + rm.getInt("year");  
        db.setSql(sql);
        db.executeUpdate(conn);
        
        System.out.println(sql);
        if(rm.next()==false)
        {
            verify = false;
        }
        }
        
        sql= "DELETE FROM `member` WHERE `mem_id`=" + mem_id;
        db.setSql(sql);
        db.executeUpdate(conn);
        System.out.println(sql);
        
        sql= "DELETE FROM `memlist` WHERE `mem_id`= " + mem_id;
        db.setSql(sql);
        db.executeUpdate(conn);
        System.out.println(sql);
        
        
        }
            
        }
        catch(Exception E){}
        
         return mapping.findForward("projectsummary");
    }


}
              

