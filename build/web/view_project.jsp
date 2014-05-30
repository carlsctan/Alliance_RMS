<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="checkSession.jsp"></jsp:include>
<html>
    <head>
		<meta charset="ISO-8859-1">
        <title>View Projects</title>
		
		<link rel="stylesheet" type="text/css" href="css/dataTables.css" />
		
		<link href="css/view.css" rel="stylesheet" type="text/css" />
		
		<link type="text/css" rel="stylesheet" href="media/css/bootstrap.css">
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="js/delete_from_table.js"></script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$('#view-table').dataTable( {
					"pagingType": "full_numbers"
				});
			});
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
								<label><a href="edit_project?project_id=<s:property value="projectid"/>"><img title="Edit Project" width="25px" src="images/edit-icon.png"></a></label>
							</s:if>
						</td>
						<td>
							<s:if test="#session.usertype == 1">
								<label onclick="deleteRow('<s:property value="projectname"/>')"><a href='#'><img title='Delete Project' width='25px' src="images/delete-icon.png"></a></label>
							</s:if>
						</td>
					</tr>
				</s:iterator>
			</tbody>
			</table>
			<s:div>
				<a href="add_project.jsp"><button id="add-button" title="Add Project" type="button"><span id="add-label">Add Project</span></button></a>
			</s:div>
		</s:div>
    </body>
</html>