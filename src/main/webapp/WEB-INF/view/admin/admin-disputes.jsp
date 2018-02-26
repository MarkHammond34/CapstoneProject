<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="edu.ben.model.User" %>
<%@ page import="java.util.List" %>
<html>
<spring:url value="resources/css/uikit.css" var="uikitCSS"/>
<spring:url value="resources/js/uikit.js" var="uikitJS"/>
<spring:url value="resources/js/jquery.js" var="jquery"/>
<spring:url value="resources/js/uikit-icons.js" var="uikiticons"/>
<link href="${uikitCSS}" rel="stylesheet"/>
<script type="text/javascript" src="${uikitJS}"></script>
<script type="text/javascript" src="${jquery}"></script>
<script type="text/javascript" src="${uikiticons}"></script>
<head>
    <title>Admin Disputes</title>
    <div class="uk-position-relative">
        <div class="uk-position-relativetop">
            <nav class="uk-navbar-container uk-navbar-dark" uk-navbar>
                <div class="uk-navbar-center">
                    <ul class="uk-navbar-nav">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin">Dashboard</a>
                        </li>
                        <li class="uk-active">
                            <a href="${pageContext.request.contextPath}/adminUser">Manage Users</a>
                        </li>
                    </ul>
                </div>
                <div class="uk-navbar-right">
                    <ul class="uk-navbar-nav">
                        <li>
                            <a>Welcome ${user.firstName}</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/">Home</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/logout">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</head>

<body style="background-color: #5bc0de">
<div class="uk-grid uk-margin-top" uk-grid>

    <div class="uk-width-1-4">
        <div class="uk-card uk-card-default uk-card-large uk-margin-small-left uk-card-body">
            <h4 class="uk-card-title uk-text-center">Disputes</h4>
            <ul class="uk-tab-left" uk-tab="connect: #component-tab-left; animation: uk-animation-fade">
                <c:forEach var="dispute" items="${disputes}">
                    <li><a
                            href="#"><span style="color: red" uk-icon="icon: warning; ratio: 1"></span>
                        Accuser: ${dispute.accuser.userID} Defender: ${dispute.defender.userID}
                    </a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="uk-width-3-4">
        <div class="uk-card uk-card-default uk-card-large uk-margin-small-right uk-card-body">
            <h3 class="uk-card-title">Listing Details</h3>
            <ul id="component-tab-left" class="uk-switcher">
                <c:forEach var="dispute" items="${disputes}">
                    <li class="uk-grid" uk-grid>
                        <div class="uk-width-1-2 uk-float-left">
                            <ul class="uk-grid uk-width-1-2 uk-align-left" uk-grid>
                                <li class="uk-width-1-1"><u style="color: red">Listing ID:</u> ${dispute.listing.id}
                                </li>
                                <li class="uk-width-1-1"><u style="color: red">Defending
                                    User:</u> ${dispute.defender.firstName} ${dispute.defender.lastName}</li>
                                </li>
                                <li class="uk-width-1-1"><u
                                        style="color: red">Name:</u> ${dispute.listing.name}
                                </li>
                                <li class="uk-width-1-1"><u
                                        style="color: red">Description:</u> ${dispute.listing.description}
                                </li>
                                <!--
                                <li class="uk-width-1-1"><u
                                        style="color: red">Rating:</u> Rating
                                </li>
                                -->
                            </ul>
                        </div>
                        <div class="uk-width-1-2 uk-float-right">
                            <img class="uk-align-center" style="max-height: 300px; max-width: 300px;"
                                 src="${pageContext.request.contextPath}/resources/img/listings/${dispute.listing.image_path}"
                                 alt="Listing"/>
                        </div>
                        <hr class="uk-width-1-1">
                        <h3>Dispute Details</h3>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

</div>
</body>
</html>