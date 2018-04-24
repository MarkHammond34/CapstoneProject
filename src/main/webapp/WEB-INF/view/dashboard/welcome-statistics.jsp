<div class="uk-container">
    <h1 class="uk-heading-line uk-text-center"><span>${user.firstName}'s Dashboard</span></h1>
    <div class="uk-grid-divider uk-grid-match uk-padding-small uk-margin-small-top" uk-grid>

        <div class="uk-width-3-5@m uk-width-1-1@s uk-first-column">
            <div class="uk-child-width-1-2@m uk-child-width-1-1@s uk-grid-match uk-grid-large" uk-grid>
                <div>
                    <!--<h3>My Bids</h3>-->
                    <div class="uk-card uk-card-default">
                        <div class="uk-card-media-top">
                            <img
                                 src="${pageContext.request.contextPath}/resources/img/listings/knuckles.png"
                                 alt="Listing">
                        </div>
                        <div class="uk-card-body">
                            <h3 class="uk-card-title">Headline</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt.</p>
                        </div>
                    </div>
                </div>
                <div>
                    <!--<h3>Their Bids</h3>-->
                    <div class="uk-card uk-card-default">
                        <div id="image-top" class="uk-card-media-top">
                            <img
                                    src="${pageContext.request.contextPath}/resources/img/listings/couch.jpg"
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
        <div class="uk-width-2-5@m uk-width-1-1@s">
            <!--<h3>Relevant Posts For Me</h3>-->
            <div>
                <!--<h3>Relevant Posts For Me</h3>-->
                <div class="uk-card uk-card-default">
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