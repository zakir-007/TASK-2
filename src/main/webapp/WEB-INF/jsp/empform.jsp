<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
</head>

<style>
	#crd{
	margin-top: 20px;
	margin-left: 20px;
	box-shadow: 1px 1px 1px 1px #D4D4D4
	}
	#btn{
	width: 60px;
	height: 30px;
	background-color: black;
	color: white;
	margin-top: 6px;
	transition: 0.3s;
	}
	#btn:hover{
	background-color: white;
	color: black;
	
	}
</style>

       
       <!-- Nav Bar -->
<nav class="navbar bg-dark">
	<div class="container-fluid ">
		<span class="navbar-brand mb-0 h1" style="color: white;">Add Employess
			</span>
	</div>
</nav>
       
       
       <div class="card" style="width: 28rem;" id="crd">
  		<div class="card-body">
   		<h4 class="card-title">Add Employee</h4>
       <form:form method="post" action="save">  
      	<table >  
         <tr>  
          <td>Name : </td> 
          <td><form:input path="name"  /></td>
         </tr>  
         <tr>  
          <td>Salary :</td>  
          <td><form:input path="salary" /></td>
         </tr> 
         <tr>  
          <td>Designation :</td>  
          <td><form:input path="designation" /></td>
         </tr> 
         <tr>  
          <td> </td>  
          <td><input type="submit" value="Save" / id="btn"></td>  
         </tr>  
        </table>  
       </form:form>  
      </div>
      </div>
       
       
       
