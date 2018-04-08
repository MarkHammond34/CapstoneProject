<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE html>
<html style="height:100%;">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <spring:url value="resources/js/notification.js" var="notJS"/>
    <script type="text/javascript" src="${notJS}"></script>

    <spring:url value="resources/css/uikit.css" var="uikitCSS"/>
    <spring:url value="resources/js/uikit.js" var="uikitJS"/>
    <spring:url value="resources/js/jquery.js" var="jquery"/>
    <spring:url value="resources/js/uikit-icons.js" var="uikiticons"/>
    <spring:url value="resources/css/main.css" var="mainCSS"/>
    <spring:url value="resources/css/index-listing.css" var="indexListingCSS"/>
    <spring:url value="resources/css/registration.css" var="regCSS"/>

    <script type="text/javascript" src="${jquery}"></script>
    <script type="text/javascript" src="${uikitJS}"></script>
    <link href="${uikitCSS}" rel="stylesheet"/>
    <script type="text/javascript" src="${uikiticons}"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>${title}</title>


   <!-- <link href="${mainCSS}" rel="stylesheet"/> -->
    <link href="${regCSS}" rel="stylesheet"/>
    <link href="${indexListingCSS}" rel="stylesheet"/>
    <spring:url value="resources/js/main.js" var="mainJS"/>
    <script type="text/javascript" src="${mainJS}"></script>

    <script src="https://www.paypalobjects.com/api/checkout.js"></script>

    <style>.uk-countdown-number {
        font-size: 22px;
    }

    .uk-countdown-label {
        font-size: 14px;
    }

    .uk-card-media-left img {
        max-height: 100%;
        max-width: 100%;
    }

    .body {
        background-color: #f2f2f2;
    }

    .badge1 {
        position: relative;
    }

    .badge1[data-badge]:after {
        content: attr(data-badge);
        position: absolute;
        top: -20px;
        right: -36px;
        font-size: .7em;
        background: #ff695c;
        color: white;
        width: 18px;
        height: 18px;
        text-align: center;
        line-height: 18px;
        border-radius: 50%;
        box-shadow: 0 0 1px #333;
    }

    .badge2 {
        content: attr(data-badge);
        position: absolute;
        background: #ff695c;
        left: 5px;
        bottom: 40px;
        width: 10px;
        height: 10px;
        line-height: 18px;
        border-radius: 50%;
        box-shadow: 0 0 1px #333;
    }
    .footer {
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
        display: inline-block;
    }
    </style>
</head>
<script src="//platform.linkedin.com/in.js" type="text/javascript"></script>