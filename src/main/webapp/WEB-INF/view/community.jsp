<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<spring:url value="resources/css/uikit.css" var="uikitCSS" />
    <spring:url value="resources/js/uikit.js" var="uikitJS"/>
    <spring:url value="resources/js/jquery.js" var="jquery"/>
    <spring:url value="resources/js/uikiticons.js" var="uikiticons"/>
<link href="${uikitCSS}" rel="stylesheet" />
    <script type="text/javascript" src="${uikitJS}"></script>
    <script type="text/javascript" src="${jquery}"></script>
    <script type="text/javascript" src="${uikiticons}"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Community</title>

</head>
<body>
	<%--Nav Bar--%>
    <div class="uk-position-relative">
        <div class="uk-position-relativetop">
            <nav class="uk-navbar-container uk-navbar-dark" uk-navbar>
                <div class="uk-navbar-left">
                    <ul class="uk-navbar-nav">
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>
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
	<div class="uk-section uk-primary">
		<div class="uk-container">

			<h1>Welcome to the community!</h1>

			<h2>Come here for news, updates, and more!</h2>

			<div class="uk-section">
				<div class="uk-container uk-container-small ">
					<div>
						<h3>Latest News</h3>
					</div>
					<div>
						<h3>Release Notes</h3>
					</div>
					<div>
						<h4>Release v.0.1.2</h4>
						<p></p>

						<h4>Release v.0.1.1 (Initial Release)</h4>
						<p></p>
					</div>
					<div>
						<h3>Upcoming Features</h3>
					</div>
					<div>
						<h4></h4>
						<p></p>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>