<%@include file="admin-header.jsp" %>

<body onload="loadArticles(${allNewsArticles})">

<%@include file="admin-navbar.jsp" %>

<%@include file="../jspf/messages.jsp" %>


<div class="uk-container">

    <h1 class="uk-heading-line uk-text-center"><span>Admin Community Page</span></h1>
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
    var selected = [];

    $('select').change(function () {


        console.log("Hit Onload");

        var value = $(this).val();

        console.log("This: " + $(this));

        $(".uk-margin").find('select').children('option').each(function () {
            console.log("This value: " + $(this).val());
            console.log("Value: " + value);


            if ($(this).val() === value && $(this).val() != "none") {
                selected.push($(this).value);

                $(this).attr('disabled', true);
                console.log("Push Size: " + selected.length);

                for (var i = 0; i < selected.length; i++) {
                    if (selected[i] === "main1") {

                    } else if (selected[i] === "main2") {

                    } else if (selected[i] === "main3") {

                    }
                    $(this).siblings().removeAttr('disabled');
                }

            }
        });

    });


    function handleChangeMain(currentArticleValue, currentArticleID) {
        console.log("Hit Servlet")


    }

    function loadArticles(allArticles) {
        console.log("Hit Onload");
        console.log("Articles" + allArticles.size);

        for (var i = 0; i < allArticles.length(); i++) {
            console.log("display Type: " + allArticles.get(i).displayType);
        }




    }
</script>


</body>
</html>
