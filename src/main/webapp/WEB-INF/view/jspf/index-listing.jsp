<div class="uk-card uk-card-muted uk-card-small uk-card-body">
    <div class="uk-align-center" style="margin-bottom: -5%;" uk-lightbox>
        <a href="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
           title="Image" class="thumbnail"><img
                src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                alt="Listing"/></a>
    </div>
    <div class="name" style="font-size: 22px;">
        <a href="#"><strong class="uk-text-danger">${listing.name}</strong></a>
    </div>
    <c:choose>
        <c:when test="${listing.type == 'auction'}">
            <div class="price" style="font-size: 16px;">
                            <span class="uk-badge"
                                  id="currentBid${listing.id}">Current Bid: $${listing.highestBid}</span>
                <button class="uk-button uk-button-default uk-button-small" style="margin-left: 5px"
                        uk-toggle="target: #placeBidModal">Place Bid
                </button>
            </div>
            <hr>
            <div style="margin-left: 8%;"
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
        </c:when>
        <c:when test="${listing.type == 'fixed'}">
            <div class="price" style="font-size: 16px;">
                            <span class="uk-badge"
                                  id="currentBid${listing.id}">Price: $${listing.price}</span>
                <button class="uk-button uk-button-default uk-button-small" style="margin-left: 5px"
                        uk-toggle="target: #buyItNowModal">Buy
                </button>
            </div>
        </c:when>
    </c:choose>
</div>
<%@include file="bid-buy-modals.jsp" %>