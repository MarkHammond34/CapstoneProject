<%@include file="jspf/header.jsp" %>

<body>

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<hr>

<div class="uk-background-muted">

    <div class="uk-section" uk-grid>

        <!-- LEFT SIDE -->
        <div class="uk-width-2-5@m uk-margin-medium-left uk-margin-medium-top">
            <div class="uk-position-relative uk-margin-small">
                <div class="uk-position-relative" uk-slideshow="animation: fade">

                    <ul class="uk-slideshow-items">
                        <li><img class="uk-thumbnail uk-thumbnail-large"
                                 src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                                 alt="" uk-cover style="margin: auto;">
                        </li>
                        <li><img class="uk-thumbnail uk-thumbnail-large"
                                 src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                                 alt="" uk-cover style="margin: auto;">
                        </li>
                        <li><img class="uk-thumbnail uk-thumbnail-large"
                                 src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                                 alt="" uk-cover style="margin: auto;"></li>
                    </ul>

                    <div class="uk-position-small">
                        <ul class="uk-thumbnav uk-child-width-1-3">
                            <li uk-slideshow-item="0"><a href="#"> <img
                                    class="uk-thumbnail uk-margin-small-left"
                                    src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                                    width="100" alt="">
                            </a></li>
                            <li uk-slideshow-item="1"><a href="#"> <img
                                    class="uk-thumbnail"
                                    src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                                    width="100" alt="">
                            </a></li>
                            <li uk-slideshow-item="2"><a href="#"> <img
                                    class="uk-thumbnail"
                                    src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                                    width="100" alt="">
                            </a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>

        <!-- RIGHT SIDE -->

        <c:if test="${listing.type.equals('fixed')}">
            <div class="uk-width-2-5@m">

                <div class="uk-card uk-card-body">

                    <h1 class="uk-article-title uk-margin-remove-top">
                            ${listing.name}
                    </h1>

                    <p class="uk-text-lead uk-margin-medium-left">${listing.description}</p>

                    <div class="uk-grid-small uk-child-width-auto" uk-grid>
                        <span class="uk-badge">Price $${listing.price} </span>
                    </div>

                    <c:if test="${listing.ended == 0}">
                        <a
                                <c:if test="${hasOffer}">onclick="return confirm('You have already made an offer for this listing. Making a new one will replace the current one. Is this okay?');"</c:if>
                                class="uk-button uk-button-text uk-float-right"
                                style="color: green;"
                                href="${pageContext.request.contextPath}/makeOffer?listing=${listing.id}">Make
                            offer</a>
                    </c:if>
                </div>
            </div>
        </c:if>

        <c:if test="${listing.type.equals('auction')}">
            <div class="uk-width-1-2@m">

                <div class="uk-card uk-card-body">
                    <article class="uk-article">

                        <h1 class="uk-article-title uk-margin-remove-top">
                            <p>${listing.name}</p>
                        </h1>

                        <p class="uk-text-lead">${listing.description}</p>

                        <div class="uk-grid-small uk-child-width-auto uk-tile-default uk-padding uk-padding-remove-left"
                             uk-grid>
                            <!-- Highest Bid Section -->
                            <ul class="uk-grid-small uk-width-2-3 uk-float-left" uk-grid>
                                <li class="uk-width-1-1">
                                    <c:choose>
                                        <c:when test="${listing.ended == 0}">
                                                <span class="uk-float-left"><strong>Highest Bid:</strong>
                                                    <span class="uk-badge"> $${listing.highestBid}</span>
                                                </span>
                                        </c:when>
                                        <c:otherwise>
                                                <span class="uk-float-left"><strong>Winning Bid:</strong>
                                                    <span class="uk-badge"> $${listing.highestBid}</span>
                                                </span>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li class="uk-width-1-1">
                                    <span class="uk-float-left">
                                        <b>Highest Bidder:</b>
                                        <strong>${listing.highestBidder.username}</strong>
                                        <c:if test="${listing.highestBidder.userID == user.userID}">
                                                <a title="Cancel Bid" uk-icon="icon: ban"
                                                   uk-toggle="target: #cancelBid${listing.id}Modal"
                                                   style="color: red;"></a>
                                        </c:if>
                                    </span>
                                </li>
                                <li class="uk-width-1-1">
                                    <span class="uk-float-left">
                                        <b>Bid Count:</b>
                                        <strong>${listing.bidCount}</strong>
                                    </span>
                                </li>
                            </ul>

                            <!-- Place Bid Button -->
                            <div class="uk-width-1-3 uk-float-right uk-text-right">
                                <c:choose>
                                    <c:when test="${listing.ended == 0}">
                                        <c:if test="${listing.user.userID != user.userID}">
                                            <a id="placeBidButton" class="uk-button uk-button-text bid-button"
                                               style="color: cornflowerblue;"
                                               onclick="toggleBid();">Place Bid</a>
                                        </c:if>

                                        <div class="uk-margin-small-top">
                                            <form method="post" action="/bid"
                                                  class="uk-grid-small bid-form"
                                                  uk-grid id="bidForm" style="display: none;">
                                                <input class="uk-input uk-width-4-5 uk-float-left uk-border-rounded"
                                                       name="bidValue"
                                                       type="number"
                                                       min="${listing.highestBid}">
                                                <a class="uk-width-1-5 uk-float-right uk-padding-remove"
                                                   uk-icon="icon: check; ratio: 1.50" title="Place Bid"
                                                   onclick="document.getElementById('bidForm').submit();"></a>
                                                <input name="listingID" type="hidden" value="${listing.id}">
                                            </form>
                                        </div>

                                        <c:if test="${sessionScope.user.userID == listing.highestBidder.userID}">
                                            <form method="post" action="/pick-up-review" id="pickUpForm"
                                                  style="display: none;">
                                                <input type="hidden" name="listingID" value="${listing.id}">
                                                <a class="uk-button uk-button-text"
                                                   style="color: cornflowerblue; margin-left: 5px;"
                                                   onclick="document.getElementById('pickUpForm').submit();">View
                                                    Pick Up</a>
                                            </form>
                                        </c:if>

                                    </c:when>

                                    <c:otherwise>
                                        <c:if test="${sessionScope.user.userID == listing.highestBidder.userID}">
                                            <form method="post" action="/pick-up-review" id="pickUpForm2">
                                                <input type="hidden" name="listingID" value="${listing.id}">
                                                <a class="uk-button uk-button-text"
                                                   style="color: cornflowerblue; margin-left: 5px"
                                                   onclick="document.getElementById('pickUpForm2').submit();">View Pick
                                                    Up</a>
                                            </form>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Countdown and Progress Bar -->
                        <div class="uk-grid-small" uk-grid>
                            <div class=" uk-width-1-1 uk-align-center">
                                <p class="uk-margin-small-bottom uk-margin-small-top uk-align-center listing-ended"
                                   style="color: red; font-size: 16px; display: none;">
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
                                          max="100">
                                </progress>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </c:if>

    </div>

</div>
</body>
<%@include file="jspf/bid-buy-modals.jsp" %>
<%@include file="jspf/footer.jspf" %>
<script>
    function toggleBid() {
        if (document.getElementById("bidForm").style.display == 'inline') {
            document.getElementById("bidForm").style.display = "none";
        } else {
            document.getElementById("bidForm").style.display = "inline";
        }
    }
</script>
</html>