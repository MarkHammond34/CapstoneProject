<%@include file="jspf/header.jsp" %>

<body class="uk-background-muted">

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div class="u-list-it-background">
    <div class="uk-section-default">
        <div class="uk-section-large uk-overlay-default uk-background-cover"
             style="background-image:url('${pageContext.request.contextPath}/resources/img/index2.jpeg');">
        </div>
    </div>

    <br>
    <div class="uk-child-width-expand@s uk-text-center" uk-grid>
        <div class="uk-width-1-5">
            <h2>Tech</h2>
            <div class="uk-card uk-card-default uk-card-body uk-grid-margin">
                <div class="uk-section-large uk-overlay-default uk-background-cover"
                     style="background-image:url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRGgYAyjatdAyzmTAP5e5zM5VQsCC-FTp_Mn76XNhtW4Ygo19j);">
                </div>
            </div>
        </div>
        <div class="uk-width-1-4">
            <h2>Tech</h2>
            <div class="uk-card uk-card-default uk-card-body uk-grid-margin">
                <div class="uk-section-large uk-overlay-default uk-background-cover"
                     style="background-image:url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRGgYAyjatdAyzmTAP5e5zM5VQsCC-FTp_Mn76XNhtW4Ygo19j);">
                </div>
            </div>
        </div>
    </div>

</div>

<%@include file="checklist/checklist-modal.jsp" %>

<%@include file="checklist/checklist-sidenav.jsp" %>

<%@include file="jspf/footer.jspf" %>
<script>
    function trendingClicked() {
        document.getElementById('trending-listings').style.display = 'inline';
        document.getElementById('ending-soon-listings').style.display = 'none';
        document.getElementById('recently-added-listings').style.display = 'none';
        document.getElementById('relevant-listings').style.display = 'none';
        document.getElementById('premium-listings').style.display = 'none';
    }

    function endingSoonClicked() {
        document.getElementById('trending-listings').style.display = 'none';
        document.getElementById('ending-soon-listings').style.display = 'inline';
        document.getElementById('recently-added-listings').style.display = 'none';
        document.getElementById('relevant-listings').style.display = 'none';
        document.getElementById('premium-listings').style.display = 'none';
    }

    function recentlyAddedClicked() {
        document.getElementById('trending-listings').style.display = 'none';
        document.getElementById('ending-soon-listings').style.display = 'none';
        document.getElementById('recently-added-listings').style.display = 'inline';
        document.getElementById('relevant-listings').style.display = 'none';
        document.getElementById('premium-listings').style.display = 'none';
    }

    function recommendedClicked() {
        document.getElementById('trending-listings').style.display = 'none';
        document.getElementById('ending-soon-listings').style.display = 'none';
        document.getElementById('recently-added-listings').style.display = 'none';
        document.getElementById('relevant-listings').style.display = 'inline';
        document.getElementById('premium-listings').style.display = 'none';
    }

    function premiumClicked() {
        document.getElementById('trending-listings').style.display = 'none';
        document.getElementById('ending-soon-listings').style.display = 'none';
        document.getElementById('recently-added-listings').style.display = 'none';
        document.getElementById('relevant-listings').style.display = 'none';
        document.getElementById('premium-listings').style.display = 'inline';
    }


</script>
</body>
</html>