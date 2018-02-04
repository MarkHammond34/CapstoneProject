<article class="search-result row">

    <!--
    <div class="col-xs-12 col-sm-12 col-md-3">
        <div uk-lightbox>
            <a href="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
               title="Lorem ipsum" class="thumbnail"><img
                    src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                    alt="Listing"/></a>
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-2">
        <ul>
            <li><i class="glyphicon glyphicon-user"></i>
                <span>${listing.user.username}</span>
            </li>
            <li style="float: left"><i class="glyphicon glyphicon-usd"></i>
                <span>${listing.price}</span></li>
            <li style="float: left"><i class="glyphicon glyphicon-map-marker"></i>
                <span>Location</span>
            </li>
            <li style="float: left"><i class="glyphicon glyphicon-star-empty"></i>
                <span>Watch Item</span>
        </ul>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-7 excerpet">
        <h3>
            <a href="#" title="">${listing.name}</a>
        </h3>
        <p>${listing.description}</p>
        <span class="plus"><a
                href="${pageContext.request.contextPath}/checkoutPage"
                title="Buy Now!"><i uk-icon="icon: cart"></i></a></span>
    </div>
    <span class="clearfix borda"></span>
-->
    <div class="uk-card uk-card-default uk-grid-collapse uk-child-width-1-3@s uk-margin" uk-grid>
        <div class="uk-card-media-left uk-width-1-3" uk-lightbox>
            <a href="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
               title="Image" class="thumbnail"><img
                    src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                    alt="Listing"/></a>
        </div>
        <div class="uk-card-body uk-width-2-3">
            <div class="uk-position-medium uk-position-top-right">
                <a href="/watch?l=${listing.id}" uk-icon="icon: star; ratio: 2"></a>
            </div>
            <div class="uk-width-1-3">
                <ul class="uk-list uk-list-large uk-list-divider">
                    <li class="listing-title">
                        <div class="listing-title"><i class="glyphicon glyphicon-user"></i>
                            <span>${listing.user.username}</span>
                        </div>
                    </li>
                    <li class="listing-user">
                        <div class="listing-user"><i class="glyphicon glyphicon-usd"></i>
                            <span>${listing.price}</span></div>
                    </li>
                    <li class="listing-price">
                        <div class="listing-price"><i class="glyphicon glyphicon-map-marker"></i>
                            <span>Location</span>
                        </div>
                    </li>
                </ul>
            </div>
            <div>
            <span class="plus"><a
                    href="${pageContext.request.contextPath}/checkoutPage"
                    title="Buy Now!"><i uk-icon="icon: cart"></i></a></span>
            </div>
        </div>
    </div>
</article>