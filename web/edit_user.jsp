<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="checkSession.jsp"></jsp:include>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User</title>

<link rel="stylesheet" type="text/css" href="css/global.css" />
<link rel="stylesheet" type="text/css" href="css/edit.css" />

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/nod.min.js"></script>
</head>
<body>
	<s:div id="header">
		<h1>EDIT USER</h1>
	</s:div>
	<s:div id="content">
		<s:div id="edit-box">
			<s:form action="editUser.action" id="edit" method="post" name="edit">
				<s:iterator value="listUser">
					<input type="hidden" name="password" id="password"
						value="<s:property value="password" />" />
				</s:iterator>
				<table id="edit-table">
					<s:iterator value="listUser">
					<tr>
						<td colspan="2">
							<s:actionerror id="error-label"/>
						</td>
					</tr>
					
					<tr>
						<td>First Name:</td>
						<td><input autocomplete="off" id="field1" type="text" name="first_name" size="20" value="<s:property value="firstname"/>"/></td>
					</tr>
					
					<tr>
						<td>Middle Name:</td>
						<td><input autocomplete="off" id="field2" type="text" name="middle_name" size="20" value="<s:property value="middlename"/>"/></td>
					</tr>
					<tr>
						<td>Last Name:</td>
						<td><input autocomplete="off" id="field3" type="text" name="last_name" size="20" value="<s:property value="lastname"/>"/></td>
					</tr>
					<tr>
						<td>Username:</td>
						<td><input readonly autocomplete="off" id="field4" type="text" name="username" size="20" value="<s:property value="username"/>"/></td>
					</tr>
					<tr>
						<td>Enter Old Password:</td>
						<td><input autocomplete="off" id="field5" type="password" name="old_password" size="20" /></td>
					</tr>
					<tr>
						<td>Enter New Password:</td>
						<td><input autocomplete="off" id="field6" type="password" name="new_password" size="20" /></td>
					</tr>
					<tr>
						<td>Confirm New Password:</td>
						<td><input autocomplete="off" id="field7" type="password" name="con_password" size="20" /></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input class="edit-button" id="edit-but" type="submit" value="Submit" />
							<a href="view_user"><button class="edit-button" type="button"><span id="edit-label">Cancel</span></button></a>
						</td>
					</tr>
					</s:iterator>
				</table>
			</s:form>
				<script>
					var metrics = [
						['#field1, #field2, #field3, #field4, #field7', 'presence', 'Cannot be empty']
					];
					$("#edit").nod(metrics);
					
					var lala = [
						['#field5', 'same-as:#password', 'Password is incorrect']
					];
					$("#edit").nod(lala);
					
					var chars = [
						['#field7', 'same-as:#field6', 'Password did not match']
					];
					$("#edit").nod(chars);
				</script>
		</s:div>
	</s:div>
</body>
</html>