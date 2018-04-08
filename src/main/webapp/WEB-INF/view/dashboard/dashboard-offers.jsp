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
                                     uk-tooltip="${offer.offerMaker.username}"
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
                                    <c:if test="${offer.offerMaker.userID == user.userID && !offer.status.equals('countered')}">
                                        <li>
                                            <button href="">Accept</button>
                                        </li>
                                        <li>
                                            <button href="">Reject</button>
                                        </li>
                                        <li>
                                            <form method="get" action="/counterOffer">
                                                <div class="uk-width-1-1">
                                                    <input type="hidden" name="offerID" value="${offer.offerID}">
                                                    <button type="submit"
                                                            class="btn btn-primary">Counter
                                                    </button>
                                                </div>
                                            </form>
                                        </li>
                                    </c:if>
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