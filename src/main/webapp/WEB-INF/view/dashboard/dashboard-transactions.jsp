<div>
    <div class="uk-card uk-card-small uk-card-default uk-border-rounded">
        <%@include file="tableHeaders/transaction-table-header.jsp" %>
        <div class="uk-card-body">
            <div class="uk-overflow-auto">
                <table
                        class="uk-table uk-table-hover uk-table-middle uk-table-divider">
                    <thead>
                    <tr>
                        <th>User</th>
                        <th>Listing</th>
                        <th>Amount</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="transaction" items="${transactions}">
                        <tr>
                            <c:choose>
                                <c:when test="${user.userID == transaction.buyer.userID}">
                                    <td><img class="uk-preserve-width uk-border-circle"
                                             uk-tooltip="${transaction.buyer.username}"
                                             src="${pageContext.request.contextPath}/resources/img/listings/default.jpeg"
                                             height="auto" width="40" alt=""></td>
                                </c:when>
                                <c:otherwise>
                                    <td><img class="uk-preserve-width uk-border-circle"
                                             uk-tooltip="${transaction.seller.username}"
                                             src="${pageContext.request.contextPath}/resources/img/listings/default.jpeg"
                                             height="auto" width="40" alt=""></td>
                                </c:otherwise>
                            </c:choose>
                            <td class="uk-table-link">${transaction.listingID.name}</td>
                            <td class="uk-preserve-width">${transaction.offerID.offerAmount}</td>
                            <c:if test="${transaction.completed == 0}">
                                <td class="uk-text-nowrap">In Progress</td>
                            </c:if>
                            <c:if test="${transaction.completed == 1}">
                                <td class="uk-text-nowrap">Completed</td>
                            </c:if>
                            <td class="uk-text-nowrap">
                                <div class="uk-text-right uk-float-right uk-flex-right"
                                     uk-tooltip="title: More info">
                                    <i class="fas fa-ellipsis-v"></i>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>