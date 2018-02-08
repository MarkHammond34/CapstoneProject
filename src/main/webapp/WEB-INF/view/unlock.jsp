<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Unlock</title>
<link rel="stylesheet" type="text/css" href="resources/css/custom.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<%@include file="jspf/footer.jspf" %>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<h1 style="color: white;">
					<img src="resources/images/logo.png"
						alt="U-ListIt Logo" style="margin-bottom: 5px">
					U-ListIt
				</h1>
			</div>
		</div>
	</nav>
	<div style="margin: 2% 33% 5% 33%">
		<form class="form-horizontal blacktext" action="unlock" method="post">
			<input type="hidden" name="action" value="code" />
			<div style="text-align: center">
				<p class="blacktext">Enter Your Email and Confirmation Code</p>
			</div>
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label blacktext">Email</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="email"
						value="${email}" placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label blacktext">Code</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="code"
						placeholder="Confirmation Code">
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="submit" class="btn btn-default blacktext">Unlock</button>
					<a href="login.jsp" class="btn btn-default blacktext">Cancel</a>
				</div>
			</div>
			<div class="form-group">
				<p style="text-align: center" class="blacktext">
					<i>${message}</i>
				</p>
			</div>
		</form>
	</div>
</body>
</html>