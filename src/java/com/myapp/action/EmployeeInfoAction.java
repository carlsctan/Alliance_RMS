/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.action;

import com.google.gson.Gson;
import com.myapp.data.Employee;
import com.myapp.data.EmployeeDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Carl
 */
public class EmployeeInfoAction extends Action {
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
        
        Employee employee = new Employee();
        String json=null;
        int id = Integer.parseInt(request.getParameter("empID").toString());
        Gson gson = new Gson();
        try {
            employee = EmployeeDAO.getEmployeeInfo(id);
            json = gson.toJson(employee);
            response.setContentType("text/plain");  
            response.setCharacterEncoding("UTF-8"); 
            response.getWriter().write(json); 
                 
        }catch (Exception ex) {
            ex.printStackTrace();
        }
        
        return null;
    }
}
