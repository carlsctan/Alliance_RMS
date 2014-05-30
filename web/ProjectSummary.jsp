<%-- 
    Document   : ProjectSummary
    Created on : May 11, 2014, 7:55:59 PM
    Author     : jay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<jsp:include page="checkSession.jsp"></jsp:include>
<html lang="en">
    
  <head>
    <meta charset="utf-8">
    <title>PROJECT SUMMARY</title>
        <script type="text/javascript" charset="utf-8" src="jquery.js"></script>
        <script type="text/javascript" charset="utf-8" src="jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf-8" src="jquery.dataTables.css"></script>
         <script type="text/javascript" charset="utf-8" src="bootstrap-3.1.1/dist/js/bootstrap.js"></script>
         <link type="text/css" rel="stylesheet" href="css/view.css">
         <link rel="stylesheet" type="text/css" href="bootstrap-3.1.1/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="bootstrap-3.1.1/docs/assets/css/docs.min.css"/>
        <style type="text/css" title="currentStyle">
        @import "demo_table.css";
        </style>
  </head>
<body data-spy="scroll" data-target=".bs-docs-sidebar">

    <div class="container-fluid" style="width:1000px; margin-left:auto; margin-right:auto">
    <div class="container-fluid well" style="background-color:white">
    <a class="brand" href="#"> <img src="alliancesoftwarenew.jpg" style="height: 90px; margin-top:-20px;width:300px;margin-bottom:-20px" ></a>
   
   </div> 
        <nav class="navbar navbar-default " role="navigation">
                    <div class="container-fluid">
			<ul class="nav navbar-nav ">
                            <li><a href="view_project">Project Outlook Summary</a></li>
                            <li><a href="PrStart.jsp"> Project Summary</a></li>
                            <li><a href="populateAction.do"> Resource Summary</a></li>
			</ul>
			<form action="logout.action" method="post">
				<input type="submit" id="logout-button" value="Log out"/>
			</form>
            </div>
                </nav>
                
 
 <%-- add project modal --%>      
       
   
  <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#AddProject">  <span class="glyphicon glyphicon-plus-sign"></span>  Add Project</button>
  <div class="modal fade" id="AddProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                   <div class="modal-dialog">
                       <div class="modal-content">
                           <div class="modal-body">
                               <div class="panel panel-primary">  <div class="panel-heading"><b>Add Project</b></div>
                    <div class="panel-body">
                     <html:form action="AddProjectAction">   
                     <div class="form-group">
                     <label for="">Project name</label>
                        <input type="text" required class="form-control" id="ProjectName" property="project_name" name="project_name" placeholder="Enter project name">
                    </div>
                    <div class="form-group">
                    <label for="">Start Date</label>
                    <input type="date" required class="form-control" id="StartDate" property="start_date" name="start_date" placeholder="Enter Start Date">
                     </div> 
                     <div class="form-group">
                    <label for="">End Date</label>
                    <input type="date" required class="form-control" id="StartDate" property="end_date" name="end_date" placeholder="Enter End Date">
                     </div>
                        <div class="form-group">
                    <label for="">Business Unit</label>
                    <select class="form-control" name="business_unit" property="business_unit">
                    <option>local</option>
                    <option>ROW</option>
                     <option>Alliance</option>
                     <option>JP Independent</option>
                  </select>
                     </div>
                     
                        <div class="form-group">
                    <label for="">Type</label>
                    <select class="form-control" name="type" property="type">
                    <option>project based</option>
                    <option>T&M</option>
                  </select>
                     </div>
                     <div class="form-group">
                    <label for="">Status</label>
                   <select class="form-control" name="status" property="status">
                    <option>ongoing</option>
                    <option>closed</option>
                    
                  </select>
                     </div>   
                        
               
                        
                    <button type="submit" id="submitAddMember" class="btn btn-success">OK</button>
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancel</button>
                   </html:form>
                        
                        
                    </div>   
                    </div></div></div>
                    </div>
                   </div>
  
  
 <%-- add project modal --%>  
 
  <div style="margin-top:30px">
      <%! int id;
          String status, color;
      %>
		<table class="table table-hover table-condensed" id="myTable">
				<thead>
					<tr>
                                                <th>
							Project ID
						</th>
						<th>
							Project name
						</th>
						<th>
							Start date
						</th>
						<th>
							End date
						</th>
						<th>
							Business Unit
						</th>                                                
						<th>
							Type
						</th>
						<th>
							Status
						</th>
                                                <th>
							Action
						</th>
            
					</tr>
				</thead>
				<tbody>
                                       <%
    
    String pID = request.getParameter("pID"); session.setAttribute("pID",pID);
    
   %>
                                    <logic:iterate name="project" id="projectId">
                                                                                                <bean:define id="status">
							<bean:write name="projectId" property="status"/> 
                                                        </bean:define>
                                        <% 
                                        color= (status.compareTo("ongoing")==0)?"success":"danger";
                                        %>
                                        
                                               <tr class="<%= color %>"> 
                                                <td>
                                                    <bean:define id="id">
                                                        <bean:write name="projectId" property="id"/> 
                                                    </bean:define>
                                                    <%= id %> 
						</td>
						<td>
							<bean:write name="projectId" property="project_name"/> 
						</td>
						<td>
							<bean:write name="projectId" property="start_date"/> 
						</td>
						<td>
							<bean:write name="projectId" property="end_date"/> 
						</td>
						<td>
							<bean:write name="projectId" property="business_unit"/> 
						</td>                                                
						<td>
							<bean:write name="projectId" property="type"/> 
						</td>
						<td>
                                                        <bean:define id="status">
							<bean:write name="projectId" property="status"/> 
                                                        </bean:define>
                                                    <%= status%>
						</td>
                                                
						<td>
                                                    <a href="ResourceSummary.jsp?param=<%= id %>"<button type="submit" class="btn btn-default btn-xs"> <span class="glyphicon glyphicon-folder-open"> </span></button>
							</a>
							
						</td>
     
                                                
					</tr>
					
     </logic:iterate>
					

				</tbody>
			</table>
		


        
	</div>	
   
		</div>
    </div>

<footer class="footer">
      <div class="container">
        
       
      </div>
    </footer></div>
</body>
	
	 <script type="text/javascript">
      $(document).ready( function () {
   $('#myTable').DataTable();
} );
	</script>

</html>