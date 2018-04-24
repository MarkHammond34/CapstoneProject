<%@include file="jspf/header.jsp" %>

<body class="uk-height-viewport uk-background-muted">
<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div class="uk-align-center uk-section uk-background-muted">
    <div class="uk-margin uk-card uk-card-default uk-card-body">
        <h2><strong>
            <div class="uk-text-bold uk-margin-top uk-text-center uk-text-uppercase"> Review/Rating Form</div>
        </strong></h2>
    </div>
    <div class="uk-margin-top uk-align-center uk-text-center">
        <p>Please leave a review for this seller. Leave a rating from 1
            to 5 stars, 5 being the best experience.</p></div>
    <div class="uk-tile uk-align-center uk-padding-remove-top uk-padding-remove-bottom uk-padding-remove-right uk-padding-remove-left uk-box-shadow-medium uk-box-shadow-hover-large uk-tile-default uk-width-2-3">
        <form id="form" name="rateReview" action="reviewRateSeller"
              class="uk-form uk-align-center uk-margin-right" method="POST">
            <div class="uk-margin-left">
                <input class="uk-input" type="hidden" name="id"
                       value="${id}">
            </div>
            <div class="uk-margin-left uk-margin-top">
							<textarea class="uk-textarea" rows="5" cols="100"
                                      placeholder="Please leave your genuine, honest review here" name="transReview"
                                      required></textarea>
            </div>
            <div class="uk-margin-left uk-margin-top uk-grid-small uk-child-width-auto uk-grid">
                <div class="uk-form-controls">
                    <label><input class="uk-radio" type="radio" name="transRating" value="5" checked> <span
                            uk-icon="icon: star"></span><span uk-icon="icon: star"></span><span
                            uk-icon="icon: star"></span><span uk-icon="icon: star"></span><span
                            uk-icon="icon: star"></span></label><br>
                    <label><input class="uk-radio" type="radio" name="transRating" value="4"> <span
                            uk-icon="icon: star"></span><span uk-icon="icon: star"></span><span
                            uk-icon="icon: star"></span><span uk-icon="icon: star"></span></label><br>
                    <label><input class="uk-radio" type="radio" name="transRating" value="3"> <span
                            uk-icon="icon: star"></span><span uk-icon="icon: star"></span><span
                            uk-icon="icon: star"></span></label><br>
                    <label><input class="uk-radio" type="radio" name="transRating" value="2"> <span
                            uk-icon="icon: star"></span><span uk-icon="icon: star"></span></label><br>
                    <label><input class="uk-radio" type="radio" name="transRating" value="1"> <span
                            uk-icon="icon: star"></span>
                    </label><br>
                </div>
            </div>
            <input type="submit"
                   class="uk-margin-left uk-margin-top uk-margin-bottom uk-button uk-button-secondary uk-border-rounded"
                   name="submit"
                   value="Leave Your Review" id="send-message"
                   style="clear: both;">
            <%@include file="jspf/messages.jsp" %>
    </div>
    </form>
</div>
</div>
</div>
</body>

</html>