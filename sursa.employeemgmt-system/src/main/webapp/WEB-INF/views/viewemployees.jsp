<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
		<link href="${contextPath}/css/styles.css" rel="stylesheet">
	</head>
	
	<body>
		<div class="container col-12">
			<div class="row col-12">
				<div class="card w-100 py-4 bg-gray">
					<h1 class="w-100 text-primary text-info text-center py-3">View Form (Employee)</h1>
					<div class="form-group row">
						<table class="table p-3 mx-5">
							<tr>
								<th class="th01"><a href="${contextPath}/create">Add New employee</a></th>
								<th class="th01 float-right"><a href="#">..................</a></th>
							</tr>
						</table>
					</div>
					
					<form:form class="w-100 px-5">
						<table class="table mt-3">
							<tr class="bg-success text-white">
								<th>Id</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Sex</th>
								<th>Date Modified</th>
								<th>Email</th>
								<th>Section</th>
								<th>Country</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
				
							<c:forEach var="employee" items="${list}">
								<tr class=" bg-white">
									<td>${employee.id}</td>
									<td><a href="${contextPath}/${employee.firstName}/${employee.id}">${employee.firstName}</a></td>
									<td>${employee.lastName}</td>
									<td>${employee.sex}</td>
									<td>${employee.createdAt}</td>
									<td>${employee.email}</td>
									<td>${employee.section}</td>
									<td>${employee.country}</td>
				
				
									<td><a href="${contextPath}/edit/employee/${employee.id}">Edit</a></td>
									<td><a href="${contextPath}/delete/employee/${employee.id}">Delete</a></td>
								</tr>
							</c:forEach>
				
						</table>
					</form:form>
					
					<div class="container col-12">
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<form id="logoutForm" method="POST" action="${contextPath}/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
				
							<h2 class="p-5 pr-5 w-100 text-right">
								 
								 <span style="font-size: 25px;" class="text-info">Context Path = ${contextPath}</span> <br/>
								 <span class="text-success">Welcome ${pageContext.request.userPrincipal.name}</span>
								<a onclick="document.forms['logoutForm'].submit()"><button class="btn btn-danger p-2 mt-3 ml-2">Logout</button></a>
							</h2>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</body>
	
</html>