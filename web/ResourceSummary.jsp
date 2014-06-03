<%-- 
    Document   : ResourceSummary
    Created on : May 11, 2014, 8:10:18 PM
    Author     : ma.nelle
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>RESOURCE SUMMARY</title>
        <link type="text/css" rel="stylesheet" href="css/view.css">
        <link type="text/css" rel="stylesheet" href="media/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="media/css/dataTables.bootstrap.css">
        <script src="media/js/complete.js" type="text/javascript" ></script>
        <script src="media/js/jquery.js" type="text/javascript"></script>
        <script src="media/js/bootstrap.js" type="text/javascript"></script>
        <script src="media/js/jquery.dataTables.js" type="text/javascript"></script>    
        <script src="media/js/jquery.dataTables.columnFilter.js" type="text/javascript" ></script>
         <link rel="stylesheet" type="text/css" href="media/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="bootstrap-3.1.1/docs/assets/css/docs.min.css"/>
           <style type="text/css" title="currentStyle">
        @import "demo_table.css";
        </style>
  </head>    <body data-spy="scroll" data-target=".bs-docs-sidebar">

    <div class="container-fluid" style="width:1000px; margin-left:auto; margin-right:auto">
    <div class="container-fluid well" style="background-color:white">
    <a class="brand" href="#"> <img src="images/alliancesoftwarenew.jpg" style="height: 90px; margin-top:-20px;width:300px;margin-bottom:-20px" ></a>
   
   </div> 
        
   <nav class="navbar navbar-default " role="navigation">
                    <div class="container-fluid">
			<ul class="nav navbar-nav ">
                            <li><a href="view_project">Project Outlook Summary</a></li>
                            <li><a href="DisplayProjectAction.do"> Project Summary</a></li>
                            <li><a href="populateAction.do"> Resource Summary</a></li>
			</ul>
			<form action="logout.action" method="post">
				<input type="submit" id="logout-button" value="Log out"/>
			</form>
                    </div>
                </nav>


          <div style="margin-left:20px;margin-right:20px">
          <p class="head"><strong>Project Name:</strong> <bean:write name="project" property="project_name"/></p>
          <p class="head"><strong>Start Date:</strong> <bean:write name="project" property="start_date"/></p>
          <p class="head"><strong>End Date:</strong> <bean:write name="project" property="end_date"/></p>
          <p class="head"><strong>Business Unit: </strong><bean:write name="project" property="business_unit"/></p>
          <p class="head"><strong>Project Type: </strong> <bean:write name="project" property="type"/></p>
          <p class="head"><strong>Project Status:</strong> <bean:write name="project" property="status"/></p>
          <!--AddMember Modal -->
          <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#AddMember"> <img src="images/add_member.png">  Add member</button>
          <div class="modal fade" id="AddMember" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                   <div class="modal-dialog">
                       <div class="modal-content">
                           <div class="modal-body">
                <div class="panel panel-primary">  <div class="panel-heading">Add member</div>
                    <div class="panel-body">
                        <div style="margin-top:20px;">  
                <%int project_id = ((com.myapp.struts.data.Project) pageContext.findAttribute("project")).getId(); %>
                <html:form action="AddMemberAction">
                   
                        <label for="Member"><strong>Member name</strong></label>        
                 <select property="member" name="member" class="form-control" style="width:300px">
                    <logic:iterate name="Employee" id="EmployeeId">
             
              <option value= <bean:write name="EmployeeId" property="emp_id"/>><bean:write name="EmployeeId" property="name"/> </option>     
               
                </logic:iterate> </select> <br>
                                                                            
                        <input type="hidden" value="<%=project_id%>" property="proj_id" name="proj_id"/>
                         <input type="hidden" value="2013" property="year" name=year"/>

<div id='show'></div>
                </div>
            <br>
                    <button type="submit" id="submitAddMember" class="btn btn-success">OK</button>
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancel</button>
                     
            </html:form>
                            
                            
                        </div>
                    </div>   
                    </div></div></div>
                    </div>
                   </div>
           <!--AddMember Modal --></div>              
                

<div class="container-fluid" >
    	   <table class="table table-hover table-condensed" style="margin-top:15px">
    	      <thead>
    	         <tr>
    	           <td><strong>Project Members</strong></td>
    	           <td><strong>Jan</strong></td>
    	           <td><strong>Feb</strong></td> 
    	           <td><strong>Mar</strong></td>
    	           <td><strong>Apr</strong></td> 
    	           <td><strong>May</strong></td>    	 
    	           <td><strong>Jun</strong></td>   
    	           <td><strong>Jul</strong></td> 
    	           <td><strong>
    	          Aug</strong>
    	      </td>   	
    	      <td><strong>
    	          Sep</strong>
    	      </td> 
    	      <td><strong>
    	          Oct</strong>
    	      </td>  
    	      <td><strong>
    	          Nov
    	          </strong>
    	      </td>  
    	      <td><strong>
    	          Dec
    	          </strong>
    	      </td>  
    	      <td><strong>
    	         Year
    	          </strong>
    	      </td> 
               <td><strong>
    	         Edit
    	          </strong>
              <td><strong>
    	         Delete
    	          </strong>
    	      </td>   
    	      </tr>
  </thead>
    	   
    	   <tbody>
               
 <logic:iterate name="empmem" id="emp_memID" > 
   <%int i=0;%>
                                                                                              
     <tr>
      
         <%int m_id = ((com.myapp.struts.data.Employee) pageContext.findAttribute("emp_memID")).getMem_id(); %>
        
         <td>
            <bean:write name="emp_memID" property="name"/>
         </td>
        
         <logic:iterate name="effort" id="effortID">
   
<%int mem_id = ((com.myapp.struts.data.Effort) pageContext.findAttribute("effortID")).getMem_id(); %>
        
           
             <%
          
           
            if(m_id==mem_id){
                if(i==1){
            %>
            <td></td> <%}%>
          <td>
            <bean:write name="effortID" property="months[0]"/>
         </td>
                   <td>
            <bean:write name="effortID" property="months[1]"/>
         </td>
                   <td>
            <bean:write name="effortID" property="months[2]"/>
         </td>
                   <td>
            <bean:write name="effortID" property="months[3]"/>
         </td>
                   <td>
            <bean:write name="effortID" property="months[4]"/>
         </td>
                   <td>
            <bean:write name="effortID" property="months[5]"/>
         </td>
                   <td>
            <bean:write name="effortID" property="months[6]"/>
         </td>
                   <td>
            <bean:write name="effortID" property="months[7]"/>
         </td>
                   <td>
            <bean:write name="effortID" property="months[8]"/>
         </td>
                   <td>
            <bean:write name="effortID" property="months[9]"/>
         </td>
                  <td>
            <bean:write name="effortID" property="months[10]"/>
         </td>
                 <td>
            <bean:write name="effortID" property="months[11]"/>
         </td>
                  <td>
                      <%!int yr;%>
                      <bean:define id="yr">
            <bean:write name="effortID" property="year"/>
                      </bean:define>
                      <%=yr%>
                      
         </td>
                                                
                                                <td><%=yr%></td>
                                                  <!--Set Effort Modal -->                  
                   <div class="modal fade" id="SetEffort" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                   <div class="modal-dialog">
                       <div class="modal-content">
                           <div class="modal-body">
                <div class="panel panel-primary">  <div class="panel-heading">Add member</div>
                    <div class="panel-body">
                        <div style="margin-top:20px;">  
                      <bean:write name="effortID" property="year"/>
                        </div>
                    </div>
                        </div>
                        </div>
                        </div></div></div>
        <!--/Set Effort Modal-->  
                                                <td>
                                                
                                                              
                                  <button  value='' type="submit" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#SetEffort">Edit</button>
                                 
                             
                         </td>
                       
                         
              <td>
                             <html:form action="DeleteMemberAction">
                                 <input type="hidden" value="<%=yr%>" name="year" property="year"/>
                                 <input type="hidden" value="<%=m_id%>" name="id" property="id"/>
                                 <button type="submit" class="btn btn-danger">Delete</button>
                             </html:form>
                         </td>

     <tr></tr>
<%i=1;}%>
         </logic:iterate> 
     </tr>
     
 </logic:iterate>
                       
                  
    	   </tbody>
    	</table>
            <p></p>
    	</div>
    	</div>
    	</div>
    </body>
</html>   
 <script type="text/javascript">
      $(document).ready( function () {
   $('#effort').hide();
} );
	</script>