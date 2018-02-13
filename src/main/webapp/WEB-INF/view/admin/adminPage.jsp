<%--
  Created by IntelliJ IDEA.
  User: saran
  Date: 2/13/18
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../jspf/header.jsp" %>
<%@include file="../jspf/navbar.jspf" %>
<%@ page import="edu.ben.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.ben.model.Listing" %>
<body>
<div class="uk-cover-container uk-height-viewport">
    <img src="assets/server.jpg" alt="" uk-cover>
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

                                        <table class="uk-table uk-table-large uk-table-middle uk-table-divider">
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
                    <div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
