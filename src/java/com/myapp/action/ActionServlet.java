/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.action;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.myapp.data.*;
/**
 *
 * @author Michael
 */
public class ActionServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;

    
    public ActionServlet() {
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
    }


  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request, response);
    }

}