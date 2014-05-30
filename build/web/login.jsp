<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="#session.username != null
		&& #session.password != null">
	<jsp:forward page="view_project" />
</s:if>
<html>
    <head>
		<meta charset="ISO-8859-1">
        <title>Resource Management System</title>
		
		<link href="css/index.css" rel="stylesheet" type="text/css" />
    </head>
    
    <body>
		<s:div id="content">
			<s:div id="logo">
				<img src="images/header_logo.jpg" />
			</s:div>
			<s:div id="login-box">
				<s:form action="login" id="login" method="post" name="login">
					<s:textfield autocomplete="off" id="userfield" maxlength="50" name="username" placeholder="Username" size="25" tabindex="1" />
					<s:password autocomplete="off" id="passfield" maxlength="50" name="password" placeholder="Password" size="25" tabindex="2" />
					<s:submit id="login-button" tabindex="3" value="Log in" />
				</s:form>
			</s:div>
			
			<s:actionerror id="error-label"/>
		</s:div>
    </body>
</html>