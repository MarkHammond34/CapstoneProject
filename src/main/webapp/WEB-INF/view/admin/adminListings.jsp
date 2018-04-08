<%--
  Created by IntelliJ IDEA.
  User: saran
  Date: 2/28/18
  Time: 7:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="edu.ben.model.User" %>
<%@ page import="edu.ben.model.Listing" %>
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
    <title>Admin Listings</title>
    <div class="uk-position-relative">
        <div class="uk-position-relativetop">
            <nav class="uk-navbar-container uk-navbar-dark" uk-navbar>
                <div class="uk-navbar-center">
                    <ul class="uk-navbar-nav">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin">Dashboard</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/adminUser">Manage Users</a>
                        </li>
                        <li class="uk-active">
                            <a href="${pageContext.request.contextPath}/adminListing">Manage Listings</a>
                        </li>
                        <li class="uk-active">
                            <a href="${pageContext.request.contextPath}/adminDisputes">Manage Disputes</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/eventsNews">Events/News</a>
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

<body>
<div class="uk-cover-container uk-height-viewport">
    <div class="uk-flex uk-flex-column">
        <ul uk-switcher>
            <li>
                <a href="#dashboardUserTable" hidden></a>Users
            </li>
            <li>
                <a href="#dashboardListingsTable" hidden></a>Listings
            </li>
        </ul>
        <div class="uk-card uk-card-default uk-card-large uk-card-body uk-width-3-4 uk-position-large uk-position-top-center">


        </div>
        <div id="dashboardUserTable"
             class="uk-switcher uk-card uk-card-default uk-card-large uk-card-body uk-width-3-4 uk-position-large uk-position-top-center">
            <div class="uk-overflow-auto">
                <div class="uk-child-width-3-4" uk-grid>
                    <div class="uk-overflow-container">
                        <a class="uk-button uk-button-default uk-position-top-right" href="#createUserModal" uk-toggle hidden>Create
                            User</a>
                        <h3 class="uk-heading-divider">Listings</h3>
                        <table class="uk-table uk-table-small uk-table-hover u-table-middle uk-table-divider">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Type</th>
                                <th>Active/Inactive</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Listing> allListings = (List<Listing>) session.getAttribute("allListings");
                                for (int i = 0; i < allListings.size(); i++) {
                            %>
                            <tr>
                                <td><%=allListings.get(i).getId()%>
                                </td>
                                <td><%=allListings.get(i).getUser().getUsername()%>
                                </td>
                                <td><%=allListings.get(i).getCategory()%>
                                </td>
                                <td><%=allListings.get(i).getPrice()%>
                                </td>
                                <td><%=allListings.get(i).getType()%>
                                </td>
                                <td>
                                    <%
                                        if (allListings.get(i).getActive() == 1) {
                                    %>
                                        <button name="active"  type="submit"
                                                uk-icon="icon: check"></button>
                                    <%
                                    } else {
                                    %>

                                        <button name="inactive"
                                                type="submit" uk-icon="icon: ban"></button>
                                    <%
                                        }
                                    %>
                                </td>
                                <td>
                                    <a href="/editListing?id=<%=allListings.get(i).getId()%>" uk-icon="icon: file-edit"
                                       uk-toggle></a>
                                </td>
                                <td>
                                    <form method="Post" action="adminDeleteListing">
                                        <button name="adminDeleteListing"
                                                value="<%=allListings.get(i).getId()%>"
                                                type="submit" uk-icon="icon: trash"></button>
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>