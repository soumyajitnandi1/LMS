<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userIssue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDB.css">
    <!-- <link href="../css/modalForms.css" rel="stylesheet" /> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/3480789ff2.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>My Issues</title>
    <link href="${pageContext.request.contextPath}/css/page.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/srcbar.css">

</head> 
 


<!-- CONTENT -->

 <div class="content">
            <div class="mid justify-content-center">
                <div class="lbl">Issued Books</div>
                <div class="sort">
                    <h4>Sort By</h4>
                    <form>
                        <select class="form-select mr" aria-label="Default select example">
                            <option selected value="1">Status</option>
                            <option value="2">Request Date</option>
                            <option value="3">Book-ID</option>
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
                            <th scope="col">Request ID</th>
                            <th scope="col">Issue ID</th>
                            <th scope="col">Book ID</th>
                            <th scope="col">Title</th>
                            <th scope="col">Issue Date</th>
                            <th scope="col">Due Date</th>
                            <th scope="col">View/Edit</th>
                        </tr>

                    </thead>

                    <tbody class="tbd">


                        <!-- <tr>
                            <td>R12356</td>
                            <td>M5456</td>
                            <td>Harry Potter and the Order of the Phoenix</td>
                            <td>19.02.2022</td>
                            <td><button type="button" class="btn btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Click Here
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>R12756</td>
                            <td>M5459</td>
                            <td>North to Paradise: A Memoir</td>
                            <td>13.02.2022</td>
                            <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Click Here
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>R13379</td>
                            <td>M5156</td>
                            <td>Death in the Sunshine</td>
                            <td>13.02.2022</td>
                            <td>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Click Here
                                </button>
                            </td>
                        </tr>
                    
                        <tr>
                            <td>R15686</td>
                            <td>M456</td>
                            <td>Atomic Habits</td>
                            <td>11.02.2022</td>
                            <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Click Here
                                </button>
                            </td>
                        </tr>  -->

                    </tbody>

                </table>


                <!-- MODAL_CONTENT -->
        <div class="modal fade right" id="exampleModal" tabindex="-1" role="dialog" data-backdrop="true">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-header header">
                        <h5 class="modal-title " id="exampleModalLabel">Request ID : R12356</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h5><b>Issue ID : </b><p>M5456</p></h5>
                        <h5><b>Book ID : </b><p>M5456</p></h5>
                        <h5><b>Book Title : </b><p>Harry Potter and the Order of the Phoenix</p></h5>
                        <h5><b>Issue Date : </b><p>19.02.2022</p></h5>
                        <h5><b>Due Date : </b><p>19.02.2022</p></h5>
                        <h5><b>Status : </b><p>Crossed Deadline</p></h5>
                        <h5><b>Fine : </b><p>5</p></h5>
                        <!-- <div>
                            <h5><b>Book Description : </b></h5>
                            <p>Lorem ipsum dolor sit amet. Qui voluptas impedit in nihil modi sed tenetur soluta sit impedit quam qui autem repellat.
                            Est porro facere qui unde quae et omnis voluptas et omnis laboriosam est dolorem mollitia et animi accusamus. Accusamus
                            porro ab animi tenetur id repellat dignissimos. Et fugit consequuntur qui iusto ducimus non Quis consectetur.</p>
                        </div> -->
                        
                    </div>
        
                    <div class="modal-footer justify-content-center">
					
						<button type="button" class="btn btn-outline-success waves-effect mx-3">Return</button>
						<button type="button" class="btn btn-outline-info waves-effect mx-3">Extend</button>
                    </div>
                </div>
        
            </div>
        </div>

         <!-- MODAL_CONTENT -->


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
        </div>


<!-- CONTENT -->



        <script src="${pageContext.request.contextPath}/js/adminDB.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/userIssue.js"></script>
        

</body>

</html>