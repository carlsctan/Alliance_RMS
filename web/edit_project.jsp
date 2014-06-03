<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="checkSession.jsp"></jsp:include>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Project</title>

<link rel="stylesheet" type="text/css" href="css/edit.css" />

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/nod.min.js"></script>
</head>
<body>
	<s:div id="header">
		<h1>EDIT PROJECT</h1>
	</s:div>
	<s:div id="content">
		<s:div id="edit-box">
			<s:form action="editProject.action" id="edit" method="post"
				name="edit">
					<s:iterator value="listProject">
						<input type="hidden" name="projectid"
							value="<s:property value="projectid" />" />
					</s:iterator>
				<table id="edit-table">
					<s:iterator value="listProject">
						<tr>
							<td>Project Name:</td>
							<td><input autocomplete="off" required="required" id="field1" type="text"
								name="projectname" size="20"
								value="<s:property value="projectname"/>" /></td>
						</tr>
						<tr>
							<td>Date From:</td>
							<td><input type="date" id="field2" required="required" name="from"
								value="<s:property value="from"/>" /></td>
						</tr>
						<tr>
							<td>Date To:</td>
							<td><input type="date" id="field3" required="required" name="to"
								value="<s:property value="to"/>" /></td>
						</tr>
						<tr>
							<td>Status:</td>
							<td>
								<select name="status" required="required" id="field4">
									<option value="null"></option>
									<s:iterator value="listStatus">
										<option value="<s:property value="name"/>" <s:property value="status"/>><s:property value="name"/></option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<tr>
							<td>Business Unit:</td>
							<td>
								<select name="businessunit" required="required" id="field5">
									<option value="null"></option>
									<s:iterator value="listUnit">
										<option value="<s:property value="name"/>" <s:property value="status"/>><s:property value="name"/></option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<tr>
							<td>Project Type:</td>
							<td>
								<select name="projecttype" required="required" id="field6">
									<option value="null"></option>
									<s:iterator value="listType">
										<option value="<s:property value="name"/>" <s:property value="status"/>><s:property value="name"/></option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<tr>
							<td>Resources Needed:</td>
							<td><input autocomplete="off" required="required" id="field7" type="text"
								name="resourcesneeded" size="20"
								value="<s:property value="resourcesneeded"/>" /></td>
						</tr>

						
						<tr>
							<td></td>
							<td><input class="edit-button" id="edit-but" type="submit"
								value="Submit" /> <a href="view_project"><button
										class="edit-button" type="button">
										<span id="add-label">Cancel</span>
									</button></a></td>
						</tr>
					</s:iterator>
				</table>
			</s:form>
				<script>
					var metrics = [
						['#field1, #field2, #field3, #field7, #field8', 'presence', 'Cannot be empty']
					];
					$("#edit").nod(metrics);

					var chars = [
						['#field4, #field5, #fielf6', 'not:null', 'Cannot be empty']
					];
					$("#edit").nod(chars);
				</script>
		</s:div>
	</s:div>

</body>
</html>