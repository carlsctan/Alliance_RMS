/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.action;

import com.myapp.struts.data.DBconnection;
import com.myapp.struts.form.ProjectForm;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class AddProjectAction extends Action {
public ActionForward execute(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        System.out.println("UserLoginAction::execute()");
        //get the form value for username
        Connection conn;
        ResultSet rs;
        DBconnection db= new DBconnection(); 
        ProjectForm proj = (ProjectForm)form;
        String sql;
        String N = proj.getProject_name(), type = proj.getType(), status = proj.getStatus(), bu = proj.getBusiness_unit()
                , start = proj.getStart_date(), end = proj.getEnd_date();
       start = start.replaceAll("/","");
       end = end.replaceAll("/","");
       
                                    sql="INSERT INTO `project`(`project_name`,`start_date`,`end_date`,`type`,`status`,`business_unit`)" 
                   + " VALUES ('"+ N + "'," + start + "," + end + ",'" + type + "','" + status + "','" + bu + "')";
         System.out.println((sql));
                conn=db.toConnect();
                db.setSql(sql);
                db.executeUpdate(conn);
                System.out.println((sql));
        return mapping.findForward("projectsummary");
       
}
public static void main (String[] args){
    String date = "1212-14-14";
    String b = date.replaceAll("-","");
    System.out.println(b);
    
    
    
}
 
 }
              

