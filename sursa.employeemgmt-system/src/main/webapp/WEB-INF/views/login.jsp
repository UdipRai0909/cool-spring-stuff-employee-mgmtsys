<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		
		<title>Log in with your account</title>
		
		<link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
		<link href="${contextPath}/css/styles.css" rel="stylesheet">
	</head>

	<body>
	
		<div class="container col-12">
			<div class="row col-12">
				<div class="card w-100 py-5 my-5">
					<form:form method="POST" modelAttribute="userForm" class="userForm w-100" style="margin-left: 25%">
						<div class="form-group w-50 my-5 ${error != null ? 'has-error' : ''}">
							<h2 class="text-center py-5">Log in</h2>
							
							<div class="form-group row ${status.error ? 'has-error' : ''}">
								
								<span class="w-100 d-block text-danger text-center">${message}</span> 
								
								<div class="w-100 my-4">
									<input name="username" type="text" class="form-control p-3" placeholder="Username" /> 
								</div>
								
								<div class="w-100 my-4">
									<input name="password" type="password" class="form-control p-3" placeholder="Password" /> 
								</div>

								<span class="w-100 d-block text-danger text-center">${error}</span> 
								
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
							</div>
	
							<div class="mt-4">
								<button class="btn btn-lg btn-primary btn-block w-25 my-5 form-group loginsub p-2" type="submit">Log In</button>
							</div>
							
							<h4 class="text-center p-5">
								<a href="${contextPath}/registration">Create an account</a>
							</h4>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<!-- /container -->
		<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${contextPath}/js/bootstrap.js"></script>
	</body>
	
</html>
