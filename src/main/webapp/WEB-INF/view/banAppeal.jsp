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
		<div class="form uk-margin-left">
			<h1>U-ListIt Ban Appeal Form</h1>
			<p>State your reasoning below as to why you feel your account should be unbanned. Please ensure that the email address listed is that of a U-List It account.</p>
			<div id="form">
				<form id="form" name="banAppeal" action="sendEmail" class="uk-form"
					method="POST">
					<div class="uk-margin-left uk-position-center uk-card">
						<div class="uk-margin">
							<input class="uk-input" type="text" placeholder="Full Name" required>
						</div>
						<div class="uk-margin">
							<input class="uk-input" type="email" placeholder="U-List It Email" required>
						</div>
                            <div class="uk-margin uk-margin-top">
							<textarea class="uk-textarea" rows="5" cols="100"
                                      placeholder="Your reason for appealing your ban" name="appeal"
                                      required></textarea>
						</div>
						<div id="mail-status"></div>
						<input type="submit" class="uk-button uk-button-primary uk-border-rounded" name="submit" value="Send Appeal"
							id="send-message" style="clear: both;">
						<%@include file="jspf/messages.jsp"%>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>