<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="checkSession.jsp"></jsp:include>
<html>
    <head>
		<meta charset="ISO-8859-1">
        <title>Add User</title>
		
		<link rel="stylesheet" type="text/css" href="css/dataTables.css" />
		<link rel="stylesheet" type="text/css" href="css/add.css" />
		
    	<script type="text/javascript" src="js/jquery.min.js"></script>
    	<script type="text/javascript" src="js/nod.min.js"></script>
    </head>
    <body>
		<s:div id="header">
			<h1>ADD USER</h1>
		</s:div>
		<s:div id="content">
			<s:div id="add-box">
				<s:form action="addUser.action" id="add" method="post" name="add">
					<table id="add-table">
						<tr>
							<td>First Name:</td>
							<td><input autocomplete="off" required="required" id="field1" type="text" name="first_name" size="20" /></td>
						</tr>
						
						<tr>
							<td>Middle Name:</td>
							<td><input autocomplete="off" required="required" id="field2" type="text" name="middle_name" size="20" /></td>
						</tr>
						<tr>
							<td>Last Name:</td>
							<td><input autocomplete="off" required="required" id="field3" type="text" name="last_name" size="20" /></td>
						</tr>
						<tr>
							<td>Username:</td>
							<td><input autocomplete="off" required="required" id="field4" type="text" name="username" size="20" /></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input autocomplete="off" required="required" id="field5" type="password" name="password" size="20" /></td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td></td>
							<td>
								<input class="add-button" id="add-but" type="submit" value="Submit" />
								<a href="view_user"><button class="add-button" type="button"><span id="add-label">Cancel</span></button></a>
							</td>
						</tr>
					</table>
				</s:form>
				<script>
					var metrics = [
						['#field1, #field2, #field3, #field4, #field5', 'presence', 'Cannot be empty']
					];
					$("#add").nod(metrics);
				</script>
			</s:div>
		</s:div>
    </body>
</html>