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
    <title>${title}</title>
</head>
<body class="uk-background-muted">

<div class="uk-position-relative">
    <div class="uk-position-relativetop">
        <nav class="uk-navbar-container uk-navbar-dark" uk-navbar>
            <div class="uk-navbar-center">
                <ul class="uk-navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/admin">Dashboard</a>
                    </li>
                    <li class="uk-active"><a
                            href="${pageContext.request.contextPath}/adminUser">Manage
                        Users</a></li>
                    <li><a href="${pageContext.request.contextPath}/adminListing">Manage
                        Listings</a></li>
                    <li><a href="${pageContext.request.contextPath}/adminDisputes">Manage
                        Disputes</a></li>
                    <li><a href="${pageContext.request.contextPath}/adminChecklist">Manage
                        Freshman Checklist</a></li>
                </ul>
            </div>
            <div class="uk-navbar-right">
                <ul class="uk-navbar-nav">
                    <li><a>Welcome ${user.firstName}</a></li>
                    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>

<%@include file="../jspf/messages.jsp" %>

<div class="uk-container">

    <div class="uk-grid">

        <h2 class="uk-align-center">Manage Default Freshman Checklist</h2>

        <div class="uk-tile-default uk-border-rounded uk-box-shadow-hover-large uk-box-shadow-medium uk-width-4-5@m uk-width-1-1@s uk-align-center">

            <table class="uk-table uk-table-hover uk-table-divider uk-text-large">
                <thead>
                <tr>
                    <th class="uk-table-expand">Item <a uk-toggle="target: #addNewItem" uk-icon="icon: plus"
                                                        style="color: green" title="Add New Item"></a>
                    </th>
                    <th></th>
                    <th class="uk-table-small">Remove</th>
                </tr>
                </thead>
                <tbody>
                <form action="/adminAddChecklistItem" method="post" id="addItemForm">
                    <tr id="addNewItem" hidden>
                        <td class="uk-table-expand">
                            <input class="uk-input" name="newItemName" required>
                        </td>
                        <td class="uk-table-small"><a uk-icon="icon: plus-circle; ratio: 1.5"
                                                      style="color: cornflowerblue" title="Add New Item"
                                                      onclick="document.getElementById('addItemForm').submit()"></a>
                        </td>
                        <td class="uk-table-small"></td>
                    </tr>
                </form>
                <c:forEach items="${defaultChecklist.items}" var="item">
                    <form action="/adminRemoveChecklistItem" method="post" id="removeItemForm${item.itemID}">
                        <input type="hidden" name="itemID" value="${item.itemID}">
                        <tr>
                            <td class="uk-table-expand">${item.name}</td>
                            <td></td>
                            <td class="uk-table-small"><a uk-icon="icon: trash"
                                                          onclick="document.getElementById('removeItemForm${item.itemID}').submit()"></a>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
                </tbody>
            </table>

        </div>

    </div>

</div>

</body>
</html>
