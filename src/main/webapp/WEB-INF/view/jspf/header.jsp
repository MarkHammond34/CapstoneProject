<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registration</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <spring:url value="resources/css/uikit.css" var="uikitCSS" />
    <link href="${uikitCSS}" rel="stylesheet" />

    <spring:url value="resources/css/registration.css" var="regCSS" />
    <link href="${regCSS}" rel="stylesheet" />

    <style>

        .input-group-addon.success {
            color: rgb(255, 255, 255);
            background-color: rgb(92, 184, 92);
            border-color: rgb(76, 174, 76);
        }

        .input-group-addon.info {
            color: rgb(255, 255, 255);
            background-color: rgb(57, 179, 215);
            border-color: rgb(38, 154, 188);
        }

        .input-group-addon.warning {
            color: rgb(255, 255, 255);
            background-color: rgb(240, 173, 78);
            border-color: rgb(238, 162, 54);
        }

        .input-group-addon.danger {
            color: rgb(255, 255, 255);
            background-color: rgb(217, 83, 79);
            border-color: rgb(212, 63, 58);
        }
    </style>
</head>