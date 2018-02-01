<%--
  Created by IntelliJ IDEA.
  User: saran
  Date: 2/1/18
  Time: 4:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <spring:url value="resources/css/uikit.css" var="uikitCSS"/>
    <spring:url value="resources/js/uikit.js" var="uikitJS"/>
    <spring:url value="resources/js/jquery.js" var="jquery"/>
    <spring:url value="resources/js/uikit-icons.js" var="uikiticons"/>
    <spring:url value="resources/img/user.jpg" var="background"/>
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
                        <li>
                            <a href="${pageContext.request.contextPath}/AdminDashboard">Dashboard</a>
                        </li>
                        <li class="uk-active">
                            <a href="${pageContext.request.contextPath}/AdminUsers">Manage Users</a>
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
<%@ page import="java.util.List" %>

<%
    List<User> allUsers = (List<User>) request.getSession().getAttribute("allUsers");
%>
<div class="uk-cover-container uk-height-viewport">
    <img src="${background}" alt="" uk-cover>
    <div class="uk-flex uk-flex-column">
        <ul uk-switcher>
            <li>
                <a href="#dashboardUserTable"></a>Users
            </li>
            <li>
                <a href="#dashboardListingsTable"></a>Listings
            </li>
        </ul>
        <div class="uk-card uk-card-default uk-card-large uk-card-body uk-width-3-4 uk-position-large uk-position-top-center">


        </div>
        <div id="dashboardUserTable"
             class="uk-switcher uk-card uk-card-default uk-card-large uk-card-body uk-width-3-4 uk-position-large uk-position-top-center">
            <div class="uk-overflow-auto">
                <div class="uk-child-width-3-4" uk-grid>
                    <div class="uk-overflow-container">
                        <a class="uk-button uk-button-default uk-position-top-right" href="#createUserModal" uk-toggle>Create
                            User</a>
                        <h3 class="uk-heading-divider">Users</h3>
                        <table class="uk-table uk-table-small uk-table-hover u-table-middle uk-table-divider">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Email</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Unlock</th>
                                <th>Password Reset</th>
                                <th>Delete</th>
                                <th>Edit</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (allUsers.isEmpty() || allUsers == null) { %>
                            <tr>There are currently no users added</tr>
                            <% } else {
                                for (int i = 0; i < allUsers.size(); i++) { %>
                            <tr>
                                <td><%=allUsers.get(i).getUserID()%>
                                </td>
                                <td><%=allUsers.get(i).getEmail()%>
                                </td>
                                <td><%=allUsers.get(i).getFirstName()%>
                                </td>
                                <td><%=allUsers.get(i).getLastName()%>
                                </td>
                                <td>
                                    <% if (allUsers.get(i).getActive() == 1) { %>
                                    <a href="" uk-icon="icon: lock"></a>
                                    <% } else { %>
                                    <a href="" uk-icon="icon: lock"></a>
                                    <%} %>
                                </td>
                                <td>
                                    <a href="" uk-icon="icon: mail"></a>
                                </td>
                                <td>
                                    <a href="" uk-icon="icon: trash"></a>
                                </td>
                                <td>
                                    <a href="#editUserModal" uk-icon="icon: file-edit" uk-toggle></a>
                                </td>
                            </tr>
                            <% }
                            }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal !-->
        <div id="createUserModal" uk-modal>
            <div class="uk-modal-dialog">
                <button class="uk-modal-close-default" type="button" uk-close></button>
                <div class="uk-modal-header">
                    <h2 class="uk-modal-title">Create User</h2>
                </div>
                <div class="uk-modal-body">
                    <form class="uk-grid-small" uk-grid>
                        <div class="uk-width-1-2 uk-from-controls">
                            <input id="firstName" class="uk-input" type="text" placeholder="First Name">
                        </div>
                        <div class="uk-width-1-2">
                            <label class="uk-form-label" for="lastName"> </label>
                            <input id="lastName" class="uk-input" type="text" placeholder="Last Name">
                        </div>
                        <div class="uk-width-1-2">
                            <input id="username" class="uk-input" type="text" placeholder="Username">
                        </div>
                        <div class="uk-width-1-2">
                            <input id="phoneNumber" class="uk-input" type="number" placeholder="Phone Number">
                        </div>
                        <div class="uk-width-1-1">
                            <input id="personalEmail" class="uk-input" type="email" placeholder="Personal Email">
                        </div>
                        <div class="uk-width-1-1">
                            <input id="benedictineEmail" class="uk-input" type="email" placeholder="Benedictine Email">
                        </div>
                        <div class="uk-width-1-2">
                            <input id="password" class="uk-input" type="password" placeholder="Password">
                        </div>
                        <div class="uk-width-1-2">
                            <input id="passwordConfirm" class="uk-input" type="password" placeholder="Password Confirm">
                        </div>
                        <button class="uk-button uk-button-default uk-modal-close uk-width-1-2" type="button">Close
                        </button>
                        <input class="uk-button uk-button-primary uk-width-1-2" type="submit"></input>
                    </form>
                </div>
            </div>
        </div>


        <!--Edit Modal !-->
        <div id="editUserModal" uk-modal>
            <div class="uk-modal-dialog">
                <button class="uk-modal-close-default" type="button" uk-close></button>
                <div class="uk-modal-header">
                    <h2 class="uk-modal-title">Edit User</h2>
                </div>
                <div class="uk-modal-body">
                    <form class="uk-grid-small" uk-grid>
                        <div class="uk-width-1-2 uk-from-controls">
                            <input id="firstName" class="uk-input" type="text" placeholder="First Name">
                        </div>
                        <div class="uk-width-1-2">
                            <label class="uk-form-label" for="lastName"> </label>
                            <input id="lastName" class="uk-input" type="text" placeholder="Last Name">
                        </div>
                        <div class="uk-width-1-2">
                            <input id="username" class="uk-input" type="text" placeholder="Username">
                        </div>
                        <div class="uk-width-1-1">
                            <input id="personalEmail" class="uk-input" type="email" placeholder="Personal Email">
                        </div>
                        <div class="uk-width-1-1">
                            <input id="benedictineEmail" class="uk-input" type="email" placeholder="Benedictine Email">
                        </div>
                        <div class="uk-width-1-1">
                            <input id="password" class="uk-input" type="password" placeholder="Password">
                        </div>
                        <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid uk-width-1-1">
                            <label><input class="uk-radio" type="radio" name="accountType" value="Admin"> Admin</label>
                            <label><input class="uk-radio" type="radio" name="accountType" value="Admin"> User</label>
                        </div>
                        <button class="uk-button uk-button-default uk-modal-close uk-width-1-2" type="button">Close
                        </button>
                        <input class="uk-button uk-button-primary uk-width-1-2" type="submit"></input>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>
