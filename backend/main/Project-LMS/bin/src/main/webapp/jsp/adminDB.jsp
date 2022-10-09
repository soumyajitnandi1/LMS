<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDB.css">
    <link href="${pageContext.request.contextPath}/css/modalForms.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/3480789ff2.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link href="${pageContext.request.contextPath}/css/page.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/srcbar.css">

</head>


<body>
    <nav class="navbar navbar-dark p-md-2" id="nav">
        <div id='title'>
            <a class="navbar-brand title" style="
            font-size: 30px;" href="${pageContext.request.contextPath }">

                <i class="fas fa-book-open" style="margin-right: 5px"></i>

                <b id="brand" style="font-size: 28px">Library Management System</b>

            </a>
        </div>
        <div id="db-name" style="color: #fff; font-size: 24px;">
            <b>Admin Dashboard <i class="fa fa-user-tie"></i></b>
        </div>
        <div class="logout">
            <a href="${pageContext.request.contextPath }/logout">Logout<i style="margin-left: 20px;" class="fa fa-sign-out"></i></a>
        </div>
    </nav>

    <div class="main">
        <div class="sidebar" id="sidebar" > 
            <ul class="sidebar-nav">
                <li>
                    <a href="${pageContext.request.contextPath}"><i class="fa fa-home"></i>Home</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/catalogue"><i class="fa fa-book-open"></i>Catalog</a>
                </li>
                <li>
                    <a href="issueRequests"><i class="fa fa-hand-point-right"></i>Issue Requests</a>
                </li>
                <li>
                    <a href="returnRequests"><i class="fa fa-hand-point-left"></i>Return Requests</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-cookie-bite"></i></i>Issue History</a>
                </li>
                <li>
                    <a onclick="openForm()" class="text-white" ><i class="fa fa-plus"></i>Add a Book</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-file-export"></i>Generate Report</a>
                </li>
                <div class="logout-side">
                    <a href="${pageContext.request.contextPath }/logout"><i class="fa fa-sign-out"></i>Logout</a>
                </div>
            </ul>
        </div>


        <div class="modal mt-5 form-popup d-none" id="myForm">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-white" id="exampleModalLabel">Add New Book</h4>

                        <button onclick="closeForm()" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form:form modelAttribute="req" action="addBook" method="post">
                            <div class="mb-2">
                                <div class="row">
                                    <div class="col col-lg-6">
                                        <i class="fas fa-book fa-1x"></i>
                                        <form:label path="title" for="book-name" class="col-form-label"><h6>Book Name<sup style="color: red;">*</sup></h6></form:label>
                                        <form:input path="title" type="text" class="form-control" id="book-name"/>
                                        <c:if test="${not empty exists}" >
                                        <span style="color:#D8000C;" >This book already exists</span>
                                        </c:if>
                                        <form:errors cssStyle="color:#D8000C" path="title"></form:errors>
                                    </div>

                                    <div class="col col-lg-6">
                                        <i class="fas fa-user"></i>
                                        <form:label path="author" for="Author-text" class="col-form-label"><h6>Author<sup style="color: red;">*</sup></h6></form:label>
                                        <form:input path="author" type="text" class="form-control" id="Author-text"/>
                                        <form:errors cssStyle="color:#D8000C" path="author"></form:errors>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-2">
                                <div class="row">
                                    <div class="col col-lg-6">
                                        <i class="fas fa-upload"></i>
                                        <form:label path="publisher" for="publisher-text" class="col-form-label"><h6>Publisher<span class = "caret"></span><sup style="color: red;">*</sup></h6></form:label>

                                        <form:select path="publisher" name="publisher" class="form-control " id="publisher-text">
                                            <option value="1">Pearson Longman</option>
                                            <option value="2">Cambridge University Press</option>
                                            <option value="3">Penguin Books</option>
                                            <option value="4">Westland Books</option>
                                            <option value="5">Amar Publishers</option>
                                            <option value="6">Jaico Books</option>
                                        </form:select>
                                        <form:errors cssStyle="color:#D8000C" path="publisher"></form:errors>
                                    </div>
                                    <div class="col col-lg-6">
                                        <i class="fas fa-tag"></i>
                                        <form:label path="category" for="category-text" class="col-form-label fst-normal"><h6>Category<sup style="color: red;">*</sup></h6></form:label>
                                        <form:input path="category" type="text" class="form-control" id="category-text"/>
                                         <form:errors cssStyle="color:#D8000C" path="category"></form:errors>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-2">
                                <div class="row">
                                    <div class="col col-lg-6">
                                        <i class="fas fa-plus-square"></i>
                                        <form:label path="count" for="count-text" class="col-form-label"><h6>Count<sup style="color: red;">*</sup></h6></form:label>
                                        <form:input path="count" type="number" class="form-control" id="count-text"/>
                                        <form:errors cssStyle="color:#D8000C" path="count"></form:errors>
                                    </div>
                                    <div class="col col-lg-6">
                                        <i class="fas fa-calendar-alt"></i>
                                        <form:label path="printYear" for="print-year-text" class="col-form-label fst-normal"><h6>Print-Year<sup style="color: red;">*</sup></h6></form:label>
                                        <form:input type="text" path="printYear" class="form-control" id="print-year-text"/>
                                    	<form:errors cssStyle="color:#D8000C" path="printYear"></form:errors>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer justify-content-center">
                        <button type="submit" class="btn">Add Book</button>
                    </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

        <div class="content" id="content">
            <div class="mid justify-content-center">
                <div class="lbl">Issue History</div>
                <div class="sort">
                    <h4>Sort By</h4>
                    <form>
                        <select class="form-select mr" aria-label="Default select example">
                            <option selected value="1">Fine</option>
                            <option value="2">Issue Date</option>
                            <option value="3">Return Date</option>
                            <option value="4">Book-Title</option>
                            <option value="5">Member-Id</option>
                          </select>
                        <select class="form-select" aria-label="Default select example">
                            <option selected value="1">Ascending</option>
                            <option value="2">Descending</option>
                          </select>
                        <button type="submit"><i class="fa fa-sort"></i></i></button>
                    </form>
                </div>
                <table class="req table table-striped table-hover">
                    <thead class="thd">
                        <tr>
                            <th scope="col">Member ID</th>
                            <th scope="col">Issue ID</th>
                            <th scope="col">Book ID</th>
                            <th scope="col">Title</th>
                            <th scope="col">Username</th>
                            <th scope="col">Issue Date</th>
                            <th scope="col">Return Date</th>
                            <th scope="col">Status</th>
                            <th scope="col">Fine</th>
                        </tr>

                    </thead>

                    <tbody class="tbd">


                       
                    </tbody>

                </table>

                <nav class="pagination-outer" aria-label="Page navigation">
                    <ul class="pagination">
                        <li class="page-item">
                            <a href="#" class="page-link" aria-label="Previous">
                                <span aria-hidden="true">� Previous</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item active"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item">
                            <a href="#" class="page-link" aria-label="Next">
                                <span aria-hidden="true">Next �</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/adminDB.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/issuehistory.js"></script>
        <script src="${pageContext.request.contextPath}/js/adminDB.js"></script>

<c:choose>
	<c:when test="${not empty exists}">
	<script>
		document.getElementById("myForm").classList.remove("d-none");
		document.getElementById("myForm").classList.add("d-block")
		document.getElementById("sidebar").classList.add("blurred");
		document.getElementById("content").classList.add("blurred");
	</script>
	</c:when>
	<c:when test="${not empty error}">
	<script>
	document.getElementById("myForm").classList.remove("d-none");
	document.getElementById("myForm").classList.add("d-block");
	document.getElementById("sidebar").classList.add("blurred");
	document.getElementById("content").classList.add("blurred");
	</script>
	</c:when>

	<c:when test="${not empty saved}">
	<script>
	alert("Data Saved Successfully")
	</script>
	</c:when>
</c:choose>
</body>

</html>