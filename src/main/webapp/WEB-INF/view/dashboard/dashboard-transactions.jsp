<div>
    <div class="uk-card uk-card-small uk-card-default uk-border-rounded">
        <%@include file="tableHeaders/transaction-table-header.jsp" %>
        <div class="uk-card-body">
            <table
                    class="uk-table uk-table-hover uk-table-middle uk-table-divider">
                <thead>
                <tr>
                    <th>Buyer</th>
                    <th>Seller</th>
                    <!--<th>Listing</th>-->
                    <!--<th>Amount</th>-->
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="transaction" items="${transactions}">
                    <tr>
                        <td class="uk-table-link">${transaction.buyer.username}</td>
                        <td class="uk-table-link">${transaction.seller.username}</td>
                        <c:if test="${transaction.completed == 0}">
                            <td class="uk-text-nowrap">In Progress</td>
                        </c:if>
                        <c:if test="${transaction.completed == 1}">
                            <td class="uk-text-nowrap">Completed</td>
                        </c:if>
                        <td class="uk-text-nowrap">
                            <div class="uk-text-right uk-float-right uk-flex-right"
                                 uk-tooltip="title: More info">
                                <a onclick="modalClick(${transaction.id}), UIkit.modal('#transaction${transaction.id}').show();"><i
                                        class="fas fa-ellipsis-v"></i></a>
                            </div>
                        </td>
                    </tr>

                    <%@include file="tableModals/transaction-details-modal.jsp" %>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>