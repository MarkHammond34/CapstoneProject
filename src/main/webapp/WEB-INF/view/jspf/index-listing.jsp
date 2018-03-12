<div class="uk-card uk-card-default uk-border-rounded uk-padding-small uk-card-small uk-card-body">
    <div class="uk-align-center uk-margin-remove-bottom" uk-lightbox>
        <a href="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
           title="Image" class="thumbnail"><img
                src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                alt="Listing" style="max-height: 225px; max-width: 275px;"/></a>
    </div>

    <!-- Name -->
    <div class="name uk-margin-remove-top uk-margin-small-bottom" style="font-size: 22px;">

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

    <!-- Button & Price -->
    <c:choose>
        <c:when test="${listing.type == 'auction'}">
            <c:choose>
                <c:when test="${listing.delay < 0}">
                    <div class="uk-animation-toggle">
                        <div class="uk-animation-shake uk-animation-reverse">
                            <div class="price" style="font-size: 16px;">
                                <span class="uk-badge">Current Bid: $${listing.highestBid}</span>
                                <a
                                        class="uk-button uk-button-text"
                                        style="color: red; margin-left: 5px;"
                                        id="bidButton${listing.id}">Place
                                    Bid</a>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="price" style="font-size: 16px;">
                        <span class="uk-badge">Current Bid: $${listing.highestBid}</span>
                        <a
                                class="uk-button uk-button-text" style="color: cornflowerblue; margin-left: 5px"
                                uk-toggle="target: #placeBidModal${listing.id}" id="bidButton${listing.id}">Place
                            Bid</a>
                        <c:if test="${listing.highestBidder.userID == sessionScope.user.userID}">
                            <a title="Cancel Bid" uk-icon="icon: ban"
                               uk-toggle="target: #cancelBid${listing.id}Modal"
                               style="margin-left: 10px; color: red;"></a>
                        </c:if>
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="uk-grid-small" uk-grid>
                <div class=" uk-width-1-1 uk-align-center uk-margin-remove-bottom">
                    <p class="uk-margin-small-bottom uk-margin-small-top uk-align-center listing-ended"
                       style="color: red; font-size: 16px; display: none;">
                        <br>
                        Listing Ended</p>
                    <div class="uk-grid-small uk-countdown uk-margin-remove uk-align-center" uk-grid
                         uk-countdown="date: ${listing.endTimestamp}">
                        <span class="uk-days">
                            <strong class="uk-countdown-number uk-countdown-days"></strong>
                            <strong class="uk-countdown-label uk-margin-small-top uk-margin-left">Days</strong>
                        </span>
                        <span class="uk-hours">
                            <strong class="uk-countdown-number uk-countdown-hours"></strong>
                            <strong class="uk-countdown-label uk-margin-small-top uk-margin-left">Hours</strong>
                        </span>
                        <span class="uk-minutes">
                            <strong class="uk-countdown-number uk-countdown-minutes"></strong>
                            <strong class="uk-countdown-label uk-margin-small-top uk-margin-left">Minutes</strong>
                        </span>
                        <span class="uk-seconds">
                            <strong class="uk-countdown-number uk-countdown-seconds"></strong>
                            <strong class="uk-countdown-label uk-margin-small-top uk-margin-left">Seconds</strong></strong>
                        </span>
                    </div>
                    <progress id="js-progressbar"
                              class="uk-progress uk-margin-remove-top" value="0"
                              max="${listing.endTimestampAsLong}">
                    </progress>
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