<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>${title}</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <spring:url value="resources/css/uikit.css" var="uikitCSS"/>
    <spring:url value="resources/js/uikit.js" var="uikitJS"/>
    <spring:url value="resources/js/jquery.js" var="jquery"/>
    <spring:url value="resources/js/uikit-icons.js" var="uikiticons"/>
    <spring:url value="resources/css/main.css" var="mainCSS"/>
    <spring:url value="resources/css/index-listing.css" var="indexListingCSS"/>
    <spring:url value="resources/css/registration.css" var="regCSS"/>
    <link href="${uikitCSS}" rel="stylesheet"/>
    <link href="${mainCSS}" rel="stylesheet"/>
    <link href="${regCSS}" rel="stylesheet"/>
    <link href="${indexListingCSS}" rel="stylesheet"/>
    <script type="text/javascript" src="${uikitJS}"></script>
    <script type="text/javascript" src="${jquery}"></script>
    <script type="text/javascript" src="${uikiticons}"></script>
    
    <style>.uk-countdown-number {
        font-size: 22px;
    }

    .uk-countdown-label {
        font-size: 14px;
    }

    .uk-card-media-left img {
        max-height: 100%;
        max-width: 100%;
    }</style>
</head>