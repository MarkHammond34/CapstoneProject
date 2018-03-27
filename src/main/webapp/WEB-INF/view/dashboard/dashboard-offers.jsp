<div>
    <div class="uk-card uk-card-small uk-card-default uk-border-rounded">
        <%@include file="tableHeaders/offer-table-header.jsp" %>
        <div class="uk-card-body">
            <div class="uk-overflow-auto">
                <table
                        class="uk-table uk-table-hover uk-table-middle uk-table-divider">
                    <tbody>
                    <c:forEach var="offer" items="${offers}">
                        <tr>
                            <td><img class="uk-preserve-width uk-border-circle"
                                     uk-tooltip="${offer.userID.username}"
                                     src="${pageContext.request.contextPath}/resources/img/profile-pic/default.jpeg"
                                     height="auto" width="40" alt=""></td>
                            <c:if
                                    test="${offer.offerMessage != null && offer.offerMessage.length() > 0}">
                                <td class="uk-preserve-width">${offer.offerMessage}</td>
                            </c:if>
                            <td class="uk-preserve-width">${offer.offerAmount}</td>
                            <td class="uk-text-nowrap">${offer.status}</td>
                            <td>
                                <ul>
                                    <li>
                                        <button>Accept</button>
                                    </li>
                                    <li>
                                        <button>Reject</button>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- <div
class="uk-panel uk-panel-scrollable uk-resize-vertical uk-height-large uk-padding-remove uk-background-secondary uk-border-rounded">
<ul class="uk-nav uk-nav-default uk-child-width-1-3@m" uk-grid>
<c:forEach var="listing" items="${listings}">
    <li class="uk-padding-small"><div class="uk-panel uk-width-auto">
    <a
    href="${pageContext.request.contextPath}/listing?listingId=${listing.id}"><img
    height="auto" width="85%"
    class="uk-border-rounded uk-box-shadow-hover-large"
    src="${pageContext.request.contextPath}/resources/img/listings/Wolverine.jpg"
    alt=""></a>
    </div></li>
</c:forEach>
</ul>
</div> -->