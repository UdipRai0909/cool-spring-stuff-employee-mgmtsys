<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page isELIgnored="false"%>

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
				<div class="card w-100 py-5 bg-gray">
					<h1 class="w-100 text-primary text-info text-center py-3">Edit Form (Employee)</h1><hr>
					<form:form method="POST" modelAttribute="employee" class="w-100 px-5 pt-2 ml-5 mb-5" action="${contextPath}/update/employee">
	
						<div class="form-group row my-4">
							<label class="col-md-3 control-lable" for="id"></label>
							<div class="col-md-7">
								<form:hidden path="id" class="form-control input-sm" />
								<div class="has-error"></div>
							</div>
						</div>
	
						<div class="form-group row my-4">
							<label class="col-md-3 control-lable" for="firstName">First Name</label>
							<div class="col-md-7">
								<form:input type="text" path="firstName" id="firstName"
									class="form-control input-sm" />
								<div class="has-error">
									<form:errors path="firstName" class="help-inline" />
								</div>
							</div>
						</div>
	
						<div class="form-group row my-4">
							<label class="col-md-3 control-lable" for="lastName">Last Name</label>
							<div class="col-md-7">
								<form:input type="text" path="lastName" id="lastName"
									class="form-control input-sm" />
								<div class="has-error">
									<form:errors path="lastName" class="help-inline" />
								</div>
							</div>
						</div>
	
						<div class="form-group row my-4">
							<label class="col-md-3 control-lable" for="sex">Sex</label>
							<div class="col-md-7">
								<form:radiobutton path="sex" value="M" class="form-control float-left" />
								<div class="float-left ml-1">Male</div>
								<form:radiobutton path="sex" value="F" class="form-control float-left ml-5" />
								<div class="float-left ml-1">Female</div>
								<div class="has-error">
									<form:errors path="sex" class="help-inline" />
								</div>
							</div>
						</div>
	
						<div class="form-group row my-4">
							<label class="col-md-3 control-lable" for="email">Email</label>
							<div class="col-md-7">
								<form:input type="text" path="email" id="email" class="form-control input-sm" />
								<div class="has-error">
									<form:errors path="email" class="help-inline" />
								</div>
							</div>
						</div>
	
						<div class="form-group row my-4">
							<label class="col-md-3 control-lable" for="section">Section</label>
							<div class="col-md-7">
								<form:radiobuttons path="section" items="${sections}" class="d-inline-flex pr-3" />
								<div class="has-error">
									<form:errors path="section" class="help-inline" />
								</div>
							</div>
						</div>
	
						<div class="form-group row my-4">
							<label class="col-md-3 control-lable" for="country">Country</label>
							<div class="col-md-7">
								<form:select path="country" id="country"
									class="form-control input-sm">
									<form:option value="">Select Country</form:option>
									<form:options items="${countries}" />
								</form:select>
								<div class="has-error">
									<form:errors path="country" class="help-inline" />
								</div>
							</div>
						</div>
						
						<div class="mt-4">
							<button class="btn btn-lg btn-primary btn-block w-25 my-5 form-group loginsub p-2" type="submit">Edit</button>
						</div>
						
						<h4 class="text-center p-5">
							<a href="${contextPath}/view/employees">Go Back</a>
						</h4>
							
							
					</form:form>
				</div>
			</div>
		</div>
		
	</body>
</html>