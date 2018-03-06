<%--
  Created by IntelliJ IDEA.
  User: saran
  Date: 2/18/18
  Time: 6:33 PM
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Admin Users</title>
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
                        <li>
                            <a href="${pageContext.request.contextPath}/adminListing">Manage Listings</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/adminDisputes">Manage Disputes</a>
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
                                List<User> allUsers = (List<User>) session.getAttribute("allUsers");
                                for (int i = 0; i < allUsers.size(); i++) {
                            %>
                            <tr>
                                <td><%=allUsers.get(i).getUserID()%>
                                </td>
                                <td><%=allUsers.get(i).getSchoolEmail()%>
                                </td>
                                <td><%=allUsers.get(i).getFirstName()%>
                                </td>
                                <td><%=allUsers.get(i).getLastName()%>
                                </td>
                                <td>
                                    <%
                                        if (allUsers.get(i).getLocked() == 1) {
                                    %>
                                    <form method="Post" action="adminUnlock">
                                        <button name="lock" value="<%=allUsers.get(i).getSchoolEmail()%>" type="submit"
                                                uk-icon="icon: lock"></button>
                                    </form>
                                    <%
                                    } else {
                                    %>
                                    <form method="Post" action="adminLock">
                                        <button name="unlock" value="<%=allUsers.get(i).getSchoolEmail()%>"
                                                type="submit" uk-icon="icon: unlock"></button>
                                    </form>
                                    <%
                                        }
                                    %>
                                </td>
                                <td>
                                    <form method="Post" action="adminPasswordReset">
                                        <button name="email" value="<%=allUsers.get(i).getSchoolEmail()%>" type="submit"
                                                uk-icon="icon: mail"></button>
                                    </form>
                                </td>
                                <td>
                                    <form method="Post" action="adminDeleteUser">
                                        <button name="delete" value="<%=allUsers.get(i).getSchoolEmail()%>"
                                                type="submit" uk-icon="icon: trash"></button>
                                    </form>
                                </td>
                                <td>
                                    <a href="#<%=allUsers.get(i).getUsername()%>" uk-icon="icon: file-edit"
                                       uk-toggle></a>
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

        <!--Modal !-->
        <div id="createUserModal" uk-modal>
            <div class="uk-modal-dialog">
                <button class="uk-modal-close-default" type="button" uk-close></button>
                <div class="uk-modal-header">
                    <h2 class="uk-modal-title">Create User</h2>
                </div>
                <div class="uk-modal-body">
                    <form class="uk-grid-small" uk-grid method="Post" action="adminCreateUser">
                        <div class="uk-width-1-2 uk-from-controls">
                            <input name="firstName" class="uk-input" type="text" placeholder="First Name">
                        </div>
                        <div class="uk-width-1-2">
                            <label class="uk-form-label" for="lastName"> </label>
                            <input name="lastName" class="uk-input" type="text" placeholder="Last Name" required>
                        </div>
                        <div class="uk-width-1-2">
                            <input name="username" class="uk-input" type="text" placeholder="Username" required>
                        </div>
                        <div class="uk-width-1-2">
                            <input name="phoneNumber" class="uk-input" type="number" placeholder="Phone Number"
                                   required>
                        </div>
                        <div class="uk-width-1-1">
                            <input name="personalEmail" class="uk-input" type="email" placeholder="Personal Email"
                                   required>
                        </div>
                        <div class="uk-width-1-1">
                            <input name="benedictineEmail" class="uk-input" type="email" placeholder="Benedictine Email"
                                   required>
                        </div>
                        <div class="uk-width-1-2">
                            <input name="password" class="uk-input" type="password" placeholder="Password" required>
                        </div>
                        <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid uk-width-1-1">
                            <label><input class="uk-radio" type="radio" name="accountType" value="Admin"> Admin</label>
                            <label><input class="uk-radio" type="radio" name="accountType" value="User"> User</label>
                        </div>
                        <button class="uk-button uk-button-default uk-modal-close uk-width-1-2" type="button">Close
                        </button>
                        <input class="uk-button uk-button-primary uk-width-1-2" type="submit"></input>
                    </form>
                </div>
            </div>
        </div>

            <%
              for (int j = 0; j < allUsers.size(); j++) {
        %>
        <!--Edit Modal !-->
        <div id="<%=allUsers.get(j).getUsername()%>" uk-modal>
            <div class="uk-modal-dialog">
                <button class="uk-modal-close-default" type="button" uk-close></button>
                <div class="uk-modal-header">
                    <h2 class="uk-modal-title">Edit User</h2>
                </div>
                <div class="uk-modal-body">
                    <form class="uk-grid-small" uk-grid method="Post" action="adminEditUser">
                        <div class="uk-width-1-2 uk-from-controls">
                            <input  class="uk-input" name="firstNameEdit" type="text"
                                   value="<%=allUsers.get(j).getFirstName()%>">
                        </div>
                        <div class="uk-width-1-2">
                            <label class="uk-form-label" for="lastName"> </label>
                            <input id="lastName" class="uk-input" name="lastNameEdit" type="text"
                                   value="<%=allUsers.get(j).getLastName()%>">
                        </div>
                        <div class="uk-width-1-2">
                            <input id="username" class="uk-input" name="usernameEdit" type="text"
                                   value="<%=allUsers.get(j).getUsername()%>">
                        </div>
                        <div class="uk-width-1-1">
                            <input id="personalEmail" class="uk-input" name="personalEmailEdit" type="email"
                                   value="<%=allUsers.get(j).getEmail()%>">
                        </div>
                        <div class="uk-width-1-1">
                            <input id="benedictineEmail" class="uk-input" name="schoolEmailEdit" type="email"
                                   value="<%=allUsers.get(j).getSchoolEmail()%>">
                        </div>
                        <div class="uk-width-1-1">
                            <input id="password" class="uk-input" name="passwordEdit" type="password"
                                   value="<%=allUsers.get(j).getPassword()%>">
                        </div>
                        <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid uk-width-1-1">
                            <%
                                if (allUsers.get(j).getAdminLevel() == 1) {
                            %>
                            <label><input class="uk-radio" type="radio" name="accountType" value="Admin"
                                          checked="checked" required> Admin</label>
                            <label><input class="uk-radio" type="radio" name="accountType" value="User"> User</label>
                            <%
                            } else {
                            %>
                            <label><input class="uk-radio" type="radio" name="accountType" value="Admin" required> Admin</label>
                            <label><input class="uk-radio" type="radio" name="accountType" value="User"
                                          checked="checked"> User</label>
                            <%
                                }
                            %>
                        </div>
                        <button class="uk-button uk-button-default uk-modal-close uk-width-1-2" type="button">Close
                        </button>
                        <input class="uk-button uk-button-primary uk-width-1-2" type="submit"></input>
                    </form>
                </div>
            </div>
        </div>
            <%
            }
        %>
</body>
</html>