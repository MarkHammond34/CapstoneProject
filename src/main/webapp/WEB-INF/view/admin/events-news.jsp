<%@include file="admin-header.jsp" %>

<body onload="loadArticles()">

<%@include file="admin-navbar.jsp" %>

<%@include file="../jspf/messages.jsp" %>


<div class="uk-container">

    <h1 class="uk-heading-line uk-text-center uk-padding-small"><span>Admin Community Page</span></h1>
    <ul class="uk-subnav uk-subnav-pill" uk-switcher>
        <li><a href="#">Create</a></li>
        <li><a href="#">Manage</a></li>
    </ul>

    <ul class="uk-switcher uk-margin">

        <li>
            <%@include file="create-news-events-videos.jsp" %>
        </li>
        <li>
            <div uk-grid>
                <div class="uk-width-2-3">
                    <%@include file="manage-news-events-videos.jsp" %>
                </div>
                <div class="uk-width-1-3">
                    <div class="uk-section-default uk-padding">
                        <div class="uk-container">
                            <h3>Community Page Outline</h3>
                            <hr>
                            <img src="${pageContext.request.contextPath}/resources/img/news/news_outline.png">
                        </div>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</div>

<script type="text/javascript">

    var lastID;


    function handleChangeMain(newsArticle, articleType) {
        console.log("Hit Servlet")

        var article = newsArticle.value.split(",");

        var id = article[0];
        var newIndex = parseInt(article[1]) + 1;

        var noneIndex;
        var count = false;
        var type = articleType;

        var jsonArray = ${requestScope.newsArticlesJson};

        for (var key in jsonArray) {
            var index = parseInt(key) + 1;

            if (jsonArray[key].displayType == type) {
                document.getElementById("main1").options[index].disabled = false;
                document.getElementById("main2").options[index].disabled = false;
                document.getElementById("main3").options[index].disabled = false;
                document.getElementById("feature1").options[index].disabled = false;
                document.getElementById("feature2").options[index].disabled = false;
                document.getElementById("feature3").options[index].disabled = false;
                document.getElementById("feature4").options[index].disabled = false;

                document.getElementById(type).selectedIndex = newIndex;
                document.getElementById("main1").options[newIndex].disabled = true;
                document.getElementById("main2").options[newIndex].disabled = true;
                document.getElementById("main3").options[newIndex].disabled = true;
                document.getElementById("feature1").options[newIndex].disabled = true;
                document.getElementById("feature2").options[newIndex].disabled = true;
                document.getElementById("feature3").options[newIndex].disabled = true;
                document.getElementById("feature4").options[newIndex].disabled = true;

            } else {
                    document.getElementById(type).selectedIndex = newIndex;
                    document.getElementById("main1").options[newIndex].disabled = true;
                    document.getElementById("main2").options[newIndex].disabled = true;
                    document.getElementById("main3").options[newIndex].disabled = true;
                    document.getElementById("feature1").options[newIndex].disabled = true;
                    document.getElementById("feature2").options[newIndex].disabled = true;
                    document.getElementById("feature3").options[newIndex].disabled = true;
                    document.getElementById("feature4").options[newIndex].disabled = true;
                }
            }
            index++;

        }

        console.log("Select Index: " + index);
        if ( type != 'none') {
            $.ajax({
                type: 'GET',
                url: 'updateNews',
                data: {"newsID": id, "type": type},
            })



    }

    function loadArticles(allArticles) {
        var articles = allArticles;

        var jsonArray = ${requestScope.newsArticlesJson};

        for (var key in jsonArray) {

            var index = parseInt(key) + 1;

            if (jsonArray[key].displayType == 'main1') {
                console.log("Article = main1");
                document.getElementById("main1").selectedIndex = index;
                document.getElementById("main2").options[index].disabled = true;
                document.getElementById("main3").options[index].disabled = true;
                document.getElementById("feature1").options[index].disabled = true;
                document.getElementById("feature2").options[index].disabled = true;
                document.getElementById("feature3").options[index].disabled = true;
                document.getElementById("feature4").options[index].disabled = true;

            } else if (jsonArray[key].displayType == 'main2') {
                console.log("Article = main2");
                document.getElementById("main2").selectedIndex = index;
                document.getElementById("main1").options[index].disabled = true;
                document.getElementById("main3").options[index].disabled = true;
                document.getElementById("feature1").options[index].disabled = true;
                document.getElementById("feature2").options[index].disabled = true;
                document.getElementById("feature3").options[index].disabled = true;
                document.getElementById("feature4").options[index].disabled = true;

            } else if (jsonArray[key].displayType == 'main3') {
                console.log("Article = main3");
                document.getElementById("main3").selectedIndex = index;
                document.getElementById("main2").options[index].disabled = true;
                document.getElementById("main1").options[index].disabled = true;
                document.getElementById("feature1").options[index].disabled = true;
                document.getElementById("feature2").options[index].disabled = true;
                document.getElementById("feature3").options[index].disabled = true;
                document.getElementById("feature4").options[index].disabled = true;

            } else if (jsonArray[key].displayType == 'feature1') {
                console.log("Article = feature 1");
                document.getElementById("feature1").selectedIndex = index;
                document.getElementById("main1").options[index].disabled = true;
                document.getElementById("main2").options[index].disabled = true;
                document.getElementById("main3").options[index].disabled = true;
                document.getElementById("feature2").options[index].disabled = true;
                document.getElementById("feature3").options[index].disabled = true;
                document.getElementById("feature4").options[index].disabled = true;

            }
            else if (jsonArray[key].displayType == 'feature2') {
                console.log("Article = feature 2");
                document.getElementById("feature2").selectedIndex = index;
                document.getElementById("main1").options[index].disabled = true;
                document.getElementById("main2").options[index].disabled = true;
                document.getElementById("main3").options[index].disabled = true;
                document.getElementById("feature1").options[index].disabled = true;
                document.getElementById("feature3").options[index].disabled = true;
                document.getElementById("feature4").options[index].disabled = true;

            } else if (jsonArray[key].displayType == 'feature3') {
                console.log("Article = feature 3");
                document.getElementById("feature3").selectedIndex = index;
                document.getElementById("main1").options[index].disabled = true;
                document.getElementById("main2").options[index].disabled = true;
                document.getElementById("main3").options[index].disabled = true;
                document.getElementById("feature1").options[index].disabled = true;
                document.getElementById("feature2").options[index].disabled = true;
                document.getElementById("feature4").options[index].disabled = true;

            } else if (jsonArray[key].displayType == 'feature1') {
                console.log("Article = feature 4");
                document.getElementById("feature4").selectedIndex = index;
                document.getElementById("main1").options[index].disabled = true;
                document.getElementById("main2").options[index].disabled = true;
                document.getElementById("main3").options[index].disabled = true;
                document.getElementById("feature1").options[index].disabled = true;
                document.getElementById("feature2").options[index].disabled = true;
                document.getElementById("feature3").options[index].disabled = true;
            }
        }

    }
</script>


</body>
</html>
