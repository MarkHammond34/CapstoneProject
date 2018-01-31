<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
<title>U-ListIt</title>
    <%--Nav Bar--%>
    <div class="uk-position-relative">
        <div class="uk-position-relativetop">
            <nav class="uk-navbar-container uk-navbar-dark" uk-navbar>
                <div class="uk-navbar-center">
                    <ul class="uk-navbar-nav">
                        <li><a href="#">Dashboard</a></li>
                        <li class="uk-active"><a href="#">Manage Users</a></li>
                    </ul>
                </div>
                <div class="uk-navbar-right">
                    <ul class="uk-navbar-nav">
                        <li><a>Welcome Admin</a></li>
                        <li><a href="#">Logout</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</head>
<body>
<p>
<a href="/testing">click</a>
</p>
<h1>Welcome to U-ListIt</h1>


</body>
</html>--%>