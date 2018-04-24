<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
    <div class="uk-float-left">
        <ul class="uk-iconnav uk-iconnav-vertical">
            <li><a href="#" uk-icon="icon: plus"></a></li>
            <li><a href="edit?listing=${listing.id}" uk-icon="icon: file-edit"></a></li>
            <li><a href="#" uk-icon="icon: copy"></a></li>
            <li><a href="#" uk-icon="icon: trash"></a></li>
        </ul>
    </div>
    <div class="uk-card uk-card-default uk-border-rounded uk-float-left" style="max-width: 55%">
        <div class="uk-card-media-top">
            <div uk-slideshow="autoplay-interval: 2000" uk-slideshow>
                <ul class="uk-slideshow-items">
                    <c:forEach items="${listing.images}" var="listingImages">
                        <div uk-lightbox>
                            <li>
                                <div class="uk-position-center uk-dark">
                                    <img class="thumbnail"
                                         src="${pageContext.request.contextPath}/directory/${listingImages.image_path}/${listingImages.image_name}"
                                         alt="Listing">
                                    <div class="uk-visible-toggle">
                                        <div class="uk-invisible-hover uk-overlay-default uk-position-cover">
                                            <div class="uk-position-center">
                                                <a href="${pageContext.request.contextPath}/directory/${listingImages.image_path}/${listingImages.image_name}"
                                                   title="Image"><span uk-icon="icon: search; ratio: 2"></span></a>
                                            </div>
                                        </div>
                                    </div>
                                    <input class="timestamp" data-timestamp="${listing.dateCreated.getTime()}"
                                           type="hidden">

                                </div>
                            </li>
                        </div>
                    </c:forEach>
                </ul>
                <a class="uk-position-top-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous
                   uk-slideshow-item="previous"></a>
                <a class="uk-position-top-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next
                   uk-slideshow-item="next"></a>

            </div>
        </div>
        <div class="uk-card-body">
            <!-- Name -->
            <h3 class="uk-card-title" style="font-size: medium"><a href="/listing?l=${listing.id}"
                                                                   class="uk-text-danger">${listing.name}</a></h3>
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

            <!-- Price -->
            <c:choose>
                <c:when test="${listing.type == 'auction'}">
                    <div class="price" style="font-size: 16px;">
                        <span class="uk-badge">Highest Bid: $${listing.highestBid}</span>
                    </div>
                    <c:choose>
                        <c:when test="${listing.ended = 0}">
                            <div class="price" style="font-size: 16px;">
                                <span class="uk-badge">Current Bid: $${listing.currentBid}</span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="price" style="font-size: 16px;">
                                <span class="uk-badge">Current Bid: $${listing.highestBid}</span>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <div class="uk-grid-small" uk-grid>
                        <div class=" uk-width-1-1 uk-align-center uk-margin-remove-bottom">
                            <p class="uk-margin-medium-top uk-align-center listing-ended"
                               style="color: red; font-size: 16px; display: none;">
                                <br>
                                Listing Ended</p>
                            <div class="uk-grid-small uk-countdown uk-margin-remove uk-align-center" uk-grid
                                 uk-countdown="date: ${listing.endTimestamp}">
                        <span class="uk-days">
                            <strong class="uk-countdown-number uk-countdown-days" style="font-size: 18px"></strong>
                            <strong class="uk-countdown-label uk-margin-small-top uk-margin-left"
                                    style="font-size: 18px">Days</strong>
                        </span>
                                <span class="uk-hours">
                            <strong class="uk-countdown-number uk-countdown-hours" style="font-size: 18px"></strong>
                            <strong class="uk-countdown-label uk-margin-small-top uk-margin-left"
                                    style="font-size: 18px">Hours</strong>
                        </span>
                                <span class="uk-minutes">
                            <strong class="uk-countdown-number uk-countdown-minutes" style="font-size: 18px"></strong>
                            <strong class="uk-countdown-label uk-margin-small-top uk-margin-left"
                                    style="font-size: 18px">Minutes</strong>
                        </span>
                                <span class="uk-seconds">
                            <strong class="uk-countdown-number uk-countdown-seconds" style="font-size: 18px"></strong>
                            <strong class="uk-countdown-label uk-margin-small-top uk-margin-left"
                                    style="font-size: 18px">Seconds</strong></strong>
                        </span>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:when test="${listing.type == 'fixed'}">
                    <div class="price" style="font-size: 16px;">
                            <span class="uk-badge"
                                  id="currentBid${listing.id}">Price: $${listing.price}</span>
                    </div>
                </c:when>
            </c:choose>
        </div>
    </div>
</div>