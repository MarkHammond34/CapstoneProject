<li class="uk-active">
    <div id="allListings"
         class="uk-panel uk-panel-scrollable uk-resize-vertical uk-height-large uk-padding-remove uk-background-muted uk-border-rounded">
        <button class="sort" data-sort="timestamp">Sort date</button>
        <ul class="uk-nav uk-nav-default uk-child-width-1-3@m uk-grid list" uk-grid="">
            <c:forEach var="listing" items="${allListings}">
                <li class="uk-padding-small">
                    <div
                            class="uk-panel uk-width-auto">
                        <a
                                href="${pageContext.request.contextPath}/listing?listingId=${listing.id}">
                            <!-- Saran -->
                            <div class="uk-align-center" uk-slideshow="autoplay-interval: 2000" uk-slideshow>
                                <ul class="uk-slideshow-items">
                                    <c:forEach items="${listing.images}" var="listingImages">
                                        <li>
                                            <div class="uk-position-center">
                                                <a href="${pageContext.request.contextPath}/directory/${listingImages.image_path}/${listingImages.image_name}"
                                                   title="Image" class="thumbnail"><img
                                                        src="${pageContext.request.contextPath}/directory/${listingImages.image_path}/${listingImages.image_name}"
                                                        alt="Listing" ukcover><a href="edit?listing=${listing.id}"
                                                                                 class="uk-icon-link uk-margin-small-right"
                                                                                 uk-icon="file-edit"></a></a>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                                <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#"
                                   uk-slidenav-previous uk-slideshow-item="previous"></a>
                                <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#"
                                   uk-slidenav-next uk-slideshow-item="next"></a>
                            </div>
                            <!-- Saran -->
                        </a>
                        <input class="timestamp" data-timestamp="${listing.dateCreated.getTime()}" type="hidden">
                    </div>
                </li>

            </c:forEach>
        </ul>
    </div>
</li>
