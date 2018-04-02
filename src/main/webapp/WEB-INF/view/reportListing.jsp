<%@include file="jspf/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.mail.MessagingException"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Contact Us</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<%@include file="jspf/navbar.jspf"%>

	<div id="central">
		<div class="uk-margin-left">
			<h1>Report a Listing</h1>
			<div id="form">
				<form id="form" name="reportListing" action="reportListingEmail" class="uk-margin-top uk-form"
					method="POST">
					<div class="uk-margin-large-top uk-position-center">
						<h3>Reporter Information</h3>
						<div class="uk-margin">
							<input class="uk-input" type="text" name="reportUsername"
								placeholder="${sessionScope.user.username}" disabled>
						</div>
						<div class="uk-margin">
							<input class="uk-input" type="email" name="reportEmail"
								placeholder="${sessionScope.user.schoolEmail}" disabled>
						</div>
						<h3>Seller Information</h3>
						<div class="uk-margin">
							<input class="uk-input" type="text" name="sellerName"
								placeholder="${listing.user.username}" disabled>
						</div>
						<div class="uk-margin">
							<input class="uk-input" type="email" name="sellerEmail"
								placeholder="${listing.user.schoolEmail}" disabled>
						</div>
						<div class="uk-margin">
							<input class="uk-input" type="text" name="listingName" placeholder="${listing.name}"
								disabled>
						</div>
						<textarea class="uk-textarea" rows="5" cols="100" name="message"
							placeholder="Please write your reason for the report here"></textarea>
						<div id="mail-status"></div>
						<input type="submit" class="uk-button uk-button-primary" name="submit" value="Send Report" style="clear: both;">
						<%@include file="jspf/messages.jsp"%>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<%@include file="jspf/footer.jspf"%>
</html>