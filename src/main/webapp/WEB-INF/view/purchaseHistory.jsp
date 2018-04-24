<%@include file="jspf/header.jsp" %>
<body class="uk-height-viewport uk-background-muted">
<div style="border: 20px solid white;
            margin: 0 auto;
            background: white;">

    <%@include file="jspf/navbar.jspf" %>

    <%@include file="jspf/messages.jsp" %>

    <div class="uk-align-center uk-section uk-background-muted">
        <div class="uk-margin">
            <h2 class="uk-heading-line uk-text-center"><span>Purchase History</span></h2>
        </div>
        <div class="uk-width-5-6 uk-align-center">
            <h3>You have made <strong
                    class="uk-text-danger uk-text-large"> ${userTransactions.size()}</strong> purchase(s)</h3>
            <div class="uk-tile uk-padding-remove-top uk-padding-remove-bottom uk-padding-remove-right uk-padding-remove-left uk-box-shadow-medium uk-box-shadow-hover-large uk-tile-default">
                <table
                        class="uk-table uk-margin-remove-top uk-table-hover uk-table-striped">
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
                                    <td>$${transaction.listingID.price}</td>
                                    <td>${transaction.listingID.endDate}</td>
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
                                            class="uk-button uk-button-small uk-button-secondary uk-border-rounded"
                                            class="purchase-history-tutorial"
                                            data-intro="Have something to say about this user? Leave a rating and review!"
                                            data-step="2">Leave Feedback</a></td>

                                </c:when>
                                <c:otherwise>
                                    <td>${transaction.listingID.name}</td>
                                    <td>${transaction.listingID.description}</td>
                                    <td>${transaction.listingID.category}</td>
                                    <td>${transaction.listingID.price}</td>
                                    <td>${transaction.listingID.endDate}</td>
                                    <td>${transaction.seller.username}</td>
                                    <c:choose>
                                        <c:when test="${transaction.transRating == 1}">
                                            <td><span uk-icon="star"></span></td>
                                        </c:when>
                                        <c:when test="${transaction.transRating == 2}">
                                            <td><span uk-icon="star"></span><span uk-icon="star"></span></td>
                                        </c:when>
                                        <c:when test="${transaction.transRating == 3}">
                                            <td><span uk-icon="star"></span><span uk-icon="star"></span><span
                                                    uk-icon="star"></span>
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
                                </c:otherwise>
                            </c:choose>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>

            </div>

            <script>

                // Start Tutorial
                window.addEventListener("load", function () {
                    $.ajax({
                        type: 'GET',
                        url: '/checkForTutorial',
                        data: {page: "transactionHistory"},
                    }).done(function (response) {
                        if (response.showTutorial == 'YES') {
                            setTimeout(function () {
                                introJs(".purchase-history-tutorial").start();
                            }, 1500);
                        }
                    });
                });

            </script>
        </div>
    </div>
</div>
</body>
<%@include file="jspf/footer.jspf" %>
</div>

</html>
