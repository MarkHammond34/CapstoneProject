<%@include file="jspf/header.jsp" %>

<body class="uk-background-muted">

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div class="u-list-it-background">
    <div class="uk-section-default">
        <div class="uk-section-large uk-overlay-default uk-background-cover"
             style="background-image:url('${pageContext.request.contextPath}/resources/img/index2.jpeg');">
            <div class="uk-overlay uk-light uk-align-center uk-border-rounded homepage-tutorial"
                 style="width:50%;background: rgba(34,34,34,0.85);"
                 data-intro="You can also search here."
                 data-step="5">
                <form class=" uk-search uk-search-large">
                    <span uk-search-icon></span>
                    <input class="uk-search-input" type="search" placeholder="Search...">
                </form>
            </div>
        </div>
    </div>

    <br>

    <div class="uk-width-1-1 homepage-tutorial"
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
                            <ul class="uk-slider-items uk-child-width-1-3@s uk-grid">
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
                        <div class="uk-position-relative uk-visible-toggle uk-light">
                            <ul class="uk-slider-items uk-child-width-1-3@s uk-grid">
                                <c:forEach var="listing" items="${relevantListings}">
                                    <%@include file="listing/index-listing.jsp" %>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:if>
            <div id="trending-listings">
                <div uk-slider>
                    <div class="uk-position-relative uk-visible-toggle uk-light">
                        <ul class="uk-slider-items uk-child-width-1-3@s uk-grid">

                            <c:forEach var="listing" items="${trendingListings}">
                                <%@include file="listing/index-listing.jsp" %>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="ending-soon-listings">
                <div uk-slider>
                    <div class="uk-position-relative uk-visible-toggle uk-light">
                        <ul class="uk-slider-items uk-child-width-1-3@s  uk-grid">
                            <c:forEach var="listing" items="${endingSoonListings}">
                                <%@include file="listing/index-listing.jsp" %>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="recently-added-listings">
                <div uk-slider>
                    <div class="uk-position-relative uk-visible-toggle uk-light">
                        <ul class="uk-slider-items uk-child-width-1-3@s uk-grid">
                            <c:forEach var="listing" items="${recentListings}">
                                <%@include file="listing/index-listing.jsp" %>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </ul>
    </div>

</div>

<%@include file="checklist/checklist-modal.jsp" %>

<%@include file="checklist/checklist-sidenav.jsp" %>

<script>

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

</html>