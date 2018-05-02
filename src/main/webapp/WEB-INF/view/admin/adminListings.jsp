<%@include file="admin-header.jsp" %>

<body>

<%@include file="admin-navbar.jsp" %>

<%@include file="../jspf/messages.jsp" %>

<div class="uk-cover-container uk-background-muted uk-padding-small uk-height-viewport">
    <div class="uk-margin-bottom uk-flex uk-flex-column">
        <ul uk-switcher hidden>
            <li>
                <a href="#dashboardUserTable" hidden></a>Users
            </li>
            <li>
                <a href="#dashboardListingsTable" hidden></a>Listings
            </li>
        </ul>
        <div id="dashboardUserTable"
             class="uk-switcher uk-card uk-padding-small uk-margin-large uk-box-shadow-large uk-box-shadow-hover-large uk-card-default uk-card-large uk-card-body uk-width-3-4 uk-position-large uk-position-top-center">
            <div class="uk-margin-bottom">
                <div class="uk-child-width-3-4 uk-margin-bottom" uk-grid>
                    <a class="uk-button uk-button-default uk-padding-small uk-position-top-right"
                       href="#createUserModal" uk-toggle
                       hidden>Create
                        User</a>
                    <h2 class="uk-heading-line uk-text-center"><span>Admin Listings Panel</span></h2>
                    <table class="uk-table uk-table-small uk-table-hover uk-table-middle uk-table-divider uk-margin">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Delete/Activate</th>
                            <th>Edit</th>

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
                            <td><%=allListings.get(i).getName()%>
                            </td>
                            <td><%=allListings.get(i).getUser().getUsername()%>
                            </td>
                            <td><%=allListings.get(i).getCategory()%>
                            </td>
                            <td><%=allListings.get(i).getPrice()%>
                            </td>
                            <td>
                                <%
                                    if (allListings.get(i).getActive() == 1) {
                                %>
                                <form method="Post" action="adminInactivateListing">
                                    <button name="adminInactivateListing" value="<%=allListings.get(i).getId()%>"
                                            type="submit"
                                            uk-icon="icon: trash" uk-tooltip="Delete this listing"></button>
                                </form>
                                <%
                                } else {
                                %>
                                <form method="Post" action="adminActivateListing">
                                    <button name="adminActivateListing" value="<%=allListings.get(i).getId()%>"
                                            type="submit" uk-icon="icon: check"
                                            uk-tooltip="Activate this listing"></button>
                                        <%
                                        }
                                    %>
                            </td>
                            <td>
                                <a href="/editListing?id=<%=allListings.get(i).getId()%>" uk-icon="icon: file-edit"
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
</div>
<%@include file="../jspf/footer.jspf" %>
</body>
</html>