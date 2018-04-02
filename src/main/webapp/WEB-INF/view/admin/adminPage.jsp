<%--
  Created by IntelliJ IDEA.
  User: saran
  Date: 2/13/18
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="edu.ben.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.ben.model.Listing" %>

<html>
<head>
    <title>Admin Dashboard</title>
    <spring:url value="resources/css/uikit.css" var="uikitCSS"/>
    <spring:url value="resources/js/uikit.js" var="uikitJS"/>
    <spring:url value="resources/js/jquery.js" var="jquery"/>
    <spring:url value="resources/js/uikit-icons.js" var="uikiticons"/>
    <link href="${uikitCSS}" rel="stylesheet"/>
    <script type="text/javascript" src="${uikitJS}"></script>
    <script type="text/javascript" src="${jquery}"></script>
    <script type="text/javascript" src="${uikiticons}"></script>

    <div class="uk-position-relative">
        <div class="uk-position-relativetop">
            <nav class="uk-navbar-container uk-navbar-dark" uk-navbar>
                <div class="uk-navbar-center">
                    <ul class="uk-navbar-nav">
                        <li class="uk-active"><a
                                href="${pageContext.request.contextPath}/admin">Dashboard</a></li>
                        <li><a href="${pageContext.request.contextPath}/adminUser">Manage
                            Users</a></li>
                        <li><a href="${pageContext.request.contextPath}/adminListing">Manage
                            Listings</a></li>
                        <li><a href="${pageContext.request.contextPath}/adminDisputes">Manage
                            Disputes</a></li>
                        <li><a href="${pageContext.request.contextPath}/eventsNews">Events/News</a>
                        </li>

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
</head>
<body>
<div class="uk-cover-container uk-height-viewport">
    <img src="assets/server.jpg" alt="" uk-cover>
    <div class="uk-flex uk-flex-column">
        <ul uk-switcher>
            <li><a href="#dashboardUserTable"></a>Users</li>
            <li><a href="#dashboardListingsTable"></a>Listings</li>
        </ul>
        <div
                class="uk-card uk-card-default uk-card-large uk-card-body uk-width-3-4 uk-position-large uk-position-top-center">


        </div>
        <div id="dashboardUserTable"
             class="uk-switcher uk-card uk-card-default uk-card-large uk-card-body uk-width-3-4 uk-position-large uk-position-top-center">
            <div class="uk-overflow-auto">
                <div class="uk-child-width-3-4" uk-grid>
                    <div>
                        <div uk-grid>
                            <div class="uk-width-auto@m">
                                <ul class="uk-tab-left"
                                    uk-tab="connect: #component-tab-left; animation: uk-animation-fade">
                                    <li><a href="#">Users</a></li>
                                    <li><a href="#">Listings</a></li>
                                </ul>
                            </div>
                            <div class="uk-width-expand">
                                <ul id="component-tab-left" class="uk-switcher">
                                    <li>
                                        <table
                                                class="uk-table uk-table-large uk-table-middle uk-table-divider">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Email</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Date Created</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                                List<User> recentUsers = (List<User>) session.getAttribute("recentUsers");
                                                if (recentUsers != null || !recentUsers.isEmpty()) {
                                                    for (int i = 0; i < recentUsers.size(); i++) {
                                            %>
                                            <tr>
                                                <td><%=recentUsers.get(i).getUserID()%>
                                                </td>
                                                <td><%=recentUsers.get(i).getSchoolEmail()%>
                                                </td>
                                                <td><%=recentUsers.get(i).getFirstName()%>
                                                </td>
                                                <td><%=recentUsers.get(i).getLastName()%>
                                                </td>
                                                <td>T<%=recentUsers.get(i).getDateCreated()%>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            } else {
                                            %>
                                            <p>There are no users</p>
                                            <%
                                                }
                                            %>
                                            </tbody>
                                        </table>
                                    </li>
                                    <li>

                                        <table
                                                class="uk-table uk-table-large uk-table-middle uk-table-divider">
                                            <thead>
                                            <tr>
                                                <th>Listed By</th>
                                                <th>Title</th>
                                                <th>Date Listed</th>
                                            </tr>
                                            <%
                                                List<Listing> recentListings = (List<Listing>) session.getAttribute("recentListings");
                                                if (recentListings != null || !recentListings.isEmpty()) {
                                                    for (int j = 0; j < recentListings.size(); j++) {
                                            %>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><%=recentListings.get(j).getUser().getUsername()%>
                                                </td>
                                                <td><%=recentListings.get(j).getName()%>
                                                </td>
                                                <td><%=recentListings.get(j).getDateCreated()%>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            } else {
                                            %>
                                            <p>There are no listings</p>
                                            <%
                                                }
                                            %>
                                            </tbody>
                                        </table>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div></div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
