<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css"
	crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/css/catelogue.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/navbar.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/footer.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/page.css"
	rel="stylesheet" />
<title>Catalog</title>
</head>

<body>
	<div>
		<nav class="navbar navbar-expand-lg navbar-dark" id="nav">
			<div class="container">
				<a class="navbar-brand" href="${pageContext.request.contextPath}">
					<i class="fa fa-book-open" style="margin-right: 5px;"></i> <b
					id="brand">Library Management System</b>
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav">
					<span class="navbar-toggler-icon text-success"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end"
					id="navbarNav">
					<ul id="nav-list"
						class="navbar-nav justify-content-center p-2 navItem">
						<li class="nav-item"><a class="nav-link item"
							href="${pageContext.request.contextPath}">Home</a></li>
						<li class="nav-item "><a class="nav-link item" href="#">About</a>
						</li>
						<c:set var="session" value="${session}"></c:set>
						<c:choose>
							<c:when test='${fn:contains(session, "admin") }'>
								<c:set var="url" value="adminDB"></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="url" value="userDB"></c:set>
							</c:otherwise>
						</c:choose>
						<li class="nav-item"><a class="nav-link item" href="${url }">
								Dashboard </a></li>

						<li class="nav-item"><a class="nav-link item" href="#">Books</a>
						</li>
						<li class="nav-item"><a class="nav-link item" href="login">Login</a>
						</li>

					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div>
		<h2
			style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;"
			class="text-center mt-4 tag">Book Catalog</h2>
	</div>

	<div class="search-sort-container container ">
		<div class="search-books">
			<h5>Search By</h5>
			<form>
				<label class="hrz"><b>Search By</b></label> <select
					class="form-select mr" aria-label="Default select example">
					<option selected value="1">Book-Title</option>
					<option value="2">Member-Title</option>
					<option value="3">Issue-Id</option>
					<option value="4">Issue Date</option>
				</select> <input type="text" class="form-control" placeholder="search"
					name="search">
				<button type="submit">
					<i class="fa fa-search" aria-hidden="true"></i>
				</button>
			</form>
		</div>
		<div class="sort-books">
			<h5>Sort By</h5>
			<form>
				<label class="hrz"><b>Sort By </b></label> <select
					class="form-select mr" aria-label="Default select example">
					<option selected>Fine</option>
					<option value="1">Issue Date</option>
					<option value="2">Return Date</option>
				</select> <select class="form-select" aria-label="Default select example">
					<option selected value="1">Ascending</option>
					<option value="2">Descending</option>
				</select>
				<!-- <button type="submit"><i class="fa fa-sort"></i></button> -->
			</form>
		</div>

	</div>


	<div class="container mt-5 mb-5">

		<div class="container mb-2">

            <div class="card-deck g-3">
                <div class="row card-row justify-content-center">
				
                    <!-- dynamically rendering Book cards    -->
					
					
					
					<c:forEach items="${books}" var="book">
							<div class="card col-xl-2 col-lg-2 col-md-3 col-sm-5 col-xs-4 mx-2">
								<div class="card-img-div">
									<img src="${pageContext.request.contextPath }/assets/img/logo.png" class="img-fluid mx-auto mb-auto mt-auto">
								</div>

								<div class="card-body text-center">
								
									<h5 class="card-title">${book.getTitle()}</h5>
									<p class="card-text">${book.getAuthor()}</p>
									
									<c:set var="id" value="#B${book.getBookId()}" ></c:set>
									
									<button type="button" class="btn btn-dark btn-sm view" data-bs-toggle="modal" data-bs-target="${id}">View</button>
									
								</div>
							</div>

					</c:forEach>
					
					
					
					
					 <!-- dynamically rendering Book cards    -->
                </div>
            </div>
        </div>

		
		<!-- dynamically rendering Modals   -->
		
		
		
		<c:forEach items="${books}" var="book">
			<c:set var="bid" value="B${book.getBookId()}" ></c:set>
		
				<div class="modal fade right" id="${bid}" tabindex="-1" role="dialog" data-backdrop="true">
					<div class="modal-dialog ">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title text-white" id="exampleModalLabel">Book Details</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-4">
										<p></p>
										<p class="text-center">

											<i class="fas fa-book fa-4x" style="color:#1e6591;"></i>
										</p>
									</div>

									<div class="col-8">
										<ul class="p-0" style="list-style: none;">
											<li>${book.getTitle()}</li>
											<li>${book.getAuthor()}</li>
											<li>${book.getCategory()}</li>
											<li>${book.getPrintYear()}</li>
										</ul>
										<h2>
											<span class="badge text-dark p-0">${book.getCount()}</span>
										</h2>
									</div>
								</div>
							</div>

							<div class="modal-footer justify-content-center">
							
							
								<c:choose>
									<c:when test='${fn:contains(session, "admin") }' >
										<button type="button" class="btn btn-outline-warning waves-effect mx-3 update">Update Count</button>
										<form:form action="updateBookCount" method="post" modelAttribute="updateBook">
										<form:hidden path="bookId" value="${book.getBookId()}"/>
										<form:input type="number" path="count" class="count text-center"/>
										<button type="submit" class="btn btn-outline-success waves-effect mx-3 add">Update</button>
										</form:form>
										<button type="button" class="btn btn-outline-danger waves-effect mx-3 disable">Disable</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-outline-success waves-effect mx-3">Borrow</button>
									</c:otherwise>
								</c:choose>
							</div>
						</div>

					</div>
				</div>
			

		</c:forEach>
			
			<!-- dynamically rendering Modals   -->

	

		


    <nav class="pagination-outer" aria-label="Page navigation">
        <ul class="pagination">
            <li class="page-item">
                <a href="#" class="page-link" aria-label="Previous">
                    <span aria-hidden="true">« Previous</span>
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item active"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item">
                <a href="#" class="page-link" aria-label="Next">
                    <span aria-hidden="true">Next »</span>
                </a>
            </li>
        </ul>
    </nav>
  </div>

    <!-- overlay button -->
    <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-arrow-up arrow" aria-hidden="true"></i></button>
    <!-- overlay button -->

    <div class="ftr">

    </div>
<script>
  var user=[];
  user="${session}";

</script>
			
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/catelogue.js"></script>
<script src="${pageContext.request.contextPath}/js/navbar.js"></script>
<script src="${pageContext.request.contextPath}/js/footer.js"></script>
<script src="${pageContext.request.contextPath}/js/topbtn.js"></script>

</html>



