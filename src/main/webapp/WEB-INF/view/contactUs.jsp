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
		<div class="form">
			<h1>U-ListIt Contact Form</h1>
			<p>Send your comments, questions, and concerns through this form
				and we will get back to you as soon as possible.</p>
			<div id="form">
				<form id="form" name="contactUs" action="sendEmail" class="uk-form"
					method="POST">
					<div class="uk-margin uk-position-center">
						<div class="uk-margin">
							<input class="uk-input" type="text" placeholder="Full Name" required>
						</div>
						<div class="uk-margin">
							<input class="uk-input" type="email" placeholder="Email" required>
						</div>
						<div class="uk-margin">
							<input class="uk-input" type="tel" placeholder="Phone" required>
						</div>
						<div class="uk-margin">
							<input class="uk-input" type="text" placeholder="Message" required>
						</div>
						<div id="mail-status"></div>
						<input type="submit" name="submit" value="Send Message"
							id="send-message" style="clear: both;">
						<%@include file="jspf/messages.jsp"%>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
	<%@include file="jspf/footer.jspf"%>
</html>