/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.action;


import com.myapp.struts.data.DBconnection;
import com.myapp.struts.data.Effort;
import com.myapp.struts.data.Employee;
import com.myapp.struts.data.Project;
import com.myapp.struts.form.RetrieveProjectForm;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.Action;
/**
 *
 * @author Ma.NelleYap
 */
public class DisplayResourceAction extends Action{
    public void changeStatus(ResultSet S) throws SQLException
    {   
        java.sql.Connection conn;
        DBconnection db= new DBconnection(); 
        String sql;
        conn=db.toConnect();
        while(S.next())
        {
                S.getDate("end_date");
                Date D = new Date();
              if(D.compareTo(S.getDate("end_date"))<0)
              {
                  sql = "UPDATE `project` SET `status` = `closed`" + 
                          "WHERE project_id = "+ S.getInt("project_id");
                  db.setSql(sql);
                  db.executeUpdate(conn); 
              }
        }
    }
    public ActionForward execute(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {  
            
                com.myapp.struts.data.DBconnection db = new com.myapp.struts.data.DBconnection();
                Employee emp, emp_mem= new Employee();
                Effort effort=new Effort();
                java.sql.Connection conn;
                java.sql.ResultSet rs, ra;
                String c;
                int s=-1;
                String sql;
                int id;
                String pID;
               List<Employee> listEmployee = new ArrayList<Employee>();
                List<Employee> listEmpMem = new ArrayList<Employee>();
                 List<Effort> listEffort = new ArrayList<Effort>();
                Project project;
                RetrieveProjectForm mem = (RetrieveProjectForm)form;
                System.out.println("NAMEE"+mem.getProject_name());
                conn=db.toConnect();   
                sql="Select * from project where project_id= " + mem.getId();
                System.out.println(sql);
                db.setSql(sql);
                db.executeQuery(conn);    
                rs=db.getRs();  
                rs.next();
                boolean b=true;
                System.out.println("DATEEE" + rs.getInt("project_id"));
                project = new Project(rs.getInt("project_id"), rs.getString("project_name"), rs.getDate("start_date"), rs.getDate("end_date"), rs.getString("type"),rs.getString("status"), rs.getString("business_unit") );
                 c = (rs.getString("status").compareTo("ongoing")==0)? "success" : "danger" ;
                 sql="Select * from employee";
                db.setSql(sql);
                db.executeQuery(conn);    
                ra=db.getRs(); 
                 sql="Select * from employee join member on employee.EmpIDNum=member.emp_id join memlist on " +
                         "member.mem_id=memlist.mem_id where memlist.proj_id=" + mem.getId();
                db.setSql(sql);
                db.executeQuery(conn);    
               rs=db.getRs(); 
                
           
                while (ra.next()){
                    while(rs.next()){
                  
                    if(ra.getInt("EmpIDNum")==rs.getInt("EmpIDNum"))
                                         b=false;
                  
                    }
                    rs.first();
                   if(b==true){
                  emp=new Employee(ra.getInt("EmpIDNum"), ra.getString("FirstName"),ra.getString("MiddleName"), ra.getString("LastName") );
                  emp.setName(ra.getString("FirstName"), ra.getString("MiddleName"), ra.getString("LastName"));
                  listEmployee.add(emp);
                  System.out.println("EMPLOYEE!" + " " + emp.getName());
                  
                   }
                    b=true;
                }
               sql="Select * from employee join member on employee.EmpIDNum= member.emp_id"
                + " join memlist on member.mem_id= memlist.mem_id && memlist.proj_id= '" +mem.getId()+"'";                           
        
                String a="effort";
                conn=db.toConnect();
                db.setSql(sql);
                db.executeQuery(conn);    
                rs=db.getRs();
                int i=0;
                while (rs.next())
                {
           
                    emp_mem=new Employee(rs.getInt("EmpIDNum"), rs.getString("FirstName"), rs.getString("MiddleName"),rs.getString("LastName"));
                    emp_mem.setName(rs.getString("FirstName"), rs.getString("MiddleName"),rs.getString("LastName"));
                    emp_mem.setMem_id(rs.getInt("mem_id"));
                    listEmpMem.add(emp_mem);
                    
                    i++;
                    float[] months=new float[12]; 
                    int mem_id=rs.getInt("mem_id");
                    System.out.println("MEMBER" + mem_id);
                    sql="Select * from effort where mem_id='" + mem_id +"'";
                    db.setSql(sql);
                    db.executeQuery(conn);
                    ra=db.getRs();
                    while(ra.next()){
                        
                    effort=new Effort();
                    effort.setEffort(ra);
                     System.out.println("effort" + effort.getEffort_id());
                    listEffort.add(effort); 
                    }
                }
                 
               request.setAttribute("effort", listEffort);
               request.setAttribute("project", project);
                 request.setAttribute("Employee",listEmployee);
                 request.setAttribute("empmem", listEmpMem);
         return mapping.findForward("resource");
    }

}
     

           
