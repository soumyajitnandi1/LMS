<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= session.getAttribute("username") %>'s Page</title>
</head>
<body>
	Welcome <%= session.getAttribute("username") %>	
</body>
</html>