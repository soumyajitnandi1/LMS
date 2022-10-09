<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDB.css">
    <link href="${pageContext.request.contextPath}/css/modalForms.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/3480789ff2.js" crossorigin="anonymous"></script>
</head>

<body>
    <nav class="navbar navbar-dark p-md-2" id="nav">
        <div id='title'>
            <a class="navbar-brand title" style="
            font-size: 30px;" href="#">
                <i class="fas fa-book-open" style="margin-right: 5px"></i>

                <b id="brand" style="font-size: 28px">Library Management System</b>
            </a>
        </div>
        <div id="db-name" style="color: #fff; font-size: 24px;">
            <b>User Dashboard <i class="fa fa-user"></i></b>
        </div>
        <div class="logout">
            <a href="${pageContext.request.contextPath }/logout">Logout<i style="margin-left: 24px;" class="fa fa-sign-out"></i></a>
        </div>
    </nav>

    <div class="main">
        <div class="sidebar">
            <ul class="sidebar-nav">
                <li>
                    <a href="${pageContext.request.contextPath }"><i class="fa fa-home"></i>Home</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/catalogue"><i class="fa fa-book-open"></i>Catalog</a>
                </li>
                <li>
                    <a class="text white" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-folder-plus"></i>Request New Book</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-cookie-bite"></i></i>My Issue History</a>
                </li>
                <div class="logout-side">
                    <a href="${pageContext.request.contextPath }/logout"><i class="fa fa-sign-out"></i>Logout</a>
                </div>
            </ul>
        </div>
        <div class="content">
            lorem<i class="fa-solid fa-file-chart-column"></i>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-white" id="exampleModalLabel">Make Request</h4>

                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="mb-2">
                                <i class="fas fa-book fa-1x"></i>
                                <label for="recipient-name" class="col-form-label"><h6>Book Name<sup style="color: red;">*</sup></h6></label>
                                <input type="text" class="form-control" id="recipient-name">
                            </div>
                            <div class="mb-2">
                                <i class="fas fa-user"></i>
                                <label for="Author-text" class="col-form-label"><h6>Author<sup style="color: red;">*</sup></h6></label>
                                <input type="text" class="form-control" id="Author-text">
                            </div>

                            <div class="mb-2">
                                <i class="fas fa-upload"></i>
                                <label for="publisher-text" class="col-form-label"><h6>Publisher<sup style="color: red;">*</sup></h6></label>

                                <select name="publisher" class="form-control" id="publisher-text">
                      <option value="Pearson">Pearson</option>
                      <option value="Reed Elsevier">Reed Elsevier</option>
                      <option value="ThomsonReuters">	ThomsonReuters</option>
                      <option value="Wolters Kluwer">Wolters Kluwer</option>
                    </select>
                            </div>

                            <div class="mb-2">
                                <i class="fas fa-info-circle"></i>
                                <label for="description-text" class="col-form-label fst-normal"><h6>Description</h6></label>
                                <textarea class="form-control" id="description-text"></textarea>
                            </div>



                        </form>
                    </div>
                    <div class="modal-footer justify-content-center">

                        <button type="button" class="btn">Send Request</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html>