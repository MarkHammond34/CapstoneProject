<%@include file="jspf/header.jsp" %>
<div class="homepage-tutorial" style="border: 20px solid white;
            margin: 0 auto;
            background: white;">
    <body class="uk-background-muted">

    <%@include file="jspf/navbar.jspf" %>

    <%@include file="jspf/messages.jsp" %>

    <div class="u-list-it-background uk-inline-clip">
        <div class="uk-section-default">
            <div class="uk-section-large uk-overlay-default uk-background-cover "
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
        <div class="uk-section">
            <div class="uk-child-width-1-6@m uk-grid-small uk-grid-match" uk-grid>
                <c:forEach var="category" items="${categories}" varStatus="loop">

                    <div class="item uk-animation-toggle">
                        <a href="#"><img class="category-pic uk-border-circle uk-box-shadow-xlarge uk-animation-shake"
                                         src="${pageContext.request.contextPath}/resources/img/category/${category.image}"></a>
                        <span class="caption">${category.category}</span>
                    </div>

                </c:forEach>
            </div>

        </div>

        <br>

        <div class="uk-width-1-1"
             data-intro="Browse listings by premium, trending, ending soon, and recently added."
             data-step="6">

            <ul class="uk-flex-center uk-subnav uk-subnav-pill"
                uk-switcher="animation: uk-animation-slide-left-medium, uk-animation-slide-right-medium">
                <c:if test="${premiumListings != null}">
                    <li class="uk-active"><a href="#premium-listings"><span uk-icon="bolt"
                                                                            style="color: yellow"></span>
                        <b>Premium</b>
                        <span uk-icon="bolt"
                              style="color: yellow"></span></a>
                    </li>
                </c:if>
                <c:if test="${relevantListings != null}">
                    <li><a href="#relevant-listings">Recommended</a></li>
                </c:if>
                <li><a href="#trending-listings">Trending</a></li>
                <li><a href="#ending-soon-listings">Ending Soon</a></li>
                <li><a href="#recently-added-listings">Recently Added</a></li>

            </ul>

            <ul class="uk-switcher uk-margin">
                <c:if test="${premiumListings != null}">
                    <div id="premium-listings">
                        <div uk-slider>
                            <div class="uk-position-relative uk-visible-toggle uk-light">
                                <ul class="uk-slider-items uk-child-width-1-4@s uk-grid uk-margin" uk-grid>
                                    <c:forEach var="listing" items="${premiumListings}">
                                        <%@include file="listing/index-listing.jsp" %>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${relevantListings != null}">
                    <div id="relevant-listings">
                        <div uk-slider>
                            <div class="uk-container">
                                <div class="uk-position-relative uk-visible-toggle uk-light">
                                    <ul class="uk-slider-items uk-child-width-1-4@s uk-grid uk-margin" uk-grid>
                                        <c:forEach var="listing" items="${relevantListings}">
                                            <%@include file="listing/index-listing.jsp" %>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <div id="trending-listings">
                    <div uk-slider>
                        <div class="uk-container">
                            <div class="uk-position-relative uk-visible-toggle uk-light">
                                <ul class="uk-slider-items uk-child-width-1-4@s uk-grid uk-margin" uk-grid>

                                    <c:forEach var="listing" items="${recentListings}">
                                        <%@include file="listing/index-listing.jsp" %>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="ending-soon-listings">
                    <div uk-slider>
                        <div class="uk-container">
                            <div class="uk-position-relative uk-visible-toggle uk-light">
                                <ul class="uk-slider-items uk-child-width-1-4@s uk-grid uk-margin" uk-grid>

                                    <c:forEach var="listing" items="${endingSoonListings}">
                                        <%@include file="listing/index-listing.jsp" %>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="recently-added-listings">
                    <div uk-slider>
                        <div class="uk-container">
                            <div class="uk-position-relative uk-visible-toggle uk-light">
                                <ul class="uk-slider-items uk-child-width-1-4@s uk-grid uk-margin" uk-grid>
                                    <c:forEach var="listing" items="${recentListings}">
                                        <%@include file="listing/index-listing.jsp" %>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </ul>
            <div class="uk-section"></div>
        </div>

    </div>

    <%@include file="checklist/checklist-modal.jsp" %>

    <%@include file="checklist/checklist-sidenav.jsp" %>

    <script>

        // Add something to given element placeholder
        function addToPlaceholder(toAdd, el) {
            el.attr('placeholder', el.attr('placeholder') + toAdd);
            // Delay between symbols "typing"
            return new Promise(resolve = > setTimeout(resolve, 100)
        )
            ;
        }

        // Cleare placeholder attribute in given element
        function clearPlaceholder(el) {
            el.attr("placeholder", "");
        }

        // Print one phrase
        function printPhrase(phrase, el) {
            return new Promise(resolve = > {
                // Clear placeholder before typing next phrase
                clearPlaceholder(el);
            let letters = phrase.split('');
            // For each letter in phrase
            letters.reduce(
                (promise, letter, index) = > promise.then(_ = > {
                // Resolve promise when all letters are typed
                if(index === letters.length - 1
        )
            {
                // Delay before start next phrase "typing"
                setTimeout(resolve, 1000);
            }
            return addToPlaceholder(letter, el);
        }),
            Promise.resolve()
        )
            ;
        })
            ;
        }

        // Print given phrases to element
        function printPhrases(phrases, el) {
            // For each phrase
            // wait for phrase to be typed
            // before start typing next
            phrases.reduce(
                (promise, phrase) = > promise.then(_ = > printPhrase(phrase, el)
        ),
            Promise.resolve()
        )
            ;
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

        window.addEventListener("load", function () {
            if (document.getElementById("yes").style.display == "inline") {
                setTimeout(function () {
                    introJs(".homepage-tutorial").start();
                }, 2000);
            }
        });

    </script>


    <c:if test="${showTutorial == true}">
        <p id="yes" style="display: inline;"></p>
    </c:if>


    </body>

    <%@include file="jspf/footer.jspf" %>
</div>
</html>