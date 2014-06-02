/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.action;

import com.google.gson.Gson;
import com.myapp.data.Employee;
import com.myapp.data.EmployeeDAO;
import com.myapp.data.ProjectDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Michael
 */
public class EmployeeProjectAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
   public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        
        String json=null;
        int id = Integer.parseInt(request.getParameter("empID").toString());
        Gson gson = new Gson();
        try {           
            json = gson.toJson(ProjectDAO.getProjectList(id));
            response.setContentType("text/plain");  
            response.setCharacterEncoding("UTF-8"); 
            response.getWriter().write(json); 
                 
        }catch (Exception ex) {
            ex.printStackTrace();
        }
        
        return null;
    }
}
