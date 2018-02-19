<%@include file="jspf/header.jsp" %>
<body>

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div>

    <div class="uk-section">
        <div class="uk-position-relative uk-visible-toggle uk-light"
             uk-slideshow="max-height: 300; ratio: 10:3">

            <ul class="uk-slideshow-items">
                <li><img
                        src="${pageContext.request.contextPath}/resources/img/hp-img1.png"
                        alt="" width="1203" uk-cover></li>
                <li><img
                        src="${pageContext.request.contextPath}/resources/img/sunset.jpg"
                        alt="" uk-cover></li>
                <li><img
                        src="${pageContext.request.contextPath}/resources/img/sunset.jpg"
                        alt="" uk-cover></li>
            </ul>

            <a class="uk-position-center-left uk-position-small uk-hidden-hover"
               href="#" uk-slidenav-previous uk-slideshow-item="previous"></a> <a
                class="uk-position-center-right uk-position-small uk-hidden-hover"
                href="#" uk-slidenav-next uk-slideshow-item="next"></a>

        </div>
        <br>
        <div class="uk-child-width-expand@s uk-text-center" uk-grid>
            <div class="uk-width-1-4">
                <h2>Categories</h2>
                <div class="uk-card uk-card-default uk-card-body uk-grid-margin">
                    <c:forEach items="${categories}" var="category">
                        <c:forEach items="${category.subCategories}" var="sub">
                            <div>
                                <h3>
                                    <a class="uk-link-heading" href="">${category.name}</a>
                                </h3>
                            </div>
                            <hr>
                            <div>
                                <a href="" class="uk-link-reset">${sub.name}</a>
                            </div>
                            <br>
                        </c:forEach>
                        <br>
                    </c:forEach>
                </div>
            </div>
            <div class="uk-width-3-4">
                <ul uk-tab>
                    <li class="uk-active"><a onclick="trendingClicked()">Trending</a></li>
                    <li><a onclick="endingSoonClicked()">Ending Soon</a></li>
                    <li><a onclick="recentlyAddedClicked()">Recently Added</a></li>
                </ul>
                <div id="trending-listings" style="display: inline">
                    <div class="uk-child-width-1-3@m uk-grid-small uk-text-center"
                         uk-grid>
                        <c:forEach var="listing" items="${trendingListings}">
                            <%@include file="jspf/index-listing.jsp" %>
                        </c:forEach>
                    </div>
                </div>
                <div id="ending-soon-listings" style="display: none">
                    <div class="uk-child-width-1-3@m uk-grid-small uk-text-center"
                         uk-grid>
                        <c:forEach var="listing" items="${endingSoonListings}">
                            <%@include file="jspf/index-listing.jsp" %>
                        </c:forEach>
                    </div>
                </div>
                <div id="recently-added-listings" style="display: none">
                    <div class="uk-child-width-1-3@m uk-grid-small uk-text-center"
                         uk-grid>
                        <c:forEach var="listing" items="${recentListings}">
                            <%@include file="jspf/index-listing.jsp" %>
                        </c:forEach>
                    </div>
                </div>
            </div>
            6y
        </div>
    </div>
</div>
<%@include file="jspf/footer.jspf" %>
<script>
    function trendingClicked() {
        document.getElementById('trending-listings').style.display = 'inline';
        document.getElementById('ending-soon-listings').style.display = 'none';
        document.getElementById('recently-added-listings').style.display = 'none';
    }

    function endingSoonClicked() {
        document.getElementById('trending-listings').style.display = 'none';
        document.getElementById('ending-soon-listings').style.display = 'inline';
        document.getElementById('recently-added-listings').style.display = 'none';
    }

    function recentlyAddedClicked() {
        document.getElementById('trending-listings').style.display = 'none';
        document.getElementById('ending-soon-listings').style.display = 'none';
        document.getElementById('recently-added-listings').style.display = 'inline';
    }


    $('#notificationDrop').on("hide", function () {
        $.ajax({
            type: 'GET',
            url: '/markAsViewed',
        })

        document.getElementById('badge1').style.visibility = "hidden";

        var spans = document.getElementsByTagName('span');

        for (var i = 0; i < spans.length; i++) {
            var spanClass = spans[i].getAttribute("class");
            if (spans[i].getAttribute("class") === "badge2") {
                spans[i].style.display = "none";
            }
        }
    })

    function cancelBid(listingID) {
        $.ajax({
            type: "GET",
            url: "/cancelBid",
            data: {
                l: listingID
            },
        });

    }
</script>
</body>
</html>