<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="checkSession.jsp"></jsp:include>
<html>
    <head>
		<meta charset="ISO-8859-1">
        <title>View Users</title>
		
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
				<th>Username</th>
				<th>First Name</th>
				<th>Middle Name</th>
				<th>Last Name</th>
				<th>Date Added</th>
				<th></th>
				<th></th>
			</tr>
			</thead>
			<tbody>
				<s:iterator value="listUser">
					<tr>
						<td>
							<s:property value="username" />
						</td>
						<td>
							<s:property value="firstname" />
						</td>
						<td>
							<s:property value="middlename" />
						</td>
						<td>
							<s:property value="lastname" />
						</td>
						<td>
							<s:property value="addedon" />
						</td>
						<td>
							<label><a href="edit_user?username=<s:property value="username"/>"><img title="Edit User" width="25px" src="images/edit-icon.png"></a></label>
						</td>
						<td>
							<label onclick="deleteUser('<s:property value="username"/>')"><a href='#'><img title='Delete User' width='25px' src="images/delete-icon.png"></a></label>
						</td>
					</tr>
				</s:iterator>
			</tbody>
			</table>
			<s:div>
				<a href="add_user.jsp"><button id="add-button" title="Add User" type="button"><span id="add-label">Add User</span></button></a>
			</s:div>
		</s:div>
    </body>
</html>