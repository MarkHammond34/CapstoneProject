<%--
  Created by IntelliJ IDEA.
  User: saran
  Date: 1/31/18
  Time: 10:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%-- Nav Bar --%>
    <div class="uk-position-relative">
        <div class="uk-position-relativetop">
            <nav class="uk-navbar-container uk-navbar-dark" uk-navbar>
                <div class="uk-navbar-center">
                    <ul class="uk-navbar-nav">
                        <li class="uk-active">
                            <a href="#">Dashboard</a>
                        </li>
                        <li>
                            <a href="#">Manage Users</a>
                        </li>
                    </ul>
                </div>
                <div class="uk-navbar-right">
                    <ul class="uk-navbar-nav">
                        <li>
                            <a>Welcome ${user.firstName}</a>
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
<%@ page import="edu.ben.model.User" %>
<%@ page import="edu.ben.model.Listing" %>
<%@ page import="java.util.List" %>
<%
    List<User> recentUsers = (List<User>) request.getSession().getAttribute("recentUsers");

    //List<Listing> recentListings = (List<Listing>) request.getSession().getAttribute("listing");
%>
<div class="uk-cover-container uk-height-viewport">
    <img src="assets/server.jpg" alt="" uk-cover>
    <div class="uk-flex uk-flex-column">
        <ul uk-switcher hidden>
            <li>

            </li>
            <li>

            </li>
        </ul>
        <div class="uk-card uk-card-default uk-card-large uk-card-body uk-width-3-4 uk-position-large uk-position-top-center">


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
                                    <li>
                                        <a href="#">Users</a>
                                    </li>
                                    <li>
                                        <a href="#">Listings</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="uk-width-expand">
                                <ul id="component-tab-left" class="uk-switcher">
                                    <li>
                                        <table class="uk-table uk-table-large uk-table-middle uk-table-divider">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Email</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Username</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                                if (recentUsers.isEmpty() || recentUsers == null) { %>
                                            <tr>There are currently no users added</tr>
                                            <% } else {
                                                for (int i = 0; i < recentUsers.size(); i++) { %>
                                            <tr>
                                                <td><%=recentUsers.get(i).getUserID()%>
                                                </td>
                                                <td><%=recentUsers.get(i).getEmail()%>
                                                </td>
                                                <td><%=recentUsers.get(i).getFirstName()%>
                                                </td>
                                                <td><%=recentUsers.get(i).getLastName()%>a</td>
                                                <td><%=recentUsers.get(i).getUsername()%>
                                                </td>
                                            </tr>
                                            <%
                                                    }
                                                }
                                            %>
                                            </tbody>
                                        </table>
                                    </li>
                                    <li>
                                        <table class="uk-table uk-table-large uk-table-middle uk-table-divider">
                                            <thead>
                                            <tr>
                                                <th>Listed By</th>
                                                <th>Title</th>
                                                <th>Category</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%--
                                            <%
                                                if (recentListings.isEmpty() || recentListings == null) { %>
                                            <tr>There are currently no listings added</tr>
                                            <% } else {
                                            <% for (int i = 0; i < recentListings.size(); i++) { %>
                                            <tr>
                                                <td><%=recentListings.get(i).getUser().getUsername()%>
                                                </td>
                                                <td><%=recentListings.get(i).getName()%>
                                                </td>
                                                <td><%=recentListings.get(i).getCategory()%>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>

                                            --%>
                                            </tbody>
                                        </table>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>