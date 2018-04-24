<div>
    <div class="uk-card uk-card-small uk-card-default uk-border-rounded">
        <%@include file="tableHeaders/offer-table-header.jsp" %>
        <div class="uk-card-body">
                <table
                        class="uk-table uk-table-hover uk-table-middle uk-table-divider">
                    <thead>
                    <tr>
                        <!--<th>User</th>-->
                        <th>Listing</th>
                        <th>Amount</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="offer" items="${offers}">
                        <tr>
                            <!--<td><img class="uk-preserve-width uk-border-circle"
                                     uk-tooltip="${offer.offerMaker.username}"
                                     src="${pageContext.request.contextPath}/resources/img/listings/default.jpeg"
                                     height="auto" width="40" alt=""></td>-->
                            <td class="uk-text-truncate">${offer.listingID.name}</td>
                            <td class="uk-preserve-width">${offer.offerAmount}</td>
                            <td class="uk-text-nowrap">${offer.status}</td>
                            <td class="uk-text-nowrap">
                                <div class="uk-text-right uk-float-right uk-flex-right"
                                     uk-tooltip="title: More info">
                                    <a onclick="modalClick(${offer.offerID}), UIkit.modal('#offer${offer.offerID}').show();"><i
                                            class="fas fa-ellipsis-v"></i></a>
                                    <!--<button value="${offer.offerID}" class="uk-button" onclick="modalClick(this.value)">Button</button>-->
                                </div>
                            </td>
                        </tr>
                        <%@include file="tableModals/offer-details-modal.jsp" %>
                    </c:forEach>
                    </tbody>
                </table>
        </div>
    </div>
</div>