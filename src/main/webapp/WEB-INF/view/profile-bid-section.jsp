<div class="uk-grid-collapse uk-text-center" uk-grid>
    <div class="uk-width-1-1">
        <div class="uk-tile uk-tile-default uk-padding-small">
            <p style="float:left;" class="uk-h4">Active (${activeCount})</p>
        </div>
        <c:if test="${listingsActive != null}">
            <div class="uk-child-width-1-3@m uk-grid-small uk-text-center" uk-grid>
                <c:forEach var="listing" items="${listingsActive}">
                    <div class="uk-card uk-card-muted uk-card-small uk-card-body">
                        <div class="uk-align-center" style="margin-bottom: -5%;" uk-lightbox>
                            <a href="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                               title="Image" class="thumbnail"><img
                                    src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                                    alt="Listing"/></a>
                        </div>
                        <div class="name" style="font-size: 22px;">
                            <a href="#"><strong class="uk-text-danger">${listing.name}</strong></a>
                            <a title="Cancel Bid" uk-icon="icon: ban" style="color: red"
                               uk-toggle="target: #cancelBidModal${listing.id}" class="uk-float-right"></a>
                        </div>
                        <div class="price" style="font-size: 16px;">
                            <span class="uk-badge"
                                  id="currentBid${listing.id}">Current Bid: $${listing.highestBid}</span>
                            <a
                                    class="uk-button uk-button-text" style="color: cornflowerblue; margin-left: 5px"
                                    uk-toggle="target: #placeBidModal${listing.id}" id="bidButton${listing.id}">Place
                                Bid</a>
                        </div>
                        <hr>
                        <div style="margin-left: 8%;" id="countdown"
                             class="uk-grid-small" uk-grid
                             uk-countdown="date: ${listing.endTimestamp}">
                            <div>
                                <div class="uk-countdown-label uk-text-center uk-visible@s">Days</div>
                                <div class="uk-countdown-number uk-countdown-days"></div>
                            </div>
                            <div>
                                <div class="uk-countdown-label uk-text-center uk-visible@s">Hours</div>
                                <div class="uk-countdown-number uk-countdown-hours"></div>
                            </div>
                            <div>
                                <div class="uk-countdown-label uk-text-center uk-visible@s">Minutes</div>
                                <div class="uk-countdown-number uk-countdown-minutes"></div>
                            </div>
                            <div>
                                <div class="uk-countdown-label uk-text-center uk-visible@s">Seconds</div>
                                <div class="uk-countdown-number uk-countdown-seconds"></div>
                            </div>
                        </div>
                    </div>
                    <%@include file="jspf/bid-buy-modals.jsp" %>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${listingsActive == null}">
            <p>No Active Listings</p>
        </c:if>
    </div>

    <div class="uk-width-1-1">
        <div class="uk-tile uk-tile-default uk-padding-small">
            <p style="float:left;" class="uk-h4">Won (${wonCount})</p>
        </div>
        <c:if test="${listingsWon != null}">
            <div class="uk-child-width-1-3@m uk-grid-small" uk-grid>
                <c:forEach var="listing" items="${listingsWon}">
                    <div class="uk-card uk-card-muted uk-card-small uk-card-body">
                        <div class="uk-align-center" style="margin-bottom: -5%;" uk-lightbox>
                            <a href="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                               title="Image" class="thumbnail"><img
                                    src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                                    alt="Listing"/></a>
                        </div>
                        <div class="name" style="font-size: 20px;">
                            <a href="#"><strong class="uk-text-danger">${listing.name}</strong></a>
                        </div>
                        <div class="price" style="font-size: 16px;">
                            <span class="uk-badge">Winning Bid: $${listing.highestBid}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${listingsWon == null}">
            <p>No Listings Won</p>
        </c:if>
    </div>

    <div class="uk-width-1-1">
        <div class="uk-tile uk-tile-default uk-padding-small">
            <p style="float:left;" class="uk-h4">Lost (${lostCount})</p>
        </div>
        <c:if test="${listingsLost != null}">
            <div class="uk-child-width-1-3@m uk-grid-small" uk-grid>
                <c:forEach var="listing" items="${listingsLost}">
                    <div class="uk-card uk-card-muted uk-card-small uk-card-body">
                        <div class="uk-align-center" style="margin-bottom: -5%;" uk-lightbox>
                            <a href="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                               title="Image" class="thumbnail"><img
                                    src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                                    alt="Listing"/></a>
                        </div>
                        <div class="name" style="font-size: 20px;">
                            <a href="#"><strong class="uk-text-danger">${listing.name}</strong></a>
                        </div>
                        <div class="price" style="font-size: 16px;">
                            <span class="uk-badge">Winning Bid: $${listing.highestBid}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${listingsLost == null}">
            <p>No Listings Lost</p>
        </c:if>
    </div>
</div>