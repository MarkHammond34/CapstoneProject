<%@include file="jspf/header.jsp" %>
<div style="border: 20px solid white;
            margin: 0 auto;
            background: white;">
    <body class="uk-background-muted uk-height-viewport">

    <%@include file="jspf/navbar.jspf" %>

    <%@include file="jspf/messages.jsp" %>

    <div id="central" class="uk-width-4-5 uk-align-center">
        <h2 data-intro="Keep track of your drafts!" data-step="1">
            <strong class="uk-text-danger"> ${user.username}</strong> has <strong
                class="uk-text-danger"> ${userDrafts.size()}</strong>
            draft(s)
        </h2>
        <p></p>
        <p></p>


        <p></p>
        <!-- <div class="uk-grid-large uk-text-center"> -->
        <table
                class="uk-table uk-table-hover uk-table-striped uk-table-condensed">
            <thead>
            <tr>
                <th>Item Name</th>
                <th>Item Description</th>
                <th>Category</th>
                <th>Sub Category</th>
                <th>Auction Type</th>
                <th>Price</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="draft" items="${userDrafts}">
                <tr>
                    <td>${draft.name}</td>
                    <td>${draft.description}</td>
                    <td>${draft.category}</td>
                    <td>${draft.subCategory}</td>
                    <td>${draft.type}</td>
                    <td>$${draft.price}</td>
                    <td><a class="uk-button uk-button-secondary uk-border-rounded"
                           href="${pageContext.request.contextPath}/createListingDraft?id=${draft.id}">Edit & Publish</a></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>

    </div>
    <%@include file="jspf/footer.jspf" %>
    </body>

</div>

</html>
