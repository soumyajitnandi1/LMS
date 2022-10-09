$(document).ready(function() {
    console.log(user)
    
})



if (window.innerWidth <= 1200) {
    document.getElementById("brand").innerText = "LMS"
}
window.addEventListener(("resize"), () => {
    if (window.innerWidth <=1200) {
        document.getElementById("brand").innerText = "LMS"
    } else {
        document.getElementById("brand").innerText = "Library Management System"

    }
})


var name = user

$('.count').hide();
$('.add').hide();

$('.view').on('click', function() {
    $('.count').toggle();
    $('.add').toggle();
    $('.update').on('click', function() {
        $('.update').toggle();
        $('.disable').toggle();
        $('.add').toggle();
        $('.count').toggle(); 
        /*$('.add').on('click',function(){
            $('.update').show();
        $('.disable').show();
        $('.add').hide();
        $('.count').hide();
        })*/
    })
})



/*
var _html = ""
for (let i = 0; i < 10; i++) {

    _html += '<div class="card col-xl-2 col-lg-2 col-md-3 col-sm-5 col-xs-4 mx-2">'
    _html += '<div class="card-img-div">'
    _html += '<img src="../lms/assets/img/logo.png" class="img-fluid mx-auto mb-auto mt-auto">'
    _html += '</div>'

    _html += '<div class="card-body text-center">'
    _html += '<h5 class="card-title">Card title</h5>'
    _html += '<p class="card-text">Anjali Jain</p>'
    _html += '<button type="button" class="btn btn-dark btn-sm view" data-bs-toggle="modal" data-bs-target="#exampleModal">View</button>'
    _html += ' </div>'
    _html += '</div>'

}

*/


//$('.card-row').empty().html(_html);


//dynamically rendering model

//var model = ""

//   model+='<div class="modal-content">'
//   model+= '<div class="modal-header">'
//   model+=   '<h5 class="modal-title" id="exampleModalLabel">Book Details</h5>'
//   model+=    '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>'
//   model+= '</div>'
//   model+=  '<div class="modal-body">'

//   model+=   '<div class="row">'
//   model+=     '<div class="col-4">'
//   model+=     '<p class="text-center"><i class="fas fa-book fa-4x" style="color: indianred;"></i></p>'
//   model+=      '</div>'

//   model+=     '<div class="col-8">'
//   model+=      '<ul class="p-0" style="list-style: none;">'
//   model+=         '<li>Book Name </li>'
//   model+=         '<li>Book Name </li>'
//   model+=         '<li>Book Name </li>'
//   model+=         '<li>Book Name </li>'
//   model+=       '</ul>'
//   model+=        '<h2>'
//   model+=          '<span class="badge text-dark p-0">v52gs1</span>'
//   model+=        '</h2>'
//   model+=      '</div>'
//   model+=    '</div>'
//   model+= '</div>'

//   model+= '<div class="modal-footer justify-content-center">'

/*
if (name == "admin") {

    
    model += '<button type="button" class="btn btn-outline-warning waves-effect mx-3 update">Update Count</button>'
    model+='<input type="number" name="count" class="count text-center">'
    model += '<button type="button" class="btn btn-outline-success waves-effect mx-3 add">Add</button>'
    model += '<button type="button" class="btn btn-outline-danger waves-effect mx-3 disable">Disable</button>'
} else {
    model += '<button type="button" class="btn btn-outline-success waves-effect mx-3">Borrow</button>'
}

*/

//   model+= '</div>'
//   model+='</div>'
//   model+= '</div>'
//   model+='</div>'





