<div class="uk-container">
    <h1 class="uk-heading-line uk-text-center"><span>${user.firstName}'s Dashboard</span></h1>

    <div class="uk-grid" style="padding-top: 5%" uk-grid>
        <div class="uk-width-4-5">
            <div class="uk-child-width-1-2 uk-grid-match uk-grid-large" uk-grid>
                <h4>Listings I've Bid On</h4>
                <h4>Listings Of Mine With Bids</h4>
            </div>
        </div>
        <div class="uk-width-1-5">
            <h4>Relevant Posts For Me</h4>
        </div>
    </div>

    <div class="uk-padding-small">

        <!-- Grid for first section content -->
        <div class="uk-grid-divider uk-grid-match uk-padding-small uk-margin-small-top" uk-grid>

            <div class="uk-width-4-5@m uk-width-1-1@s uk-first-column">
                <div class="uk-child-width-1-2@m uk-child-width-1-1@s uk-grid-match uk-grid-large">

                    <div class="uk-float-left uk-padding-remove-left">

                        <!-- Begin slider -->
                        <div class="uk-position-relative uk-visible-toggle uk-light" uk-slideshow="animation: fade">
                            <ul id="listingsIBidOnCard" class="uk-slideshow-items">
                                <li>
                                    <!-- Ajax replaces this -->
                                    <div class="uk-card uk-card-default">
                                        <div class="uk-card-media-top">
                                            <img
                                                    src="${pageContext.request.contextPath}/resources/img/listings/knuckles.png"
                                                    alt="Listing">
                                        </div>
                                        <div class="uk-card-body">
                                            <h3 class="uk-card-title">Headline</h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                                tempor
                                                incididunt.</p>
                                        </div>
                                    </div>
                                    <!-- Ajax replaces this end -->
                                </li>
                            </ul>

                            <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#"
                               uk-slidenav-previous uk-slideshow-item="previous"></a>
                            <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#"
                               uk-slidenav-next uk-slideshow-item="next"></a>
                        </div>
                        <!-- End slider -->

                    </div>

                    <div class="uk-padding-remove-right">

                        <!-- Begin slider -->
                        <div class="uk-position-relative uk-visible-toggle uk-light" uk-slideshow="animation: fade">
                            <ul id="bidsOnMyListingCard" class="uk-slideshow-items">
                                <li>
                                    <!-- Ajax replaces this -->
                                    <div class="uk-card uk-card-default">
                                        <div id="image-top" class="uk-card-media-top">
                                            <img
                                                    src="${pageContext.request.contextPath}/resources/img/listings/couch.jpg"
                                                    alt="Listing">
                                        </div>
                                        <div class="uk-card-body">
                                            <h3 class="uk-card-title">Headline</h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                                tempor
                                                incididunt.</p>
                                        </div>
                                    </div>
                                    <!-- Ajax replaces this end -->
                                </li>
                            </ul>

                            <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#"
                               uk-slidenav-previous uk-slideshow-item="previous"></a>
                            <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#"
                               uk-slidenav-next uk-slideshow-item="next"></a>
                        </div>
                        <!-- End slider -->

                    </div>

                </div>
            </div>
            <div class="uk-width-1-5@m uk-width-1-1@s uk-float-right">

                <div>

                    <div id="relevantListingCard" class="uk-card uk-card-default">
                        <div id="relevant-image-top" class="uk-card-media-top">
                            <img style="height: auto; width: auto; width: 100%"
                                 src="${pageContext.request.contextPath}/resources/img/listings/duder.png"
                                 alt="Listing">
                        </div>
                        <div class="uk-card-body">
                            <h3 class="uk-card-title">Headline</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt.</p>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<script>

    // My bids on listings
    $(document).ready(function () {
        var text = "";
        $.ajax({
            url: 'listingsIBidOn',
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            success: function (result) {
                console.log(result);
                for (var key in result) {
                    text += '<li>' +
                        '<div class="uk-card uk-card-default">' +
                        '<div class="uk-card-media-top">' +
                        '<img style="height: auto; width: auto; width: 100%" src="directory/' + result[key].listingImage + '" + alt="">' +
                        '</div>' +
                        '<div class="uk-card-body">' +
                        '<h3 class="uk-card-title">' + result[key].listingName + '</h3>' +
                        '</div>' +
                        '</div>' +
                        '</li>';
                }

                $('#listingsIBidOnCard').empty();
                $('#listingsIBidOnCard').append(text);
            }
        });
    });

    // Bids on my listings
    $(document).ready(function () {
        var text = "";
        $.ajax({
            url: 'bidsOnMyListings',
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            success: function (result) {
                console.log(result);
                for (var key in result) {
                    text += '<li>' +
                        '<div class="uk-card uk-card-default">' +
                        '<div class="uk-card-media-top">' +
                        '<img style="height: auto; width: auto; width: 100%" src="directory/' + result[key].listingImage + '" + alt="">' +
                        '</div>' +
                        '<div class="uk-card-body">' +
                        '<h3 class="uk-card-title">' + result[key].listingName + '</h3>' +
                        '</div>' +
                        '</div>' +
                        '</li>';
                }

                $('#bidsOnMyListingCard').empty();
                $('#bidsOnMyListingCard').append(text);
            }
        });
    });

    // Relevant listing
    $(document).ready(function () {
        var text = "";
        $.ajax({
            url: 'getRelevantListing',
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            success: function (result) {
                console.log(result);

                text += '<div class="uk-card-media-top">' +
                    '<img style="height: auto; width: auto; width: 100%" src="directory/' + result['listingImage'] + '" + alt="">' +
                    '</div>' +
                    '<div class="uk-card-body">' +
                    '<h3 class="uk-card-title">' + result['listingName'] + '</h3>' +
                    '</div>';


                $('#relevantListingCard').empty();
                $('#relevantListingCard').append(text);
            }
        });
    });

</script>