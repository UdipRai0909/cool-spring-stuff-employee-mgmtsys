<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
<link href="${contextPath}/css/main.css" rel="stylesheet">
</head>
<body>
	<h1 align="center">Employees List</h1>
	<table id="t02">
		<tr>
			<th><a href="${contextPath}/create">Add New employee</a></th>

			<th><a href="#">..................</a></th>
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
				<tr style="padding-left : 15px;">
					<td>${employee.id}</td>
					<td>${employee.firstName}</td>
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
		<br />


	</form:form>
	<div class="container">

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>

			<h2>
				${contextPath} *Welcome ${pageContext.request.userPrincipal.name} |
				<a onclick="document.forms['logoutForm'].submit()"><button>Logout</button></a>
			</h2>

		</c:if>
	</div>
</body>
</html>