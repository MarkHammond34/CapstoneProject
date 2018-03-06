<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<spring:url value="resources/js/jquery.js" var="jquery" />
<spring:url value="resources/css/uikit.css" var="uikitCSS" />
<spring:url value="resources/js/uikit.js" var="uikitJS" />
<spring:url value="resources/js/uikit-icons.js" var="uikiticons" />

<link href="${uikitCSS}" rel="stylesheet" />
<script type="text/javascript" src="${jquery}"></script>
<script type="text/javascript" src="${uikitJS}"></script>
<script type="text/javascript" src="${uikiticons}"></script>

<style>
#left-col {
	position: fixed;
	left: 0;
	top: 11%;
	bottom: 0;
	overflow-x: hidden;
	overflow-y: auto;
	background-color: #222;
	width: 260px;
	z-index: 1;
}

.bar-wrap {
	padding: 2rem;
}

#right-col {
	margin-left: 260px;
}
</style>
</head>
<%@include file="jspf/navbar2.jspf"%>
<body style="background-color: rgba(36, 143, 203, 0.08);">

	<aside id="left-col" class="uk-light">
		<div class="bar-wrap">
			<ul class="uk-nav uk-nav-default">
				<li class="uk-active"><a href="#">Active</a></li>
				<li class="uk-parent"><a href="#">Parent</a>
					<ul class="uk-nav-sub">
						<li><a href="#">Sub item</a></li>
						<li><a href="#">Sub item</a></li>
					</ul></li>
				<li class="uk-nav-header">Header</li>
				<li><a href="#"><span class="uk-margin-small-right"
						uk-icon="icon: table"></span> Item</a></li>
				<li><a href="#"><span class="uk-margin-small-right"
						uk-icon="icon: thumbnails"></span> Item</a></li>
				<li class="uk-nav-divider"></li>
				<li><a href="#"><span class="uk-margin-small-right"
						uk-icon="icon: trash"></span> Item</a></li>
			</ul>
		</div>
	</aside>
	<div id="right-col">
		<div class="uk-container uk-margin-medium-top">
			<div class="uk-grid-large uk-child-width-1-3 uk-text-center" uk-grid>


				<c:forEach var="listing" items="${userListings}">
					<%@include file="jspf/profile-listings.jsp"%>
				</c:forEach>



			</div>

		</div>
	</div>
</body>
</html>