<%-- 
    Document   : ProjectSummary
    Created on : May 11, 2014, 7:55:59 PM
    Author     : jay
--%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html lang="en">
    
  <head>
    <meta charset="utf-8">
    <title>PROJECT SUMMARY</title>
         <link type="text/css" rel="stylesheet" href="css/view.css">
        <link type="text/css" rel="stylesheet" href="media/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="media/css/dataTables.bootstrap.css">
        <script src="media/js/complete.js" type="text/javascript" ></script>
        <script src="media/js/jquery.js" type="text/javascript"></script>
        <script src="media/js/bootstrap.js" type="text/javascript"></script>
        <script src="media/js/jquery.dataTables.js" type="text/javascript"></script>    
        <script src="media/js/jquery.dataTables.columnFilter.js" type="text/javascript" ></script>
        <link rel="stylesheet" type="text/css" href="bootstrap-3.1.1/docs/assets/css/docs.min.css"/>
         <script type="text/javascript" src="media/moment.js"></script>
        <script type="text/javascript" src="media/bootstrap-datetimepicker.min.js"></script>
        <link rel="stylesheet" type="text/css"  href="media/bootstrap-datetimepicker.css" />   
        <style type="text/css" title="currentStyle">
       


        @import "demo_table.css";
        </style>
  </head>
<body data-spy="scroll" data-target=".bs-docs-sidebar">

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
                    <input type="text" required class="form-control" id="StartDate" property="start_date" name="start_date" placeholder="Enter Start Date">
                     </div> 
                     <div class="form-group">
                    <label for="">End Date</label>
                    <input type="text" required class="form-control" id="EndDate" property="end_date" name="end_date" placeholder="Enter End Date">
                     </div>
                        <div class="form-group">
                    <label for="">Business Unit</label>
                    <select class="form-control" name="business_unit" property="business_unit">
                    <option>Local</option>
                    <option>ROW</option>
                     <option>Alliance</option>
                     <option>JPIndependent</option>
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
      <%! int id, project_name;
         Date start_date, end_date; 
          String status, color, type, business_unit;
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
                                                        <bean:define id="project_name">
							<bean:write name="projectId" property="project_name"/> 
                                                        </bean:define>
                                                        <%= project_name %> 
						</td>
						<td>
                                                        <bean:define id="start_date">
							<bean:write name="projectId" property="start_date"/> 
                                                        </bean:define>
                                                        <%= start_date %> 
						</td>
						<td>
                                                        <bean:define id="end_date">
							<bean:write name="projectId" property="end_date"/> 
                                                        </bean:define>
                                                        <%= end_date %> 
						</td>
						<td>
                                                     <bean:define id="business_unit">
							<bean:write name="projectId" property="business_unit"/> 
                                                   </bean:define>
                                                        <%=business_unit%> 
						</td>                                                
						<td>
                                                        <bean:define id="type">
							<bean:write name="projectId" property="type"/> 
                                                        </bean:define>
                                                        <%=type%> 
						</td>
						<td>
                                                        <bean:define id="status">
							<bean:write name="projectId" property="status"/> 
                                                        </bean:define>
                                                        <%= status%>
						</td>
                                                
						<td>
                                                      <html:form action="DisplayResourceAction">
                                                                                   <%  System.out.println("to RESOURCEe" + id);%>
                                                      <input type="hidden" value="<%= id %>" property="id" name="id"/>
                                                      <input type="hidden" value="<%=project_name %>" property="project_name"/> 
                                                      <input type="hidden" value="<%= start_date %>" property="start_date"/>  
                                                      <input type="hidden" value="<%= end_date %>" property="end_date"/>  
                                                      <input type="hidden" value="<%= business_unit %>" property="business_unit"/>
                                                      <input type="hidden" value="<%= type %>" property="type"/>  
                                                      <input type="hidden" value="<%= status %>" property="status"/>  
                                                      <input type="hidden" value="<%= color %>" property="color"/>  
                                                    <button type="submit" class="btn btn-default btn-xs"> <span class="glyphicon glyphicon-folder-open"> </span></button>
                                                     </html:form> 
                                                    <html:form action="DeleteProjectAction">
                                                     <%  System.out.println("to RESOURCEe" + id);%>
                                                     <input type="hidden" value="<%= id %>" property="project_id" name="project_id"/>
                                                     <button type="submit" class="btn btn-default btn-xs"> <span class="glyphicon glyphicon-remove"> </span></button>
                                                      </html:form>		
						
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
   $(function () {
            $('#StartDate').datetimepicker({
                    pickTime: false});
            $('#EndDate').datetimepicker({
                    pickTime: false});
            $("#StartDate").on("dp.change",function (e) {
               $('#EndDate').data("DateTimePicker").setMinDate(e.date);
            });
            $("#EndDate").on("dp.change",function (e) {
               $('#StartDate').data("DateTimePicker").setMaxDate(e.date);
            });
} );
      });
	</script>

</html>
	