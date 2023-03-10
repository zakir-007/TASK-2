

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
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>




<style>
	#addEmp{
	width: 150px;
	height: 40px;
	background-color: black;
	transition: 0.3s;

	}
	#addEmp:hover{
	border-color: white;
	border-radius: 13px;
	}
	
	#empLink{
	font-size: 15px;
	color: white;
	text-decoration: none;
	font-family: monospace;
	}
	

	
</style>


<!-- Nav Bar -->
<nav class="navbar bg-dark">
	<div class="container-fluid ">
		<span class="navbar-brand mb-0 h1" style="color: white;">Employess
			List</span>
	</div>
</nav>


<!--Employee table-->

<table class="table table-hover " style="margin-top: 20px;" >
	<thead>
		<tr>
			<th>Name</th>
			<th>Salary</th>
			<th>Designation</th>
			<th>Edit</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="emp" items="${list}">
			<tr>
				<td>${emp.name}</td>
				<td>${emp.salary}</td>
				<td>${emp.designation}</td>
				<td><a href="editemp/${emp.id}">Edit</a></td>
				<td>><i class="bi bi-trash3-fill" style="color:red;" data-bs-toggle="modal" data-bs-target="#deletemodal"></i></td>
			</tr>
			<!-- Delete Modal -->
			<div class="modal fade" id="deletemodal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>Are you sure you want to delete<p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<a href="deleteemp/${emp.id}"><button type="button"
									class="btn btn-danger">Delete</button></a>
						</div>
					</div>
				</div>
			</div>

		</c:forEach>
	</tbody>
</table>
<br />


<br>

// this button navigate to other page in order to add an employee details 
 
<button id="addEmp"><a href="empform"  id="empLink">Add New Employee</a></button>





<br>


<div class="row">
	<div class="col">
		<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: 'Times New Roman', serif;">
    Employees with designation 
  </button>
 	<select class="dropdown-menu">
	<c:forEach var="emp" items="${list_dropdown}">
		<option value="${emp.name}">${emp.name}</option>
	</c:forEach>
</select>
</div>
	</div>
	<div class="col">
		<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: 'Times New Roman', serif;">
    Emp with no designation 
  </button>
 	<select class="dropdown-menu">
	<c:forEach var="empt" items="${unlist_dropdown}">
		<option value="${empt.name}">${empt.name}</option>
	</c:forEach>
</select>
</div>
	</div>
</div>



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
				<form id="myForm" method="post" action="save" name="myForm">
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
	  $('#myForm').submit(function(event) {
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
	    	  window.location.href = "http://localhost:8080/SpringMVCPagination/viewemp";
	      }
	    });
	  });
	});
</script>
