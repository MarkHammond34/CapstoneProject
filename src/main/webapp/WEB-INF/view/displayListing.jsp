<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<spring:url value="resources/css/uikit.css" var="uikitCSS" />
<spring:url value="resources/js/uikit.js" var="uikitJS" />
<spring:url value="resources/js/jquery.js" var="jquery" />
<spring:url value="resources/js/uikit-icons.js" var="uikiticons" />
<link href="${uikitCSS}" rel="stylesheet" />
<script type="text/javascript" src="${uikitJS}"></script>
<script type="text/javascript" src="${jquery}"></script>
<script type="text/javascript" src="${uikiticons}"></script>
<style>
@import "http://fonts.googleapis.com/css?family=Roboto:300,400,500,700";

.container {
	margin-top: 20px;
}

.mb20 {
	margin-bottom: 20px;
}

hgroup {
	padding-left: 15px;
	border-bottom: 1px solid #ccc;
}

hgroup h1 {
	font: 500 normal 1.625em "Roboto", Arial, Verdana, sans-serif;
	color: #2a3644;
	margin-top: 0;
	line-height: 1.15;
}

hgroup h2.lead {
	font: normal normal 1.125em "Roboto", Arial, Verdana, sans-serif;
	color: #2a3644;
	margin: 0;
	padding-bottom: 10px;
}

.search-result .thumbnail {
	border-radius: 0 !important;
}

.search-result:first-child {
	margin-top: 0 !important;
}

.search-result {
	margin-top: 20px;
}

.search-result .col-md-2 {
	border-right: 1px dotted #ccc;
	min-height: 140px;
}

.search-result ul {
	padding-left: 0 !important;
	list-style: none;
}

.search-result ul li {
	font: 400 normal .85em "Roboto", Arial, Verdana, sans-serif;
	line-height: 30px;
}

.search-result ul li i {
	padding-right: 5px;
}

.search-result .col-md-7 {
	position: relative;
}

.search-result h3 {
	font: 500 normal 1.375em "Roboto", Arial, Verdana, sans-serif;
	margin-top: 0 !important;
	margin-bottom: 10px !important;
}

.search-result h3>a, .search-result i {
	color: #248dc1 !important;
}

.search-result p {
	font: normal normal 1.125em "Roboto", Arial, Verdana, sans-serif;
}

.search-result span.plus {
	position: absolute;
	right: 0;
	top: 126px;
}

.search-result span.plus a {
	background-color: #248dc1;
	padding: 5px 5px 3px 5px;
}

.search-result span.plus a:hover {
	background-color: #414141;
}

.search-result span.plus a i {
	color: #fff !important;
}

.search-result span.border {
	display: block;
	width: 97%;
	margin: 0 15px;
	border-bottom: 1px dotted #ccc;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listing Results</title>
</head>
<body>
	<%--Nav Bar--%>
	<div class="uk-position-relative">
		<div class="uk-position-relativetop">
			<nav class="uk-navbar-container uk-navbar-dark" uk-navbar>
			<div class="uk-navbar-left">
				<ul class="uk-navbar-nav">
					<li><a href="/">Home</a></li>
					<li><a
						href="${pageContext.request.contextPath}/displayListing">View
							Listings</a></li>
					<li><a href="${pageContext.request.contextPath}/createListing">Create
							Listing</a></li>
					<li>
						<div class="uk-margin">
							<form class="uk-search uk-search-default" method="POST"
								action="search">
								<span uk-search-icon></span> <input class="uk-search-input"
									type="search" placeholder="Search..." name="search">
							</form>
						</div>
					</li>
				</ul>
			</div>
			<div class="uk-navbar-right">
				<ul class="uk-navbar-nav">
					<li><a>Welcome user</a></li>
					<li><a href="#">Logout</a></li>
				</ul>
			</div>
			</nav>
		</div>
	</div>
	<div class="container">
		<form method="POST" action="displayListingByCategory">
			<div class="row">
				<div class="col-xs-6">
					<div class="input-group">
						<span class="input-group-addon">Category </span> <select
							class="form-control" id="categorytype" name="category">
							<option value="" disabled selected>Select Category</option>
							<option value="apparel">Apparel</option>
							<option value="books">Books</option>
							<option value="furnature">Furnature</option>
							<option value="supplies">School Supplies</option>
							<option value="technology">Technology</option>
						</select>
					</div>
				</div>
				<div class="col-xs-6">
					<div class="row">
						<h2>
							<button type="submit" class="btn btn-labeled btn-success">
								<span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span>Submit
							</button>
							<br />
						</h2>
					</div>
				</div>
			</div>
		</form>
		<c:if test="${listings != null}">
			<div class="container">


				<hgroup class="mb20">
				<h1>Results</h1>
				<h2 class="lead">
					<strong class="text-danger">${listings.size()}</strong> results
					were found for the search for <strong class="text-danger">${category}</strong>
				</h2>
				</hgroup>

				<c:forEach var="listings" items="${listings}">

					<section class="col-xs-12 col-sm-6 col-md-12"> <article
						class="search-result row">
					<div class="col-xs-12 col-sm-12 col-md-3">
						<a href="#" title="Lorem ipsum" class="thumbnail"><img
							src="<%=request.getContextPath()%>/resources/img/listings/${listings.image_path}"
							alt="Listing" height="140" width="250" /></a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2">
						<ul class="meta-search">
							<li><i class="glyphicon glyphicon-user"></i> <span>${user.username}</span></li>
							<li><i class="glyphicon glyphicon-usd"></i> <span>${listings.price}
							</span></li>
							<li><i class="glyphicon glyphicon-map-marker"></i> <span>Insert
									Location Here</span></li>
						</ul>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
						<h3>
							<a href="#" title="">${listings.name}</a>
						</h3>
						<p>${listings.description}</p>
						<span class="plus"><a href="#" title="Lorem ipsum"><i
								class="glyphicon glyphicon-plus"></i></a></span>

					</div>
					<span class="clearfix borda"></span> </article> </section>
				</c:forEach>
			</div>
		</c:if>
	</div>
</body>
</html>