<%@include file="admin-header.jsp" %>

<body>

<%@include file="admin-navbar.jsp" %>

<%@include file="../jspf/messages.jsp" %>

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
                        <a class="uk-button uk-button-default uk-position-top-right" href="#createUserModal" uk-toggle
                           hidden>Create
                            User</a>
                        <h3 class="uk-heading-divider">Listings</h3>
                        <table class="uk-table uk-table-small uk-table-hover u-table-middle uk-table-divider">
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
</body>
</html>