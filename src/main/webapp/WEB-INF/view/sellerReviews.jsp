<%@include file="jspf/header.jsp" %>


<body class="uk-height-viewport uk-background-muted">
<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div class="uk-align-center uk-section uk-background-muted">
    <div class="uk-margin uk-card uk-card-default uk-card-body">
        <h2><strong><div class="uk-text-bold uk-text-center uk-text-uppercase"> Seller Reviews</div></strong></h2>
    </div>
    <div class="uk-width-3-4 uk-align-center">
        <h3><strong class="uk-text-danger uk-text-large"> ${user.username}</strong> has <strong
                class="uk-text-danger"> ${sellerTransactions.size()}</strong> seller review(s)</h3>
        <div class="uk-tile uk-padding-remove-top uk-padding-remove-bottom uk-padding-remove-right uk-padding-remove-left uk-box-shadow-medium uk-box-shadow-hover-large uk-tile-default">
            <table
                    class="uk-table uk-margin-remove-top uk-table-hover uk-table-striped">
                <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Buyer</th>
                    <th>Transaction Rating</th>
                    <th>Transaction Review</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="transaction" items="${sellerTransactions}">
                    <tr>
                        <td>${transaction.listingID.name}</td>
                        <td>${transaction.buyer.username}</td>
                        <c:choose>
                            <c:when test="${transaction.transRating == 1}">
                                <td><span uk-icon="star"></span></td>
                            </c:when>
                            <c:when test="${transaction.transRating == 2}">
                                <td><span uk-icon="star"></span><span uk-icon="star"></span></td>
                            </c:when>
                            <c:when test="${transaction.transRating == 3}">
                                <td><span uk-icon="star"></span><span uk-icon="star"></span><span uk-icon="star"></span>
                                </td>
                            </c:when>
                            <c:when test="${transaction.transRating == 4}">
                                <td><span uk-icon="star"></span><span uk-icon="star"></span><span
                                        uk-icon="star"></span><span
                                        uk-icon="star"></span></td>
                            </c:when>
                            <c:when test="${transaction.transRating == 5}">
                                <td><span uk-icon="star"></span><span uk-icon="star"></span><span
                                        uk-icon="star"></span><span
                                        uk-icon="star"></span><span uk-icon="star"></span></td>
                            </c:when>
                        </c:choose>
                        <td>${transaction.transReview}</td>
                        <td></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%@include file="jspf/footer.jspf" %>
</body>


</html>
