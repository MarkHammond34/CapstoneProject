<li>
    <div id="activeListings"
         class="uk-panel uk-panel-scrollable uk-resize-vertical uk-height-large uk-padding-remove uk-background-muted uk-border-rounded">
        <button class="sort" data-sort="timestamp">Sort date</button>
        <ul class="uk-nav uk-nav-default uk-child-width-1-3@m uk-grid list" uk-grid="">
            <c:forEach var="listing" items="${activeListings}">
                <li class="uk-padding-small">
                    <div
                            class="uk-panel">

                        <ul class="uk-width-auto uk-child-width-1-2 uk-grid">
                            <li class="uk-padding-remove uk-float-left uk-margin-remove">
                                <ul class="uk-iconnav uk-iconnav-vertical">
                                    <li><a href="#" uk-icon="icon: plus"></a></li>
                                    <li><a href="edit?listing=${listing.id}" uk-icon="icon: file-edit"></a></li>
                                    <li><a href="#" uk-icon="icon: copy"></a></li>
                                    <li><a href="#" uk-icon="icon: trash"></a></li>
                                </ul>
                            </li>
                            <li class="uk-padding-remove uk-float-left uk-margin-remove">
                                <a
                                        href="${pageContext.request.contextPath}/listing?listingId=${listing.id}">
                                    <c:if test="${listing.images.size() > 1}">
                                        <!-- Saran -->
                                        <div class="uk-align-center" uk-slideshow="autoplay-interval: 2000"
                                             uk-slideshow>
                                            <ul class="uk-slideshow-items">
                                                <c:forEach items="${listing.images}" var="listingImages">
                                                    <div class="uk-lightbox">
                                                        <li>
                                                            <div class="uk-position-center">
                                                                <a href="${pageContext.request.contextPath}/directory/${listingImages.image_path}/${listingImages.image_name}"
                                                                   title="Image" class="thumbnail"><img
                                                                        height="auto"
                                                                        width="30%"
                                                                        src="${pageContext.request.contextPath}/directory/${listingImages.image_path}/${listingImages.image_name}"
                                                                        alt="Listing"
                                                                        ukcover></a>
                                                            </div>
                                                        </li>
                                                    </div>
                                                </c:forEach>
                                            </ul>
                                            <a class="uk-position-center-left uk-position-small uk-hidden-hover"
                                               href="#"
                                               uk-slidenav-previous uk-slideshow-item="previous"></a>
                                            <a class="uk-position-center-right uk-position-small uk-hidden-hover"
                                               href="#"
                                               uk-slidenav-next uk-slideshow-item="next"></a>
                                        </div>
                                        <!-- Saran -->
                                    </c:if>
                                    <c:if test="${listing.images.size() == 1}">
                                        <div>
                                            <div class="uk-card uk-card-default">
                                                <div class="uk-card-media-top">
                                                    <img height="auto" width="60%"
                                                         src="${pageContext.request.contextPath}/directory/${listing.images.get(0).image_path}/${listing.images.get(0).image_name}"
                                                         alt="Listing">
                                                </div>
                                                <div class="uk-card-body">
                                                    <h3 class="uk-card-title">Media Top</h3>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
                                                        eiusmod tempor incididunt.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </a>
                                <input class="timestamp" data-timestamp="${listing.dateCreated.getTime()}"
                                       type="hidden">
                            </li>
                        </ul>

                    </div>
                </li>

            </c:forEach>
        </ul>
    </div>
</li>