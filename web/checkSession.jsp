<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="#session.username == null
		&& #session.password == null">
	<jsp:forward page="login.jsp" />
</s:if>