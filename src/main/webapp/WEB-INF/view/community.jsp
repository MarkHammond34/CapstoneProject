<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="jspf/navbar.jspf"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Community</title>
</head>
<body>

	<h1>Latest News</h1>

	<h2>Come here for news, updates, and more!</h2>

	<h3>Release 0.1.0</h3>
	<p></p>
	<h3>Upcoming Features</h3>
	<p></p>

	<form method="POST" action="/feedback">
		<table>
			<tr>
				<td><label for="name">Name</label></td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td><label for="contactEmail">Contact email</label></td>
				<td><input type="text" name="contactEmail" /></td>
			</tr>
			<tr>
				<td><textarea name="message" rows="5" cols="30">Enter your message here</textarea>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>
	</form>

</body>
</html>