<div class="uk-card uk-card-muted uk-card-small uk-card-body">
    <div class="uk-align-center" style="margin-bottom: -5%;" uk-lightbox>
        <a href="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
           title="Image" class="thumbnail"><img
                src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                alt="Listing"/></a>
    </div>
    <div class="name" style="font-size: 22px;">

        <a href="#"><strong class="uk-text-danger">${listing.name}</strong></a>
        <c:if test="${listing.user.getUserID() != sessionScope.user.userID }">
            <div
                    class="watch-item color1 uk-position-medium uk-position-top-right"
                    id="${listing.id}">
                <a uk-icon="icon: star; ratio: 1"></a>
            </div>
            <div
                    class="watch-item color2 uk-position-medium uk-position-top-right"
                    id="${listing.id}" style="display: none;">
                <a uk-icon="icon: star; ratio: 2"></a>
            </div>
        </c:if>
    </div>

    <c:choose>
        <c:when test="${listing.type == 'auction'}">
            <div class="price" style="font-size: 16px;">
                <span class="uk-badge">Current Bid: $${listing.highestBid}</span>
                <a
                        class="uk-button uk-button-text" style="color: cornflowerblue; margin-left: 5px"
                        uk-toggle="target: #placeBidModal${listing.id}" id="bidButton${listing.id}">Place Bid</a>
                <c:if test="${listing.highestBidder.userID == user.userID && listing.ended == 0}">
                    <a title="Cancel Bid" uk-icon="icon: ban"
                       uk-toggle="target: #cancelBid${listing.id}Modal" style="margin-left: 10px; color: red;"></a>
                </c:if>
            </div>
            <hr>
            <div style="margin-left: 8%;"
                 id="countdown${listing.id}" class="uk-grid-small" uk-grid
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
        </c:when>
        <c:when test="${listing.type == 'fixed'}">
            <div class="price" style="font-size: 16px;">
                            <span class="uk-badge"
                                  id="currentBid${listing.id}">Price: $${listing.price}</span>
                <button class="uk-button uk-button-default uk-button-small" style="margin-left: 5px"
                        uk-toggle="target: #buyItNowModal${listing.id}">Buy
                </button>
            </div>
        </c:when>
    </c:choose>
</div>
<%@include file="bid-buy-modals.jsp" %>