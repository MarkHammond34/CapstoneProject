<%@include file="jspf/header.jsp" %>

<body class="uk-background-muted uk-height-viewport">

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div class="uk-container">

    <div class="uk-width-2-3@m uk-width-1-1@s uk-align-center uk-margin-large-bottom">

        <h1>Report a Listing</h1>

        <div class="uk-tile uk-tile-default uk-box-shadow-medium uk-box-shadow-hover-large uk-border-rounded">

            <form id="form" name="reportListing" action="reportListingEmail" class="uk-margin-top uk-form"
                  method="POST">
                <div class="uk-margin">
                    <input class="uk-input" type="text" name="reportUsername"
                           placeholder="${sessionScope.user.username}" disabled>
                </div>
                <div class="uk-margin">
                    <input class="uk-input" type="email" name="reportEmail"
                           placeholder="${sessionScope.user.schoolEmail}" disabled>
                </div>
                <h3>Seller Information</h3>
                <div class="uk-margin">
                    <input class="uk-input" type="text" name="sellerName"
                           placeholder="${listing.user.username}" disabled>
                </div>
                <div class="uk-margin">
                    <input class="uk-input" type="email" name="sellerEmail"
                           placeholder="${listing.user.schoolEmail}" disabled>
                </div>
                <div class="uk-margin">
                    <input class="uk-input" type="text" name="listingName" placeholder="${listing.name}"
                           disabled>
                </div>
                <textarea class="uk-textarea" rows="5" cols="100" name="message"
                          placeholder="Please write your reason for the report here"></textarea>
                <div id="mail-status"></div>
                <input type="submit" class="uk-button uk-button-primary" name="submit" value="Send Report"
                       style="clear: both;">
            </form>

        </div>

    </div>

</div>

<%--<%@include file="jspf/footer.jspf" %>--%>

</body>
</html>