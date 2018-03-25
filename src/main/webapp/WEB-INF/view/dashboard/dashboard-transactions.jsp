<div>
    <div class="uk-card uk-card-small uk-card-default uk-border-rounded">
        <%@include file="tableHeaders/transaction-table-header.jsp" %>
        <div class="uk-card-body">
            <div class="uk-overflow-auto">
                <table
                        class="uk-table uk-table-hover uk-table-middle uk-table-divider">
                    <tbody>
                    <c:forEach var="transaction" items="${transactions}">
                        <tr>
                            <td><img class="uk-preserve-width uk-border-circle"
                                     uk-tooltip="${transaction.buyer.username}"
                                     src="${pageContext.request.contextPath}/resources/img/profile-pic/default.jpeg"
                                     height="auto" width="40" alt=""></td>
                            <td><img class="uk-preserve-width uk-border-circle"
                                     uk-tooltip="${transaction.seller.username}"
                                     src="${pageContext.request.contextPath}/resources/img/profile-pic/default.jpeg"
                                     height="auto" width="40" alt=""></td>
                            <td class="uk-table-link">${transaction.listingID.name}</td>
                            <td class="uk-preserve-width">${transaction.offerID.offerAmount}</td>
                            <c:if test="${transaction.completed == 0}">
                                <td class="uk-text-nowrap">In Progress</td>
                            </c:if>
                            <c:if test="${transaction.completed == 1}">
                                <td class="uk-text-nowrap">Completed</td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>