<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Checkout</title>
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<spring:url value="resources/css/uikit.css" var="uikitCSS" />
<spring:url value="resources/js/uikit.js" var="uikitJS" />
<spring:url value="resources/js/jquery.js" var="jquery" />
<spring:url value="resources/js/uikit-icons.js" var="uikiticons" />
<link href="${uikitCSS}" rel="stylesheet" />
<script type="text/javascript" src="${uikitJS}"></script>
<script type="text/javascript" src="${jquery}"></script>
<script type="text/javascript" src="${uikiticons}"></script>
<style type="text/css">
#search {
	padding-top: 2cm;
}
</style>
</head>

<body>

	<%--Nav Bar--%>
	<div class="uk-position-relative">
		<div class="uk-position-relativetop">
			<nav class="uk-navbar-container uk-navbar-transparent" uk-navbar>
			<div class="uk-navbar-left">
				<ul class="uk-navbar-nav">
					<li><a href="${pageContext.request.contextPath}/">Home</a></li>
					<li><a
						href="${pageContext.request.contextPath}/displayListing">View
							Listings</a></li>
					<li><a href="${pageContext.request.contextPath}/createListing">Create
							Listing</a></li>
					<li>
						<div class="uk-margin">
							<form class="uk-search uk-search-default" method="POST"
								action="searchResults">
								<span uk-search-icon></span> <input id="search"
									class="uk-search-input" type="search" placeholder="Search...">
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

	<div class="uk-background-muted">

		<div class="uk-section">
			<div class="uk-container">

				<div class="uk-position-center" id="paypal-button"></div>

			</div>
		</div>

	</div>

	<script>
		paypal.Button
				.render(
						{
							env : 'sandbox', // Or 'production',

							client : {
								sandbox : 'AVGW1RKTj5gyUclN5wBmPk97pGaiTCsnR4AHZZ6QHsjDgraupasf1V8YbxMbKZLiBAJ-BwtkoUmIsfdf',
								production : 'AUTi02B9WEFnsmjxP3XY2p2IljLU5HATmVK5yynF22kD3myoQhcQ7bKx2QF8CjiQRQ8-qyDJfgLwRd1u'
							},

							commit : true, // Show a 'Pay Now' button

							style : {
								color : 'gold',
								size : 'small'
							},

							payment : function(data, actions) {
								/* 
								 * Set up the payment here 
								 */
								return actions.payment.create({
									payment : {
										transactions : [ {
											amount : {
												total : '1.00',
												currency : 'USD'
											}
										} ]
									}
								});
							},

							onAuthorize : function(data, actions) {
								/* 
								 * Execute the payment here 
								 */
								return actions.payment.execute().then(
										function(payment) {

											// The payment is complete!
											// You can now show a confirmation message to the customer
										});
							},

							onCancel : function(data, actions) {
								/* 
								 * Buyer cancelled the payment 
								 */
							},

							onError : function(err) {
								/* 
								 * An error occurred during the transaction 
								 */
							}
						}, '#paypal-button');
	</script>
</body>
</html>