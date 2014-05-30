<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="checkSession.jsp"></jsp:include>
<html>
    <head>
		<meta charset="ISO-8859-1">
        <title>Add Project</title>
		
		<link rel="stylesheet" type="text/css" href="css/dataTables.css" />
		<link rel="stylesheet" type="text/css" href="css/add.css" />
		
    	<script type="text/javascript" src="js/jquery.min.js"></script>
    	<script type="text/javascript" src="js/nod.min.js"></script>
    </head>
    <body>
		<s:div id="header">
			<h1>ADD PROJECT</h1>
		</s:div>
		<s:div id="content">
			<s:div id="add-box">
				<s:form action="addProject.action" id="add" method="post" name="add">
					<table id="add-table">
						<tr>
							<td>Project Name:</td>
							<td><input autocomplete="off" id="field1" type="text" name="projectname" size="20" /></td>
						</tr>
						<tr>
							<td>Date From:</td>
							<td><input type="date" id="field2" name="from" value="yyyy-mm-dd"/></td>
						</tr>
						<tr>
							<td>Date To:</td>
							<td><input type="date" id="field3" name="to" value="yyyy-mm-dd"/></td>
						</tr>
						<tr>
							<td>Status:</td>
							<td>
								<select name="status" id="field4">
									<option value="null"></option>
									<option value="no movement"> No movement </option>
									<option value="proposal"> Proposal </option>
									<option value="official"> Official go</option>
									<option value="verbal go"> Verbal go</option>
									<option value="for_est"> For estimation</option>
									<option value="ongoing_est"> Ongoing estimation</option>
									<option value="dropped"> Dropped</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>Business Unit:</td>
							<td>
								<select name="businessunit" id="field5">
									<option value="null"></option>
									<option value="Local">Local</option>
									<option value="JP Independent">JP Independent</option>
									<option value="ROW">ROW</option>
									<option value="Alliance">Alliance</option>
								</select>
							</td> 
						</tr>
						<tr>
							<td>Project Type:</td>
							<td>
								<select name="projecttype" id="field6">
									<option value="null"></option>
									<option value="Project-Based">Project-Based</option>
									<option value="Time and Material">Time and Material</option>
									
								</select>
							</td> 
						</tr>
						<tr>
							<td>Resources Needed:</td>
							<td><input autocomplete="off" id="field7" type="text" name="resourcesneeded" size="20" /></td>
						</tr>
						<tr>
							<td>Remarks:</td>
							<td><s:textarea autocomplete="off" id="field8" name="remarks"></s:textarea></td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td></td>
							<td>
								<input class="add-button" id="add-but" type="submit" value="Submit" />
								<a href="view_project"><button class="add-button" type="button"><span id="add-label">Cancel</span></button></a>
							</td>
						</tr>
					</table>
				</s:form>
				<script>
					var metrics = [
						['#field1, #field2, #field3, #field7, #field8', 'presence', 'Cannot be empty']
					];
					$("#add").nod(metrics);

					var chars = [
						['#field4, #field5, #fielf6', 'not:null', 'Cannot be empty']
					];
					$("#add").nod(chars);
				</script>
			</s:div>
		</s:div>
    </body>
</html>