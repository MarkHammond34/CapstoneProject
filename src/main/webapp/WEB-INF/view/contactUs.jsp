<%--
  Created by IntelliJ IDEA.
  User: saran
  Date: 2/1/18
  Time: 7:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Contact Us</title>
    <spring:url value="resources/css/uikit.css" var="uikitCSS"/>
    <spring:url value="resources/js/uikit.js" var="uikitJS"/>
    <spring:url value="resources/js/jquery.js" var="jquery"/>
    <spring:url value="resources/js/uikit-icons.js" var="uikiticons"/>
    <spring:url value="resources/img/contactus.jpg" var="background"/>
    <link href="${uikitCSS}" rel="stylesheet"/>
    <script type="text/javascript" src="${uikitJS}"></script>
    <script type="text/javascript" src="${jquery}"></script>
    <script type="text/javascript" src="${uikiticons}"></script>
    <div class="uk-position-relative">
        <div class="uk-position-relativetop">
            <nav class="uk-navbar-container uk-navbar-dark" uk-navbar>
                <div class="uk-navbar-left">
                    <ul class="uk-navbar-nav">
                        <li>
                            <a href="/">Home</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/displayListing">View Listings
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/createListing">Create Listing
                            </a>
                        </li>
                        <li>
                        </li>
                    </ul>
                </div>
                <div class="uk-navbar-right">
                    <ul class="uk-navbar-nav">
                        <li>
                            <a>Welcome user</a>
                        </li>
                        <li>
                            <a href="#">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</head>
<body>
<div class="uk-height-viewport uk-background-blend-lighten uk-background-cover uk-overflow-hidden uk-darken uk-flex uk-flex-top"
     style="background-image: url('${background}');">
    <div class="uk-overlay-default uk-text-center uk-margin-auto uk-margin-auto-vertical uk-width-1-2">
        <div class="uk-card uk-card-default uk-card-small uk-card-body uk-width-3-4 uk-position-large uk-position-center">
            <h1>About Us </h1>
            <br>
            <p> Them team consists of Corey Kuhel, Mark Hammond, Steve Shultz, Saran Movva, Jacob Trumpis. We are all either pursuing a computer science or computer information systems major. We developed this website as one of our final projects in our undergraduate academic career. We hope you enjoy your stay!</p>
            <br>
            <br>
            <h1> Contact Us <h1>

                <form class="uk-grid-small text-align-center" id="contactForm" uk-grid>
                    <div class="uk-width-1-1 uk-from-controls">
                        <input id="Name" class="uk-input" type="text" placeholder="Name">
                    </div>
                    <div class="uk-width-1-1">
                        <input id="email" class="uk-input" type="text" placeholder="Email">
                    </div>
                    <div class="uk-width-1-1">
                        <textarea rows="30" cols="30" id="username" class="uk-input" form="contactForm" type="text" placeholder="Type here"> </textarea>
                    </div>
                    <input class="uk-button uk-button-primary uk-width-1-2" type="submit"></input>
                </form>
        </div>

    </div>
</div>
</body>
</html>
