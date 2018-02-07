<%@include file="jspf/header.jsp" %>
<style>
    .uk-countdown-number {
        font-size: 18px;
    }

    .uk-countdown-label {
        font-size: 10px;
    }

    .uk-card-media-left img {
        max-height: 100%;
        max-width: 100%;
    }

</style>
<body>

<%@include file="jspf/navbar.jspf" %>

<div style="background-color: #f2f2f2;">

    <%@include file="jspf/messages.jsp" %>

    <div class="uk-section">
        <div class="uk-position-relative uk-visible-toggle uk-light"
             uk-slideshow="max-height: 300; ratio: 10:3">

            <ul class="uk-slideshow-items">
                <li>
                    <img src="${pageContext.request.contextPath}/resources/img/hp-img1.png" alt="" width="1203"
                         uk-cover>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/resources/img/sunset.jpg" alt="" uk-cover>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/resources/img/sunset.jpg" alt="" uk-cover>
                </li>
            </ul>

            <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous
               uk-slideshow-item="previous"></a>
            <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next
               uk-slideshow-item="next"></a>

        </div>
        <br>
        <div class="uk-child-width-expand@s uk-text-center" uk-grid>
            <div class="uk-width-1-4">
                <h2>Categories</h2>
                <div class="uk-card uk-card-default uk-card-body uk-grid-margin">
                    <c:forEach items="${categories}" var="category">
                        <c:forEach items="${category.subCategories}" var="sub">
                            <div><h3><a class="uk-link-heading" href="">${category.name}</a></h3></div>
                            <hr>
                            <div><a href="" class="uk-link-reset">${sub.name}</a></div>
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
                <div id="trending-listings" style="display: inline" uk-grid>
                    <c:forEach var="listing" items="${trendingListings}">
                        <%@include file="jspf/index-listing.jsp" %>
                    </c:forEach>
                </div>
                <div id="ending-soon-listings" style="display: none" uk-grid>
                    <c:forEach var="listing" items="${endingSoonListings}">
                        <%@include file="jspf/index-listing.jsp" %>
                    </c:forEach>
                </div>
                <div id="recently-added-listings" style="display: none" class="uk-child-width-1-2@m" uk-grid>
                    <c:forEach var="listing" items="${recentListings}">
                        <%@include file="jspf/index-listing.jsp" %>
                    </c:forEach>
                </div>
            </div>
            6y
        </div>
    </div>
</div>
</div>
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
</script>
</body>
</html>