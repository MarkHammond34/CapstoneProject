<%@include file="jspf/header.jsp" %>
<body>
<%@include file="jspf/navbar.jspf" %>
<br>
<br>
<!-- BEGIN CONTENT WRAPPER -->
<div id="content-wrapper">
    <!-- BEGIN MAIN -->
    <div class="uk-container">
        <h1 class="uk-heading-line uk-text-center"><span>Community Page</span></h1>
        <div class="uk-margin">
            <form class="uk-search uk-search-default">
                <span uk-search-icon></span>
                <input class="uk-search-input" name="search" action="searchNews" type="search" placeholder="Search...">
            </form>
        </div>
    </div>
    <br>
    <div id="main">
        <div id="headlines">
            <div id="main-headline">
                <h2 class="heading">Featured Story</h2>
                <img alt="" src="img/blank.jpg">
                <h1><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit</a></h1>
                <p class="author">Name Here | <span>09.18.09</span></p>
                <p>Ut sed arcu nulla. In eget lectus vitae purus volutpat consectetur suscipit ut justo.</p>
                <p><a href="#">Full story »</a></p>
                <h2 class="heading">Latest Video</h2>
                <iframe width="375" height="300" src="${newestVideo.videoPath}" frameborder="0"
                        allow="autoplay; encrypted-media" allowfullscreen></iframe>
                <br>
                <h2><a href="#">${newestVideo.title}</a></h2>
                <p class="author"><span>${videoDate}</span></p>
                <p><a href="${pageContext.request.contextPath}/allVideos">More videos</a></p>
            </div>
            <div id="more-headlines">
                <h2 class="heading">Featured Stories</h2>
                <h2><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit</a></h2>
                <p class="author">Name Here | <span>09.18.09</span></p>
                <p>Ut sed arcu nulla. In eget lectus vitae purus volutpat consectetur suscipit ut justo.</p>
                <p><a href="#">Full article »</a></p>
                <h3><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit</a></h3>
                <p class="author">Name Here | <span>09.18.09</span></p>
                <p>Ut sed arcu nulla. In eget lectus vitae purus volutpat consectetur suscipit ut justo.</p>
                <p><a href="#">Full article »</a></p>
                <h3><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit</a></h3>
                <p class="author">Name Here | <span>09.18.09</span></p>
                <p>Ut sed arcu nulla. In eget lectus vitae purus volutpat consectetur suscipit ut justo.</p>
                <p><a href="#">Full article »</a></p>
                <h2 class="heading">Podcast</h2>
                <img class="righty" alt="" src="img/microphone.png">
                <h4><a href="#">Lorem ipsum dolor sit amet, consectetur</a></h4>
                <p class="author"><span>09.18.09</span></p>
                <p>Ut sed arcu nulla. In eget lectus vitae purus volutpat consectetur suscipit ut justo.</p>
                <p><a href="#">More podcasts »</a></p>
            </div>
        </div>
    </div>
    <!-- END MAIN -->
    <!-- BEGIN SIDEBARS -->
    <div id="sidebars">
        <!-- BEGIN ADS -->
        <a href="#"><img class="ad" alt="" src="img/side-ad.png"></a> <a href="#"><img class="ad-right" alt=""
                                                                                       src="img/side-ad.png"></a> <a
            href="#"><img class="ad" alt="" src="img/side-ad.png"></a> <a href="#"><img class="ad-right" alt=""
                                                                                        src="img/side-ad.png"></a>
        <!-- END ADS -->
        <h2 class="heading-blue">Benedictine Tweets</h2>
        <div id="" style="overflow:scroll; height:400px;">
            <a class="twitter-timeline"
               href="https://twitter.com/benu1887">
                Tweets by @BenU1887
            </a>
            <a class="twitter-timeline" href="https://twitter.com/BenU1887?ref_src=twsrc%5Etfw">Tweets by
                BenU1887</a>
            <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
        </div>
        <br>

        <h2 class="heading">School Events</h2>
        <div class="uk-tile uk-tile-default">
            <c:forEach var="events" items="${events}" varStatus="loop">

                <div uk-grid>
                    <div class="uk-width-2-5">
                        <time datetime="2014-09-24" class="date-as-calendar position-em size1x">
                            <span class="weekday">${day.get(loop.index)}</span>
                            <span class="day">${date.get(loop.index)}</span>
                            <span class="month">${month.get(loop.index)}</span>
                            <span class="year">${year.get(loop.index)}</span>
                        </time>
                    </div>
                    <div class="uk-width-3-5">
                        <div class="uk-text-lead uk-text-bold">${events.title}
                        </div>
                        <div style="font-weight: 300; font-size: 0.75rem">${events.location}</div>

                        <div style="font-weight: 300; font-size: 1.20rem">${time.get(loop.index)}</div>
                    </div>

                </div>
            </c:forEach>
            <br>

        </div>
        <!-- END SIDEBARS -->
    </div>
    <!-- END CONTENT WRAPPER-->
    <!-- BEGIN EXTRAS -->
    <div id="extras">
        <div id="recommended">
            <h2 class="heading">Recommended Stories</h2>
            <ul>
                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit »</a></li>
                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit »</a></li>
                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit »</a></li>
                <li class="last"><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit »</a></li>
            </ul>
        </div>
        <div id="programs">
            <h2 class="heading">What's On Tonight</h2>
            <img alt="" src="img/rick.jpg"> <img alt="" src="img/cbc.png"></div>
        <div id="cartoon">
            <h2 class="heading">Humour</h2>
            <img alt="" src="img/cartoon.jpg"></div>
    </div>

</div>
</body>
</html>