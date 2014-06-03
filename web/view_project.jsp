<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="checkSession.jsp"></jsp:include>
<html>
    <head>
		<meta charset="ISO-8859-1">
        <title>View Projects</title>
		
                
        
		<link rel="stylesheet" type="text/css" href="css/dataTables.css" />
		
		<link href="css/view.css" rel="stylesheet" type="text/css" />
		
	
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="js/delete_from_table.js"></script>
                
                <link rel="stylesheet" type="text/css" href="media/css/bootstrap.min.css"/>
                <link rel="stylesheet" type="text/css" href="bootstrap-3.1.1/docs/assets/css/docs.min.css"/>
		
                <script src="media/js/bootstrap.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#view-table').dataTable( {
					"pagingType": "full_numbers"
				});
			});
                        
                        function editRow(row)
                        {
                            $.get('edit_project.action',{project_id:row},function(responseText) { 
                            var json = $.parseJSON(responseText);
                            $('#edit-body').html("<form action='editProject.action' id='edit' method='post' name='edit'>" +
					"<s:iterator value='listProject'>" +
						"<input type='text' name='projectid'" +
							"value='<s:property value='projectid' />' />" +
					"</s:iterator>" +
				"<table id='edit-table'>" +
					"<s:iterator value='listProject'>" +
						"<tr>" +
							"<td>Project Name:</td>" +
							"<td><input autocomplete='off' required='required' id='field1' type='text'" +
								"name='projectname' size='20'" +
								"value='<s:property value='projectname'/>' /></td>" +
						"</tr>" +
						"<tr>" +
							"<td>Date From:</td>" +
							"<td><input type='date' id='field2' required='required' name='from'" +
								"value='<s:property value='from'/>' /></td>" +
						"</tr>" +
						"<tr>" +
							"<td>Date To:</td>" +
							"<td><input type='date' id='field3' required='required' name='to'" +
								"value='<s:property value='to'/>' /></td>" +
						"</tr>" +
						"<tr>" +
							"<td>Status:</td>" +
							"<td>" +
								"<select name='status' required='required' id='field4'>" +
									"<option value='null'></option>" +
									"<s:iterator value='listStatus'>" +
										"<option value='<s:property value='name'/>' <s:property value='status'/>><s:property value='name'/></option>" +
									"</s:iterator>" +
								"</select>" +
							"</td>" +
						"</tr>" +
						"<tr>" +
							"<td>Business Unit:</td>" +
							"<td>" +
								"<select name='businessunit' required='required' id='field5'>" +
									"<option value='null'></option>" +
									"<s:iterator value='listUnit'>" +
										"<option value='<s:property value='name'/>' <s:property value='status'/>><s:property value='name'/></option>" +
									"</s:iterator>" +
								"</select>" +
							"</td>" +
						"</tr>" +
						"<tr>" +
							"<td>Project Type:</td>" +
							"<td>" +
								"<select name='projecttype' required='required' id='field6'>" +
									"<option value='null'></option>" +
									"<s:iterator value='listType'>" +
										"<option value='<s:property value='name'/>' <s:property value='status'/>><s:property value='name'/></option>" +
									"</s:iterator>" +
								"</select>" +
							"</td>" +
						"</tr>" +
						"<tr>" +
							"<td>Resources Needed:</td>" +
							"<td><input autocomplete='off' required='required' id='field7' type='text'" +
								"name='resourcesneeded' size='20'" +
								"value='<s:property value='resourcesneeded'/>' /></td>" +
						"</tr>" +
						"<tr>" +
							"<td></td>" +
							"<td><input class='edit-button' id='edit-but' type='submit'" +
								"value='Submit' /> <a href='view_project'><button" +
										"class='edit-button' type='button'>" +
										"<span id='add-label'>Cancel</span>" +
									"</button></a></td>" +
						"</tr>" +
					"</s:iterator>" +
				"</table>" +
			"</form>"
                        );        
                        });
                        }
		</script>
    </head>
    <body>
        <div class="container" id="header">
            <div class="row">
             <div style="background-color: #f5f5f5">
                <img src="media/images/header_logo.jpg" class="img-rounded" alt="Responsive image">
             </div>
                <nav class="navbar navbar-default " role="navigation">
                    <div class="container-fluid">
			<ul class="nav navbar-nav ">
                            <li><a href="view_project">Project Outlook Summary</a></li>
                            <li><a href="PrStart.jsp"> Project Summary</a></li>
                            <li><a href="populateAction.do"> Resource Summary</a></li>
			</ul>
			<s:if test="#session.usertype == 1">
				<a href="view_user"><img id="account" src="images/manage.png" title="Manage Accounts" width="50px" /></a>
			</s:if>
			<s:form action="logout.action" method="post">
				<s:submit id="logout-button" value="Log out"/>
			</s:form>
            </div>
                </nav>
		<s:div id="content">
			<table border=0 id="view-table" class="display" cellspacing="0" width="100%">
			<thead>
			<tr>
				<th>Project Name</th>
				<th>Start Date</th>
				<th>End Date</th>
				<th>Project Type</th>
				<th>Project Status</th>
				<th>Business Unit</th>
				<th>Resources Needed</th>
				<th></th>
				<th></th>
			</tr>
			</thead>
			<tbody>
				<s:iterator value="listProject">
					<tr>
						<td>
							<s:property value="projectname" />
						</td>
						<td>
							<s:property value="from" />
						</td>
						<td>
							<s:property value="to" />
						</td>
						<td>
							<s:property value="projecttype" />
						</td>
						<td>
							<s:property value="status" />
						</td>
						<td>
							<s:property value="businessunit" />
						</td>
						<td>
							<s:property value="resourcesneeded" />
						</td>
						<td>
							<s:if test="#session.usertype == 1">
								<a href="#" data-toggle="modal" data-target="#edit-box"><span onclick="editRow('<s:property value="projectid"/>');"><img title="Edit Project" width="25px" src="images/edit-icon.png"></span></a>
							</s:if>
						</td>
						<td>
							<s:if test="#session.usertype == 1">
								<label onclick="deleteRow('<s:property value="projectname"/>');"><a href='#'><img title='Delete Project' width='25px' src="images/delete-icon.png"></a></label>
							</s:if>
						</td>
					</tr>
				</s:iterator>
			</tbody>
			</table>
			<s:div>
				<button id="add-button" title="Add Project" type="button" data-toggle="modal" data-target="#add-box"><span id="add-label">Add Project</span></button>
			</s:div>
                        <div class="modal fade" id="add-box" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <div class="panel panel-primary">  <div class="panel-heading"><b>Add Project</b></div>
                                            <div class="panel-body">
                                    <s:form action="addProject.action" id="add" method="post" name="add">
                                        <div class="form-group">
                                            <label for="">Project Name:</label>
                                            <input class="form-control" autocomplete="off" required="required" id="field1" type="text" name="projectname" size="20" />
                                        </div>
                                        <div class="form-group">
                                            <label for="">Date From:</label>
                                            <input class="form-control" type="date" id="field2" required="required" name="from" value="yyyy-mm-dd"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Date To:</label>
                                            <input class="form-control" type="date" id="field3" required="required" name="to" value="yyyy-mm-dd"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Status:</label>
                                            <select class="form-control" name="status" required="required" id="field4">
                                                    <option></option>
                                                    <option value="No movement"> No movement </option>
                                                    <option value="Proposal"> Proposal </option>
                                                    <option value="Official go"> Official go</option>
                                                    <option value="Verbal go"> Verbal go</option>
                                                    <option value="For estimation"> For estimation</option>
                                                    <option value="Ongoing estimation"> Ongoing estimation</option>
                                                    <option value="Dropped"> Dropped</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Business Unit:</label>
                                            <select class="form-control" name="businessunit" required="required" id="field5">
                                                    <option></option>
                                                    <option value="Local">Local</option>
                                                    <option value="JP Independent">JP Independent</option>
                                                    <option value="ROW">ROW</option>
                                                    <option value="Alliance">Alliance</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Project Type:</label>
                                            <select class="form-control" name="projecttype" required="required" id="field6">
                                                    <option></option>
                                                    <option value="Project-Based">Project-Based</option>
                                                    <option value="Time and Material">Time and Material</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Resources Needed:</label>
                                            <input class="form-control" autocomplete="off" id="field7" required="required" type="number" min="0" name="resourcesneeded" size="20" />
                                        </div>
                                        
                                        <input class="btn btn-success" required="required" id="add-but" type="submit" value="Submit" />
                                        &nbsp;
                                        <button class="btn btn-danger" type="button" data-dismiss="modal"><span>Cancel</span></button>
				</s:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
			</div>
                                
                        
                        <div class="modal fade" id="edit-box" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <div class="panel panel-primary">  <div class="panel-heading"><b>Add Project</b></div>
                                            <div id="edit-body">
                                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
			</div>
		</s:div>
    </body>
</html>