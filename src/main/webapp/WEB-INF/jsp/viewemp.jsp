

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
				<td><a href="deleteemp/${emp.id}"><i class="bi bi-trash3-fill" style="color:red;"></i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<br />


<br>



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
	
	
	
	

<div class="row my-5">
	<div class="col-2">
		<div class="dropdown">
			<button class="btn btn-primary dropdown-toggle" type="button"
				data-bs-toggle="dropdown" aria-expanded="false"
				style="font-family: 'Times New Roman', serif;">Emp with no
				designation</button>
			<form:form method="post" id="form">
				<select id="selection" class="dropdown-menu">
					<c:forEach var="emo" items="${unlist_dropdown}">
						<option value="${emo.id}">${emo.name}</option>
					</c:forEach>
				</select>
				<button type="submit" onclick="btn()" id="noDesigBtn">Edit</button>
			</form:form>
		</div>
	</div>
</div>

	
	

<script>


function btn(){
	
	let url = "http://localhost:8080/SpringMVCPagination/editemp/";

	document.getElementById('form').addEventListener('submit', (e) => {
	    e.preventDefault();
	  let selection = document.getElementById('selection').value;
	  console.log(url + selection);
	  window.location.href = url + selection;
	});
}

</script>


