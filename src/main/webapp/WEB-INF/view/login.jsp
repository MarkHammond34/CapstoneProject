<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="resources/css/custom.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: right;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.active {
	background-color: #000000;
}

div.navbar-header {
	text-color: white;
}

footer {
	background-color: #000000;
	position: fixed;
	bottom: 0;
	left: 0;
	right: 0;
	height: 35px;
	text-align: center;
	color: #CCC;
}

footer p {
	padding: 10.5px;
	margin: 0px;
	line-height: 100%;
}

div.container {
	margin-left: 400px;
	margin-top: 300px;
	text-color: white;
	background-color: grey;
	margin-top: 300px;
}
</style>

</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<h1 style="color: white;">
					<img src="resources/images/logo.png"
						alt="U-ListIt Logo" style="margin-bottom: 5px">
					U-ListIt
				</h1>
			</div>

			<ul class="nav navbar-inverse">
				<li class=""><a href="home">Home</a></li>
				<li class="active"><a href="login">Login</a></li>
				<li class=""><a href="registration">Register</a></li>
			</ul>

		</div>
	</nav>
	<div style="margin: 2% 33% 5% 33%">
		<form class="form-horizontal blacktext" action="loginUser"
			method="post">
			<div class="form-group">
				<label for="inputEmail" class="col-lg-10 blacktext">Email</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="email"
						value="${email}" placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-lg-10  blacktext">Password</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" name="password"
						placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-1.5">
					<button type="submit" class="btn btn-default">Login</button>
					<a href="/reset" class="btn btn-default">Forgot Password</a> <a
						href="email" class="btn btn-default">Unlock</a>
				</div>
			</div>
			<div class="form-group blacktext">
				<p style="text-align: center" class="blacktext">${message}</p>
			</div>
		</form>
	</div>
	<footer>
		<p>
			&copy; 2017<a style="color: #ffffff; text-decoration: none;" href="#">
				U-ListIt</a>, All rights reserved 2018.
		</p>
	</footer>
</body>
</html>