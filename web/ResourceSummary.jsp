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
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>RESOURCE SUMMARY</title>
        <script type="text/javascript" charset="utf-8" src="jquery.js"></script>
   <script type="text/javascript" charset="utf-8" src="bootstrap-3.1.1/dist/js/bootstrap.js"></script>
        <script type="text/javascript" charset="utf-8" src="jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf-8" src="jquery.dataTables.css"></script>
   <link rel="stylesheet" type="text/css" href="bootstrap-3.1.1/dist/css/bootstrap.min.css"/>
           <style type="text/css" title="currentStyle">
        @import "demo_table.css";
        </style>
  </head>    <body data-spy="scroll" data-target=".bs-docs-sidebar">
            <%!
                com.myapp.struts.data.DBconnection db = new com.myapp.struts.data.DBconnection();
                com.myapp.struts.data.Employee emp=new com.myapp.struts.data.Employee();
                com.myapp.struts.data.Effort effort=new com.myapp.struts.data.Effort();
                java.sql.Connection conn;
                java.sql.ResultSet rs, ra;
                int s;
                String sql;
                int id;
                String pID;
            %>
                     <%  if(request.getParameter("param") != null)
            {
                session.setAttribute("pID", request.getParameter("param"));
            }
                pID = (String) session.getAttribute("pID" );
                conn=db.toConnect();   
                sql="Select * from project where project_id= " + id ;
                
                db.setSql(sql);
                db.executeQuery(conn);    
                ra=db.getRs();  
                ra.next();
               
                %>
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

        <% 
                        conn=db.toConnect();                        
                 sql="Select * from project where project_id= " + session.getAttribute("pID") ;
                
                db.setSql(sql);
                db.executeQuery(conn);    
                ra=db.getRs();  
                ra.next();
                id=ra.getInt("project_id");
        %>
          <div style="margin-left:20px;margin-right:20px">
          <p class="head"><strong>Project Name:</strong> <%= ra.getString("project_name")%></p>
          <p class="head"><strong>Start Date:</strong> <%= ra.getString("start_date")%></p>
          <p class="head"><strong>End Date:</strong> <%= ra.getString("end_date")%></p>
          <p class="head"><strong>Business Unit: </strong><%= ra.getString("business_unit")%></p>
          <p class="head"><strong>Project Type: </strong><%= ra.getString("type")%></p>
          <p class="head"><strong>Project Status:</strong> <%= ra.getString("status")%></p>
          
          <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#AddMember"> <img src="add_member.png">  Add member</button>
          <div class="modal fade" id="AddMember" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                   <div class="modal-dialog">
                       <div class="modal-content">
                           <div class="modal-body">
                <div class="panel panel-primary">  <div class="panel-heading">Add member</div>
                    <div class="panel-body">
                        <div style="margin-top:20px;">  
  
            <html:form action="AddMemberAction">
                   
                        <label for="Member"><strong>Member name</strong></label>        
                 <select property="member" name="member" class="form-control" style="width:300px">
            <%

            
                sql="Select * from employee";
                db.setSql(sql);
                db.executeQuery(conn);    
                rs=db.getRs();  
                while(rs.next()){
                   %>   
              <option value=<%=rs.getInt("EmpIDNum")%> > <%= rs.getString("FirstName")+ " " + rs.getString("MiddleName") + " " + rs.getString("LastName")%> </option>     
                  <% } %>
                 </select> <br>
                 
                 <label for="Year"><strong>Year</strong></label>
 
                 <select property="year" name="year" class="form-control" style="width:80px">
                    
                  <%

            
                Date startDate=ra.getDate("start_date");
                Date endDate=ra.getDate("end_date");
              /*  SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
                String sqlDate = sdf.format(rs.getDate("start_date"));
                int start = Integer.parseInt(sqlDate);
                sqlDate = sdf.format(rs.getDate("end_date"));*/
                int start = startDate.getYear();
                int end = endDate.getYear();
                for(; start<=end ;start++){
                                 %>   
                                 <option><%=start + 1900%> </option>     
                  <% } %>                     
                     
                     
                     
                     
                 </select>
                 <br>
                <label for="Effort"><strong>Effort</strong></label>
                <table> <tbody><tr>
                    <input type="hidden" value="<%= id %>" property="proj_id" name="proj_id"/>
                            <td> <label for="Effort">Jan</label>
                
                    
                <select property="jan" name="jan" class="form-control" style="width:80px">
                <option>0</option>
                <option>0.25</option>
                <option>0.50</option>
                <option>0.75</option>
                <option>1</option>
                </select>
                            </td>
                            <td><label for="Effort">Feb</label>
                <select property="feb" name="feb" class="form-control" style="width:80px">
                <option>0</option>
                <option>0.25</option>
                <option>0.50</option>
                <option>0.75</option>
                <option>1</option>
                </select></td>
                                
                <td>
                    <label for="Effort">Mar</label>
                    <select property="mar" name="mar" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>
                <td>
                    <label for="Effort">Apr</label>
                    <select property="apr" name="apr" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>                        
                <td>
                    <label for="Effort">May</label>
                    <select property="may" name="may" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>     
                <td>
                    <label for="Effort">Jun</label>
                    <select property="jun" name="jun" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>                
                </tr>
                <tr>
                <td>
                    <label for="Effort">Jul</label>
                    <select property="jul" name="jul" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td> 
                <td>
                    <label for="Effort">Aug</label>
                    <select property="aug" name="aug" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>  
                <td>
                    <label for="Effort">Sep</label>
                    <select property="sep" name="sep" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>
                <td>
                    <label for="Effort">Oct</label>
                    <select property="oct" name="oct" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>   
                <td>
                    <label for="Effort">Nov</label>
                    <select property="nov" name="nov" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>  
                <td>
                    <label for="Effort">Dec</label>
                    <select property="dec" name="dec" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>                
                </tr>    
                    </tbody> </table>
            <br>
                    <button type="submit" id="submitAddMember" class="btn btn-success">OK</button>
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancel</button>
                     
            </html:form>
                            
                            
                        </div>
                    </div>   
                    </div></div></div>
                    </div>
                   </div></div>
    	
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
    	      </tr>
  </thead>
    	   
    	   <tbody>

            <%
                sql="Select * from employee join member on employee.EmpIDNum= member.emp_id"
                + " join memlist on member.mem_id= memlist.mem_id && memlist.proj_id= '" +id+"'";                                   
               
                conn=db.toConnect();
                db.setSql(sql);
                db.executeQuery(conn);    
                rs=db.getRs();
                while (emp.setEmployee(rs)!=false)
                {
                    s=0; 
                    float[] months=new float[12];
                    int mem_id=rs.getInt("mem_id");
                    sql="Select * from effort where mem_id='" + mem_id +"'";
                    db.setSql(sql);
                    db.executeQuery(conn);
            %>
    	        <tr>
    	            <td>
    	                <%= emp.getEmp_fn() + " " + emp.getEmp_mn() + " " + emp.getEmp_ln()%>
    	            </td>
                    <%
                       while(effort.setEffort(db.getRs())!=false)
                       {
                           
                        months=effort.getMonths();
                        if(s==1){
                    %>
                    <td></td>
                    <% } %>
                    <%
                        for(int i=0;i<12;i++){                           
                    %>
    	                
                         <td>
    	                    <%= months[i]%>
    	                 </td>
                    <%  
                        } 
                        s=1;
                    %>    
                         <td>
    	                    <%= effort.getYear() %>
    	                 </td>                    
        	</tr>
            <% 
                    }
                } 
            %>
   
                   <tr>
                       <td>${member.name}</td>
                       <td>${member.months[0]}</td>
                       <td>${member.months[1]}</td>
                       <td>${member.months[2]}</td>
                       <td>${member.months[3]}</td>
                       <td>${member.months[4]}</td>
                       <td>${member.months[5]}</td>
                       <td>${member.months[6]}</td>
                       <td>${member.months[7]}</td>
                       <td>${member.months[8]}</td>
                       <td>${member.months[9]}</td>
                       <td>${member.months[10]}</td>
                       <td>${member.months[11]}</td>
                   </tr>
                       
                  
    	   </tbody>
    	</table>
            <p></p>
    	</div>
    	</div>
    	</div>
    </body>
</html>
