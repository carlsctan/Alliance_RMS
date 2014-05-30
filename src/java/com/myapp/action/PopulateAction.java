/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.action;

import com.myapp.data.Database;
import com.myapp.data.Employee;
import com.myapp.data.EmployeeDAO;
import com.myapp.data.Summary;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Micmobile
 */
public class PopulateAction extends org.apache.struts.action.Action{
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
        
        Summary summary = new Summary();
        EmployeeDAO dao = new EmployeeDAO();
        request.setAttribute("summary",summary);
        request.setAttribute("employees", dao.getEmployeeList());    
        return mapping.findForward("success");
    }
}
