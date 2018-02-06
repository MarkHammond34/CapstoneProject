<div class="uk-grid-collapse uk-text-center" uk-grid>
    <div class="uk-width-1-1">
        <div class="uk-tile uk-tile-default uk-padding-small">
            <p style="float:left;" class="uk-h4">Active(${activeCount})</p>
        </div>
        <c:if test="${listingsActive != null}">
            <div class="uk-child-width-1-4@m uk-grid-small uk-grid-match" uk-grid>
                <c:forEach var="listing" items="${listingsActive}">
                    <div class="uk-card uk-card-default uk-margin">
                        <div class="uk-card-media-left uk-cover-container">
                            <div uk-lightbox>
                                <a href="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                                   title="Image" class="thumbnail"><img
                                        src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                                        alt="Listing"/></a>
                            </div>
                        </div>
                        <div>
                            <div class="uk-card-body">
                                <h3 class="uk-card-title">${listing.name}</h3>
                                <h5>User - ${listing.user.username}</h5>
                                <h5>Price - $${listing.price}</h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${listingsActive == null}">
            <p>No Active Listings</p>
        </c:if>
    </div>
    <div class="uk-width-1-1">
        <div class="uk-tile uk-tile-default uk-padding-small">
            <p style="float:left;" class="uk-h4">Won(${wonCount})</p>
        </div>
        <c:if test="${listingsWon != null}">
        <div class="uk-child-width-1-4@m uk-grid-small uk-margin" uk-grid>
            <c:forEach var="listing" items="${listingsWon}">
                <div class="uk-card uk-card-default uk-margin">
                    <div class="uk-card-media-left uk-cover-container">
                        <div uk-lightbox>
                            <a href="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                               title="Image" class="thumbnail"><img
                                    src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                                    alt="Listing"/></a>
                        </div>
                    </div>
                    <div>
                        <div class="uk-card-body">
                            <h3 class="uk-card-title">${listing.name}</h3>
                            <h5>User - ${listing.user.username}</h5>
                            <h5>Price - $${listing.price}</h5>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    </c:if>
    <c:if test="${listingsWon == null}">
        <p>No Listings Won</p>
    </c:if>
</div>
<div class="uk-width-1-1">
    <div class="uk-tile uk-tile-default uk-padding-small">
        <p style="float:left;" class="uk-h4">Lost(${lostCount})</p>
    </div>
    <c:if test="${lostCount > 0}">
        <div class="uk-child-width-1-4@m uk-grid-small uk-margin" uk-grid>
            <c:forEach var="listing" items="${listingsLost}">
                <div class="uk-card uk-card-default uk-margin">
                    <div class="uk-card-media-left uk-cover-container">
                        <div uk-lightbox>
                            <a href="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                               title="Image" class="thumbnail"><img
                                    src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                                    alt="Listing"/></a>
                        </div>
                    </div>
                    <div>
                        <div class="uk-card-body">
                            <h3 class="uk-card-title">${listing.name}</h3>
                            <h5>User - ${listing.user.username}</h5>
                            <h5>Price - $${listing.price}</h5>
                        </div>
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