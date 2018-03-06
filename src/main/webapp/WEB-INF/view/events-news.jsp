<%--
  Created by IntelliJ IDEA.
  User: saran
  Date: 2/13/18
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ page import="edu.ben.model.User"%>
<%@ page import="java.util.List"%>
<%@ page import="edu.ben.model.Listing"%>

<html>
<head>
<title>Admin Dashboard</title>
<spring:url value="resources/css/uikit.css" var="uikitCSS" />
<spring:url value="resources/js/uikit.js" var="uikitJS" />
<spring:url value="resources/js/jquery.js" var="jquery" />
<spring:url value="resources/js/uikit-icons.js" var="uikiticons" />
<link href="${uikitCSS}" rel="stylesheet" />
<script type="text/javascript" src="${uikitJS}"></script>
<script type="text/javascript" src="${jquery}"></script>
<script type="text/javascript" src="${uikiticons}"></script>

<div class="uk-position-relative">
	<div class="uk-position-relativetop">
		<nav class="uk-navbar-container uk-navbar-dark" uk-navbar>
			<div class="uk-navbar-center">
				<ul class="uk-navbar-nav">
					<li class="uk-active"><a
						href="${pageContext.request.contextPath}/admin">Dashboard</a></li>
					<li><a href="${pageContext.request.contextPath}/adminUser">Manage
							Users</a></li>
					<li><a href="${pageContext.request.contextPath}/adminListing">Manage
							Listings</a></li>
					<li><a href="${pageContext.request.contextPath}/adminDisputes">Manage
							Disputes</a></li>
					<li><a href="${pageContext.request.contextPath}/eventsNews">Events/News</a>
					</li>

				</ul>
			</div>
			<div class="uk-navbar-right">
				<ul class="uk-navbar-nav">
					<li><a>Welcome ${user.firstName}</a></li>
					<li><a href="${pageContext.request.contextPath}/">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/logout">Logout</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
</div>
</head>
<body>
	<div class="uk-cover-container uk-height-viewport">

		<div class="form-area">
			<form method="POST" class="uk-grid-large"
				onsubmit="return validateForm()" action="createEvent"
				name="createEvent" uk-grid>
				<br style="clear: both">

				<div uk-grid>
					<div class="uk-width-1-3"></div>
					<div class="uk-width-1-3">
						<strong>Title</strong> <input type="text" class="uk-input"
							id="titleId" name="title" placeholder="Title"> <span
							class="val_error" id="title_error"></span>
					</div>
				</div>
				<div uk-grid>
					<div class="uk-width-1-3"></div>
					<div class="uk-width-1-3">
						<strong>Location</strong> <input type="text" class="uk-input"
							id="locationId" name="location" placeholder="Location"> <span
							class="location_error" id="location_error"></span>
					</div>
				</div>

				<div uk-grid>
					<div class="uk-width-1-2" id="dateEnd">
						<strong>Start Date</strong><input type="datetime-local"
							class="uk-input" id="startDate" name="startDate"
							placeholder="Start Date">
					</div>
					<div class="uk-width-1-2" id="dateEnd">
						<strong>End Date</strong><input type="datetime-local"
							class="uk-input" id="endDate" name="endDate"
							placeholder="End Date">
					</div>
				</div>
				<div class="uk-width-1-1">
					<strong> Description </strong>
					<textarea class="uk-textarea" type="textarea" name="description"
						id="message" placeholder="Description" maxlength="140" rows="7"></textarea>
					<span class="help-block"><p id="characterLeft"
							class="help-block "></span>
				</div>

				<div class="uk-width-1-1">
					<button type="submit" id="submit" name="submit"
						class="btn btn-primary pull-right">Submit Form</button>
				</div>
			</form>
		</div>

	</div>
</body>
</html>
