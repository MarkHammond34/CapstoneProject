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
<%@include file="jspf/header.jsp"%>
<body>

	<%@include file="jspf/messages.jsp"%>

	<%@include file="jspf/navbar.jspf"%>
	<%@include file="jspf/footer.jspf"%>
	<script async src="https://platform.twitter.com/widgets.js"
		charset="utf-8"></script>
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12';
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<div class="uk-background-muted">
		<button class="uk-button uk-button-default demo uk-position-center"
			type="button"
			onclick="UIkit.notification({message: 'Item Successfully purchased!', status: 'success'})">Complete
			purchase</button>

		<div class="uk-section">
			<div class="uk-container">

				<div class="uk-section" id="paypal-button"></div>

			</div>
		</div>
	</div>
	<div class="uk-container">
		<a class="twitter-share-button"
			href="https://twitter.com/share?ref_src=twsrc%5Etfw"
			data-size="large"
			data-text="Check out my cool new listing via U-ListIt!"
			data-hashtags="ulistit, benu" data-via="ulistit"
			data-related="twitterapi,twitter"> Tweet </a>
		<div class="fb-share-button"
			data-href="http://www.localhost:8080/checkoutPage/"
			data-layout="button_count" data-size="large"
			data-mobile-iframe="true">
			<a class="fb-xfbml-parse-ignore" target="_blank"
				href="http://www.localhost:8080/checkoutPage/">Share</a>
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
												total : $("#price"),
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
											window.alert('Payment Complete!');
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

	</div>
</body>
</html>
