<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		
		<title>Create an account</title>
		
		<link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
		<link href="${contextPath}/css/styles.css" rel="stylesheet">
	</head>
	
	<body>
		<div class="container col-12">
			<div class="row col-12">
				<div class="card w-100 py-5 my-5">
					<form:form method="POST" modelAttribute="userForm" class="userForm w-100 pb-5" style="margin-left: 25%">

						<div class="form-group w-50 my-5">
						<h2 class="text-center py-5">Sign up</h2>
							<spring:bind path="username">
								<div class="form-group row ${status.error ? 'has-error' : ''}">
									<form:input type="text" path="username" class="form-control p-3" placeholder="Username" autofocus="true"></form:input>
									<form:errors path="username" style="color:red;"></form:errors>
								</div>
							</spring:bind>
						</div>
	
						<div class="form-group w-50 my-5">
							<spring:bind path="password">
								<div class="form-group row ${status.error ? 'has-error' : ''}">
									<form:input type="password" path="password" class="form-control p-3"
										placeholder="Password"></form:input>
									<form:errors path="password" style="color:red;"></form:errors>
								</div>
							</spring:bind>
						</div>
						
						<div class="form-group w-50 my-5 mb-5">
							<spring:bind path="passwordConfirm">
								<div class="form-group row ${status.error ? 'has-error' : ''}">
									<form:input type="password" path="passwordConfirm" class="form-control p-3" placeholder="Confirm your password"></form:input>
									<form:errors path="passwordConfirm" style="color:red;"></form:errors>
								</div>
							</spring:bind>
						</div>
						
						<button class="btn btn-lg btn-primary btn-block w-25 my-5 regsub form-group p-1 my-5" type="submit">Sign up</button>
						
						<h4 class="py-5 w-50 text-center">
							<a href="${contextPath}/login">Already have an account? Login</a>
						</h4>
					</form:form>
				</div>
			</div>
		</div>
	
		<!-- /container -->
		<script src="${contextPath}/js/jquery.js"></script>
		<script src="${contextPath}/js/bootstrap.js"></script>
	</body>
</html>
