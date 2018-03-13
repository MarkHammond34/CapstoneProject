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
.uk-panel {
	border: 0;
	min-height: 200px;
	max-height: 600px;
}

#offer-card {
	padding-top: 10%;
}
</style>
</head>
<body style="background-color: rgba(36, 143, 203, 0.12);">

	<div class="uk-section" uk-height-viewport="expand: true">

		<div class="uk-cover-container" style="background-color: white;">
			<canvas width="400" height="200"></canvas>
			<h1 class="uk-heading-primary">Welcome ${user.firstName}</h1>
		</div>

	</div>

	<div class="uk-section">

		<div class="uk-container uk-container-expand">
			<div class="uk-grid-small" uk-grid>
				<div class="uk-width-1-3@m">
					<div
						class="uk-background-secondary uk-padding-small uk-border-rounded">
						<ul class="uk-nav uk-nav-default"
							uk-switcher="connect: #seller-content; animation: uk-animation-fade; toggle: > :not(.uk-nav-header)">
							<li><a href="#">Item</a></li>
							<li><a href="#">Item</a></li>
						</ul>
					</div>
				</div>
				<div class="uk-width-2-3@m">

					<!-- Begin content switcher -->
					<ul id="seller-content" class="uk-switcher">

						<!-- 1st set of content -->
						<li>
							<div
								class="uk-panel uk-panel-scrollable uk-resize-vertical uk-height-large uk-padding-remove uk-background-secondary uk-border-rounded">
								<ul class="uk-nav uk-nav-default uk-child-width-1-3@m" uk-grid>
									<c:forEach var="listing" items="${listings}">
										<li class="uk-padding-small"><div
												class="uk-panel uk-width-auto">
												<a
													href="${pageContext.request.contextPath}/listing?listingId=${listing.id}"><img
													height="auto" width="85%"
													class="uk-border-rounded uk-box-shadow-hover-large"
													src="${pageContext.request.contextPath}/resources/img/listings/Wolverine.jpg"
													alt=""></a>
											</div></li>
									</c:forEach>
								</ul>
							</div>
						</li>

						<!-- 2nd set of content -->
						<li>

							<div
								class="uk-panel uk-panel-scrollable uk-resize-vertical uk-height-large uk-padding-remove uk-background-secondary uk-border-rounded">
								<ul class="uk-nav uk-nav-default uk-child-width-1-3@m" uk-grid>
									<c:forEach var="listing" items="${listings}">
										<li class="uk-padding-small"><div
												class="uk-panel uk-width-auto">
												<a
													href="${pageContext.request.contextPath}/listing?listingId=${listing.id}"><img
													height="auto" width="85%"
													class="uk-border-rounded uk-box-shadow-hover-large"
													src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
													alt=""></a>
											</div></li>
									</c:forEach>
								</ul>
							</div>

						</li>

					</ul>
					<!-- End content switcher -->
				</div>
			</div>
		</div>

	</div>

	<div class="uk-section" uk-height-viewport="expand: true">

		<hr>

		<div class="uk-background-secondary"
			uk-height-viewport="min-height:300">
			<div
				class="uk-grid-small uk-child-width-1-2@m uk-child-width-1-3@l uk-padding-small"
				uk-grid="">

				<%@include file="dashboard/dashboard-offers.jsp"%>
				<%@include file="dashboard/dashboard-meetings.jsp"%>
				<%@include file="dashboard/dashboard-transactions.jsp"%>

			</div>
		</div>

	</div>

</body>
</html>