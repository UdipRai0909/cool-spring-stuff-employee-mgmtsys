<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/custom.css" rel="stylesheet">
<link href="/css/main.css" rel="stylesheet">
</head>
<body>
	<h1 align="center">Employees List</h1>
	<table id="t02">
		<tr>
			<th><a href="/create">Add New employee</a></th>

			<th><a href="/deleteemployee">Delete employees</a></th>
		</tr>
	</table>
	<table>


	</table>

	<form:form class="form-horizontal">
		<table id="t01">
			<tr>
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
				<tr>
					<td>${employee.id}</td>
					<td>${employee.firstName}</td>
					<td>${employee.lastName}</td>
					<td>${employee.sex}</td>
					<td>${employee.createdAt}</td>
					<td>${employee.email}</td>
					<td>${employee.section}</td>
					<td>${employee.country}</td>


					<td><a href="/editemployee/${employee.id}">Edit</a></td>
					<td><a href="/deleteemployee/${employee.id}">Delete</a></td>
				</tr>
			</c:forEach>


		</table>
		<br />


	</form:form>
</body>
</html>