<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
</head>
<body>

	<spring:url value="/add" var="addURL" />
	<a href="${addURL}">Add user</a>

	<table width="100%" border="1">
		<tr>
			<td>Username</td>
			<td>First Name</td>
			<td>Last Name</td>
			<td>School email</td>
			<td>Password</td>
			<td colspan="2">Action</td>
		</tr>
		<c:forEach items="${list}" var="user">
			<tr>
				<td>${user.username}</td>
				<td>${user.firstName}</td>
				<td>${user.lastName}</td>
				<td>${user.schoolEmail}</td>
				<td>${user.password}</td>
				<td><spring:url value="/update/${user.userID}" var="updateURL" />
					<a href="${updateURL}">Update</a></td>
				<td><spring:url value="/delete/${user.userID}" var="deleteURL" />
					<a href="${deleteURL}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>