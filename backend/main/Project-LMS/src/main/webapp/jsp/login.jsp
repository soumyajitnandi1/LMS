<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Muli'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginregister.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
</head>
<body>

			<c:set var="session" value="${session}" ></c:set>
                        <c:choose>
                        	<c:when test= '${fn:contains(session, "admin") }'>
                        	<%response.sendRedirect(request.getContextPath()+"/adminDB");%>
                        	</c:when>
                        	<c:when test= "${not empty session }">
                        	<%response.sendRedirect(request.getContextPath()+"/userDB");%>
                        	</c:when>
                        </c:choose>
            <nav class="navbar align-content-center  navbar-expand-lg navbar-dark " id="nav">
                <div class="container">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}">
                        <i class="fas fa-book-open" style="margin-right: 5px;"></i>


                        <b id="brand" style="font-size: 28px;">Library Management System</b>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">

                        <ul id="nav-list" class="navbar-nav justify-content-center navItem">
                            <li class="nav-item">
                                <a class="nav-link item mx-1" href="${pageContext.request.contextPath}">Home</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link item mx-1" href="${pageContext.request.contextPath}/catalogue">Books</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>


<!-- partial:index.partial.html -->
<div id="form-bg" class="pt-5">
  <h1 class="text-center">Log In</h1>
  
<div class="container">
                <div class="row">
                    <div class="col-md-5 mx-auto">
                        <div class="card card-body">
                                                    
                            <form:form id="submitForm" action="userLogin" method="post" modelAttribute="req">
                                <div class="form-group required">
                                    <form:label path="phone">Phone No</form:label>
                                    <form:input class="form-control text-lowercase" path="phone" />
                                    <c:if test="${not empty notRegistered}">
										<span style="color:#D8000C">Phone no. not registered.</span>
									</c:if>
                                    <form:errors cssStyle="color:#D8000C" path="phone"></form:errors>
                                </div>                    
                              
                                <div class="form-group required">
                                     <form:label path="password">Password</form:label>
                                    <form:password class="form-control text-lowercase" path="password" />
	                                <c:if test="${not empty password}">
										<span style="color:#D8000C">Invalid Password</span>
									</c:if>
                                    <form:errors cssStyle="color:#D8000C" path="password"></form:errors>
                                </div> 
                                <div class="form-group pt-1">
                                    <button class="btn btn-primary btn-block" type="submit">Log In</button>
                                </div>
                            </form:form>
                            <p class="small-xl pt-3 text-center">
                                <span class="text-muted">Not a member?</span>
                                <a href="register">Sign up</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
</div>
<!-- partial -->
  
</body>
</html>
</html>

									
                                    
                                    


