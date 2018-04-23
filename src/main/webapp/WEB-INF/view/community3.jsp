<%@include file="jspf/header.jsp" %>
<body>
<div class="homepage-tutorial" style="border: 20px solid white;
            margin: 0 auto;
            background: white;">
    <%@include file="jspf/navbar.jspf" %>
    <br>
    <br>
    <!-- BEGIN CONTENT WRAPPER -->
    <div id="content-wrapper">
        <!-- BEGIN MAIN -->
        <div class="uk-container">
            <h1 class="uk-heading-line uk-text-center"><span>Community Page</span></h1>

        </div>
        <br>
        <div class="uk-section-muted uk-padding">
            <div class="community-main uk-container">
                <div uk-grid>
                    <div class="uk-width-2-3@s">
                        <div>

                            <h4 class="uk-heading-bullet">Headline Stories</h4>
                            <hr>

                            <div class="uk-position-relative uk-visible-toggle uk-light"
                                 uk-slideshow="animation: scale">
                                <ul class="uk-slideshow-items">

                                    <li>
                                        <img alt=""
                                             src="${pageContext.request.contextPath}/resources/img/news/light.jpg"
                                             uk-cover>
                                        <div class="uk-overlay uk-overlay-primary uk-position-top">
                                            <p class="uk-text-center">Default Lorem ipsum dolor sit amet, consectetur
                                                adipiscing
                                                elit.</p>
                                        </div>
                                    </li>
                                    <li>
                                        <img alt=""
                                             src="${pageContext.request.contextPath}/resources/img/news/newsHead.jpg"
                                             uk-cover>
                                        <div class="uk-overlay uk-overlay-primary uk-position-top">
                                            <p class="uk-text-center">Default Lorem ipsum dolor sit amet, consectetur
                                                adipiscing
                                                elit.</p>
                                        </div>
                                    </li>
                                    <li>
                                        <img alt=""
                                             src="${pageContext.request.contextPath}/resources/img/news/NewsImage1.jpg"
                                             uk-cover>
                                        <div class="uk-overlay uk-overlay-primary uk-position-top">
                                            <p class="uk-text-center">Default Lorem ipsum dolor sit amet, consectetur
                                                adipiscing
                                                elit.</p>
                                        </div>
                                    </li>
                                </ul>

                                <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#"
                                   uk-slidenav-previous uk-slideshow-item="previous"></a>
                                <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#"
                                   uk-slidenav-next
                                   uk-slideshow-item="next"></a>

                            </div>

                        </div>
                    </div>
                    <div class="uk-width-1-3@s">
                        <h4 class="uk-heading-bullet">Benedictine Tweets</h4>
                        <hr>

                        <div class="uk-background-default uk-panel uk-border-rounded">
                            <div clas="uk-display-inline-block">
                                <div id="" style="overflow:auto; height:400px;">
                                    <a class="twitter-timeline"
                                       href="https://twitter.com/benu1887">
                                        Tweets by @BenU1887
                                    </a>
                                    <a class="twitter-timeline" href="https://twitter.com/BenU1887?ref_src=twsrc%5Etfw">Tweets
                                        by
                                        BenU1887</a>
                                    <script async src="https://platform.twitter.com/widgets.js"
                                            charset="utf-8"></script>
                                </div>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="community-sub1">
            <div uk-grid>
                <div class="uk-width-2-3@s">
                    <div>
                        <h4 class="uk-heading-bullet">Featured Stories</h4>
                        <div uk-grid>
                            <div class="uk-width-1-2@s">
                                <div class="uk-hover">
                                    <img alt=""
                                         src="${pageContext.request.contextPath}/resources/img/news/NewsImage2.jpg">

                                    <p class="uk-text-center">Default Lorem ipsum dolor sit amet, consectetur
                                        adipiscing
                                        elit.</p>
                                </div>

                            </div>
                            <div class="uk-width-1-2@s uk-border-rounded">
                                <div>
                                    <img alt=""
                                         src="${pageContext.request.contextPath}/resources/img/news/NewsImage1.jpg">
                                    <p class="uk-text-center">Default Lorem ipsum dolor sit amet, consectetur
                                        adipiscing
                                        elit.</p>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div uk-grid>
                            <div class="uk-width-1-2@s">
                                <div class="uk-border-rounded">
                                    <img alt="" src="${pageContext.request.contextPath}/resources/img/news/light.jpg">
                                    <p class="uk-text-center">Default Lorem ipsum dolor sit amet, consectetur
                                        adipiscing
                                        elit.</p>
                                </div>
                            </div>
                            <div class="uk-width-1-2@s uk-border-rounded">
                                <div>
                                    <img alt=""
                                         src="${pageContext.request.contextPath}/resources/img/news/newsHead.jpg">
                                    <p class="uk-text-center">Default Lorem ipsum dolor sit amet, consectetur
                                        adipiscing
                                        elit.</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="uk-width-1-3@s">
                    <div class="uk-background-default uk-panel uk-border-rounded" style="">
                        <div clas="uk-display-inline-block">
                            <h4 class="uk-heading-bullet">Benedictine Events</h4>
                            <div class="uk-card uk-card-default uk-card-body uk-background-muted">
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
                                            <div style="font-weight: 300; font-size: 1.00rem"
                                                 class="uk-text-lead uk-text-bold">${events.title}
                                            </div>
                                            <div style="font-weight: 300; font-size: 0.75rem">${events.location}</div>

                                            <div style="font-weight: 300; font-size: 0.80rem">${time.get(loop.index)}</div>
                                        </div>

                                    </div>
                                </c:forEach>
                                <br>

                            </div>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="videos">
            <h2 class="heading">Latest Video</h2>
            <div class="uk-child-width-1-2@m uk-grid-small uk-grid-match" uk-grid>
                <div>
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/yzlLspaUaBw" frameborder="0"
                            allow="autoplay; encrypted-media" allowfullscreen></iframe>

                    <br>
                    <h2><a href="#">${newestVideo.title}</a></h2>
                    <p class="author"><span>${videoDate}</span></p>
                </div>
                <div>
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/tYhI4f0vlvc" frameborder="0"
                            allow="autoplay; encrypted-media" allowfullscreen></iframe>

                    <br>
                    <h2><a href="#">${newestVideo.title}</a></h2>
                    <p class="author"><span>${videoDate}</span></p>
                </div>
            </div>
            <p><a href="${pageContext.request.contextPath}/allVideos">More videos</a></p>

        </div>
    </div>

</div>


</body>
</html>
