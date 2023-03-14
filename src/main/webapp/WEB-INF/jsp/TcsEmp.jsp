<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- FINAL PRODUCT -->


<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>




<style>
#addEmp {
	width: 150px;
	height: 40px;
	background-color: black;
	transition: 0.3s;
}

#addEmp:hover {
	border-color: white;
	border-radius: 13px;
}

#empLink {
	font-size: 15px;
	color: white;
	text-decoration: none;
	font-family: monospace;
}

#noDesigBtn {
	position: absolute;
	left: 98%;
	top: 1%;
	width: 60px;
	height: 40px;
	background-color: black;
	color: white;
	border: 1px solid white;
	transition: 0.3s;
}

#noDesigBtn:hover {
	background-color: white;
	color: black;
	border: 2px solid black;
}
</style>


<!-- NAB BAR -->
<nav class="navbar bg-primary">
	<div class="container-fluid ">
		<span class="navbar-brand mb-0 h1" style="color: white;">TCS
			</span>
	</div>
</nav>


<div id="handler">
		<!-- 	<h5 class="card-title">Select the Company</h5> -->
			<!-- Example single danger button -->
			<div class="btn-group">
				<button type="button" class="btn btn-danger dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false"><span>select</span></button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item"
						href="http://localhost:8080/SpringMVCPagination/tcsEmp">TCS</a></li>
					<li><a class="dropdown-item" href="http://localhost:8080/SpringMVCPagination/viewemp">Delta Technologies</a></li>
					<li><a class="dropdown-item" href="http://localhost:8080/SpringMVCPagination/delioteEmp">Deliote</a></li>
					<li><a class="dropdown-item" href="#"> Google </a></li>
					<li><a class="dropdown-item" href="#">Microsoft</a></li>
				</ul>
			</div>


</div>
<!-- EMPLOYEE TABLE -->

<table class="table table-hover " style="margin-top: 20px;">
	<thead>
		<tr>
			<th>Employee Code</th>
			<th>Name</th>
			<th>Salary</th>
			<th>Designation</th>
			<th>Edit</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="emp" items="${tcslist}">
			<tr>
				<td>${emp.id}</td>
				<td>${emp.name}</td>
				<td>${emp.salary}</td>
				<td>${emp.designation}</td>
				<td><a href="editTcs/${emp.id}"><i
						class="bi bi-pencil-square"></i></a></td>
				<td><a href="deleteTcs/${emp.id}"><i
						class="bi bi-trash3-fill" style="color: red;"></i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<br />


<!-- MODAL TO ADD EMPLOYEE TO DATABASE -->

<!-- Button modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal"
	data-bs-target="#exampleModal">Add Employee</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="myForm" method="post" action="saveTcs" name="tcsForm">
					<div class="mb-3">
						<label for="name" class="form-label">Name</label> <input
							type="text" class="form-control" id="name" name="name">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Designation</label> <input
							type="text" class="form-control" id="salary" name="salary">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">salary</label> <input
							type="text" class="form-control" id="designation"
							name="designation">
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>
</div>


<!-- HANDLER FOR THE MODAL  -->
<script>
$(document).ready(function() {
	  $('#tcsForm').submit(function(event) {
	    event.preventDefault();
	    var name = $('#name').val();
	    var designation = $('#designation').val();
	    var salary = $('#salary').val();
	    $.ajax({
	      url: 'save',
	      type: 'POST',
	      data: {
	        'name': name,
	        'designation': designation,
	        'salary':salary
	      },
	      success: function(response) {
	    	  window.location.href = "http://localhost:8080/SpringMVCPagination/tcsEmp";
	      }
	    });
	  });
	});
</script>

