<%@include file="jspf/header.jsp" %>

<body class="uk-background-muted">

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div id="central" class="uk-width-4-5 uk-align-center transaction-tutorial">
    <h2 data-intro="Keep track of your transactions on the purchase history page!" data-step="1">
        <strong class="uk-text-danger"> ${user.username}</strong> has made <strong
            class="uk-text-danger"> ${userTransactions.size()}</strong>
        purchase(s)
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
            <th>Price</th>
            <th>Purchase Date</th>
            <th>Seller</th>
            <th>Transaction Rating</th>
            <th>Transaction Review</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="transaction" items="${userTransactions}">
            <tr>
                <c:choose>
                    <c:when test="${transaction.feedbackLeft < 1}">
                        <td>${transaction.listingID.name}</td>
                        <td>${transaction.listingID.description}</td>
                        <td>${transaction.listingID.category}</td>
                        <td>${transaction.listingID.price}</td>
                        <td>${transaction.listingID.dateCreated}</td>
                        <td>${transaction.seller.username}</td>
                        <c:choose>
                            <c:when test="${transaction.transRating < 1}">
                                <td></td>
                            </c:when>
                            <c:otherwise>
                                <td>${transaction.transRating}</td>
                            </c:otherwise>
                        </c:choose>
                        <td></td>
                        <td>${transaction.transReview}</td>

                        <td><a
                                href="${pageContext.request.contextPath}/rateReview?id=${transaction.id}"
                                class="uk-button uk-button-small uk-button-primary" class=""
                                data-intro="Have something to say about this user? Leave a rating and review!"
                                data-step="2">Leave Feedback</a></td>

                    </c:when>
                    <c:otherwise>
                        <td>${transaction.listingID.name}</td>
                        <td>${transaction.listingID.description}</td>
                        <td>${transaction.listingID.category}</td>
                        <td>${transaction.listingID.price}</td>
                        <td>${transaction.listingID.dateCreated}</td>
                        <td>${transaction.seller.username}</td>
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
                                <td><span uk-icon="star"></span><span uk-icon="star"></span><span uk-icon="star"></span><span
                                        uk-icon="star"></span></td>
                            </c:when>
                            <c:when test="${transaction.transRating == 5}">
                                <td><span uk-icon="star"></span><span uk-icon="star"></span><span uk-icon="star"></span><span
                                        uk-icon="star"></span><span uk-icon="star"></span></td>
                            </c:when>
                        </c:choose>
                        <td>${transaction.transReview}</td>
                    </c:otherwise>
                </c:choose>
            </tr>

        </c:forEach>
        </tbody>
    </table>

</div>

<script>

    window.addEventListener("load", function () {
        if (document.getElementById("yes").style.display == "inline") {
            setTimeout(function () {
                introJs(".transaction-tutorial").start();
            }, 2000);
        }
    });

</script>

<c:if test="${showTutorial == true}">
    <p id="yes" style="display: inline;"></p>
</c:if>

</body>
<%@include file="jspf/footer.jspf" %>

</html>
