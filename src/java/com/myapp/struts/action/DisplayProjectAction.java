/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.action;

import com.myapp.struts.data.Project;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.sql.*;
import org.apache.struts.action.Action;
/**
 *
 * @author Ma.NelleYap
 */
public class DisplayProjectAction extends Action{
                               
public ActionForward execute(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {    
     com.myapp.struts.data.DBconnection db = new com.myapp.struts.data.DBconnection();
    java.sql.Connection conn;           
    ResultSet rs;
    List<Project> listProjects = new ArrayList<Project>();
    Project project;
    String c;
    conn=db.toConnect();
    db.setSql("select * from project");
    db.executeQuery(conn);
    rs=db.getRs();
    while (rs.next()){
        project = new Project(rs.getInt("project_id"), rs.getString("project_name"), rs.getDate("start_date"), rs.getDate("end_date"), rs.getString("type"),rs.getString("status"), rs.getString("business_unit") );
         c = (rs.getString("status").compareTo("ongoing")==0)? "success" : "danger" ;
        listProjects.add(project);
    }
    request.setAttribute("project", listProjects);
    return mapping.findForward("loginsuccess");
}
}
