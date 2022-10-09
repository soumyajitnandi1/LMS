<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LMS Login</title>
</head>
<body>
	<c:if test="${sessionScope.isValidUser == true}">
		<%response.sendRedirect(request.getContextPath()+"/user/welcome");%>
	</c:if>
	<form action="<%=request.getContextPath() %>/doLogin" method="post">
		Username: <input type="text" name="username"/> <br/>
		Password: <input type="password" name="password"/> <br/>
		<input type="submit" value="login"/>
	</form>
</body>
</html>