<%@include file="jspf/header.jsp" %>

<body class="uk-background-muted">
<div style="border: 20px solid white;
            margin: 0 auto;
            background: white;">
    <%@include file="jspf/navbar.jspf" %>

    <%@include file="jspf/messages.jsp" %>

    <div class="u-list-it-background uk-inline-clip">
        <div class="uk-section-default uk-padding">
            <div class="uk-section uk-overlay-default uk-background-cover "
                 style="background-image:url('${pageContext.request.contextPath}/resources/img/index2.jpeg'); height: auto; max-height: 350px;  background-position: center;
                         background-repeat: no-repeat;
                         background-size: cover;">
                <div class="uk-overlay uk-light uk-align-center uk-border-rounded"
                     style="width:75%;background: rgba(34,34,34,0.85);"
                     data-intro="You can also search here."
                     data-step="5">
                    <form class=" uk-search uk-search-large uk-width-">
                        <span uk-search-icon></span>
                        <input id="search" class="uk-search-input" type="search" name="mainSearch">
                    </form>
                </div>
            </div>
        </div>
        <div class="uk-section uk-padding">
            <div class="uk-child-width-1-6@m uk-grid-small uk-grid-match" uk-grid>
                <c:forEach var="category" items="${categories}" varStatus="loop">
                    <div class="item uk-animation">
                        <a href="#"><img class="category-pic uk-border-circle uk-box-shadow-hover-xlarge"
                                         src="${pageContext.request.contextPath}/resources/img/category/${category.image}"></a>
                        <span class="caption">${category.category}</span>
                    </div>

                </c:forEach>
            </div>

        </div>

        <div class="uk-section-default">
            <h1 class="uk-heading-line uk-padding"><span>Hottest Listings</span></h1>
            <div class="uk-position-relative uk-visible-toggle uk-light"
                 uk-slider="autoplay: true">

                <ul
                        class="uk-slider-items uk-child-width-1-2 uk-child-width-1-3@m uk-grid">

                    <c:forEach var="listing" items="${hottestListings}" varStatus="loop">
                        <li>
                            <div class="uk-panel">
                                <div class="uk-card uk-card-default ">
                                    <div class="uk-card-media-top">
                                        <div uk-slideshow="autoplay-interval: 2000" uk-slideshow>
                                            <ul class="uk-slideshow-items">
                                                <c:forEach items="${listing.images}" var="listingImages">
                                                    <div uk-lightbox>
                                                        <li>
                                                            <a href="${pageContext.request.contextPath}/directory/${listingImages.image_path}/${listingImages.image_name}"
                                                               title="Image" class="thumbnail">
                                                                <img class="uk-align-center"
                                                                     src="${pageContext.request.contextPath}/directory/${listingImages.image_path}/${listingImages.image_name}"
                                                                     alt="Listing">
                                                            </a>
                                                        </li>
                                                    </div>
                                                </c:forEach>
                                            </ul>
                                            <a class="uk-position-center-left uk-position-small uk-hidden-hover"
                                               href="#" uk-slidenav-previous
                                               uk-slideshow-item="previous"></a>
                                            <a class="uk-position-center-right uk-position-small uk-hidden-hover"
                                               href="#" uk-slidenav-next
                                               uk-slideshow-item="next"></a>

                                        </div>
                                    </div>

                                    <div class="uk-card-body uk-padding-small">
                                        <div class="name uk-margin-remove-top" style="font-size:
                                    18px;">
                                            <a href="/listing?l=${listing.id}"><p
                                                    class="uk-text-danger uk-text-uppercase">${listing.name}</p></a>
                                        </div>
                                        <div class="uk-child-width-1-2@s uk-grid-small uk-grid-match" uk-grid>
                                            <c:if test="${listing.type == 'fixed'}">
                                                <div>
                                                    <p style="font-size:
                                    24px;"><strong>$${listing.price}.00</strong></p>
                                                </div>
                                                <div>
                                                    <button class="uk-button uk-button-danger">Buy Now</button>
                                                </div>
                                            </c:if>
                                        </div>

                                        <c:if test="${listing.type == 'auction'}">
                                            <div class="uk-child-width-1-2@s uk-grid-small uk-grid-match uk-margin-remove-top"
                                                 uk-grid>
                                                <div>
                                                    <p style="font-size:
                                    24px;"><strong>$${listing.price}.00</strong><span
                                                            class="uk-text-meta uk-margin-small-left" style="color:
                                                   black;"> ${listing.bidCount} bids</span></p>
                                                </div>

                                                <div class="uk-margin-small-top uk-magin-small-left">
                                                    <a class="uk-button uk-button-text"
                                                       style="color: cornflowerblue; "
                                                       uk-toggle="target: #placeBidModal${listing.id}"
                                                       id="bidButton${listing.id}">Place
                                                        Bid</a>

                                                </div>
                                            </div>

                                            <p class="uk-margin-remove-top uk-align-top listing-ended"
                                               style="color: red; font-size: 16px; display: none;">
                                                <br>
                                                Listing Ended</p>
                                            <div class="uk-grid-small uk-countdown uk-margin-remove-top uk-margin-remove-adjacent uk-align-top"
                                                 uk-grid
                                                 uk-countdown="date: ${listing.endTimestamp}">
                        <span class="uk-days">
                            <strong class="uk-countdown-number uk-countdown-days" style="font-size: 14px"></strong>
                            <strong class="uk-countdown-label uk-margin-left"
                                    style="font-size: 14px">Days</strong>
                        </span>
                                                <span class="uk-hours">
                            <strong class="uk-countdown-number uk-countdown-hours" style="font-size: 14px"></strong>
                            <strong class="uk-countdown-label uk-margin-left"
                                    style="font-size: 14px">Hours</strong>
                        </span>
                                                <span class="uk-minutes">
                            <strong class="uk-countdown-number uk-countdown-minutes" style="font-size: 14px"></strong>
                            <strong class="uk-countdown-label uk-margin-left"
                                    style="font-size: 14px">Minutes</strong>
                        </span>
                                                <span class="uk-seconds">
                            <strong class="uk-countdown-number uk-countdown-seconds" style="font-size: 14px"></strong>
                            <strong class="uk-countdown-label uk-margin-left"
                                    style="font-size: 14px">Seconds</strong></strong>
                        </span>
                                            </div>

                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>


                <a
                        class="uk-position-center-left uk-position-small uk-hidden-hover"
                        href="#" uk-slidenav-previous uk-slider-item="previous"></a> <a
                    class="uk-position-center-right uk-position-small uk-hidden-hover"
                    href="#" uk-slidenav-next uk-slider-item="next"></a>


            </div>
        </div>


        <div class="uk-section-default uk-padding">
            <div class="uk-tile uk-tile- uk-grid-collapse uk-child-width-1-2@s uk-margin" uk-grid>
                <div class="uk-card-media-left uk-cover-container">
                    <img src="${pageContext.request.contextPath}/resources/img/community.jpeg" alt="" uk-cover>
                    <canvas width="600" height="400"></canvas>
                </div>
                <div>
                    <div class="uk-card-body">
                        <h1 class="uk-heading-line uk-text-center uk-padding"><span>Community Page</span></h1>
                        <p style="font-size: 14px;">Come view our community page. Here you can see all of your schools
                            latest events and news. Click here for more details.</p>
                    </div>
                </div>
            </div>
        </div>

        <c:if test="${sessionScope.user != null}">
            <div class="uk-section-default">
                <h1 class="uk-heading-line uk-padding"><span>Suggested For You</span></h1>
                <div class="uk-position-relative uk-visible-toggle uk-light"
                     uk-slider="autoplay: true">

                    <ul
                            class="uk-slider-items uk-child-width-1-2 uk-child-width-1-3@m uk-grid">

                        <c:forEach begin="1" end="10">
                            <li>
                                <div class="uk-panel">
                                    <a href="${pageContext.request.contextPath}/listing?listingId=${listing.id}"><img
                                            class="uk-border-rounded uk-box-shadow-hover-large"
                                            src="${pageContext.request.contextPath}/resources/img/sunset.jpg"
                                            alt=""></a>
                                </div>
                                <div class="uk-position-center uk-panel">
                                    <!-- Maybe use this area for something later -->
                                </div>
                            </li>
                        </c:forEach>
                    </ul>


                    <a
                            class="uk-position-center-left uk-position-small uk-hidden-hover"
                            href="#" uk-slidenav-previous uk-slider-item="previous"></a> <a
                        class="uk-position-center-right uk-position-small uk-hidden-hover"
                        href="#" uk-slidenav-next uk-slider-item="next"></a>


                </div>
            </div>
        </c:if>
        <br>
        <br>
        <br>

    </div>
</div>

<%@include file="jspf/footer.jspf" %>

<%@include file="checklist/checklist-modal.jsp" %>

<%@include file="checklist/checklist-sidenav.jsp" %>

</div>
</body>

<script>

    // Add something to given element placeholder
    function addToPlaceholder(toAdd, el) {
        el.attr('placeholder', el.attr('placeholder') + toAdd);
        // Delay between symbols "typing"
        return new Promise(resolve => setTimeout(resolve, 100));
    }

    // Cleare placeholder attribute in given element
    function clearPlaceholder(el) {
        el.attr("placeholder", "");
    }

    // Print one phrase
    function printPhrase(phrase, el) {
        return new Promise(resolve => {
            // Clear placeholder before typing next phrase
            clearPlaceholder(el);
            let letters = phrase.split('');
            // For each letter in phrase
            letters.reduce(
                (promise, letter, index) => promise.then(_ => {
                    // Resolve promise when all letters are typed
                    if (index === letters.length - 1) {
                        // Delay before start next phrase "typing"
                        setTimeout(resolve, 1000);
                    }
                    return addToPlaceholder(letter, el);
                }),
                Promise.resolve()
            );
        });
    }

    // Print given phrases to element
    function printPhrases(phrases, el) {
        // For each phrase
        // wait for phrase to be typed
        // before start typing next
        phrases.reduce(
            (promise, phrase) => promise.then(_ => printPhrase(phrase, el)),
            Promise.resolve()
        );
    }

    // Start typing
    function run() {
        let phrases = [
            "Looking to furnish your new place?",
            "We got what you need!",
            "Need books or school supplies?",
            "You came to the right place!",
            "Dont know what you're looking for?",
            "Browse through our categories",
            "Search..."
        ];

        printPhrases(phrases, $('#search'));
    }

    run();

</script>

<script>

    // Start Tutorial
    window.addEventListener("load", function () {
        $.ajax({
            type: 'GET',
            url: '/checkForTutorial',
            data: {page: "home"},
        }).done(function (response) {
            if (response.showTutorial == 'YES') {
                setTimeout(function () {
                    introJs(".homepage-tutorial").start();
                }, 1500);
            }
        });
    });
</script>

</html>