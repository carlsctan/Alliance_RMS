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
public class DeleteProjectAction extends Action {
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
        String sql;
     
        sql="DELETE FROM People WHERE id = 101";
         System.out.println((sql));
                conn=db.toConnect();
                db.setSql(sql);
                db.executeUpdate(conn);
                System.out.println((sql));
        return mapping.findForward("success");
       
}
 
 }
              

