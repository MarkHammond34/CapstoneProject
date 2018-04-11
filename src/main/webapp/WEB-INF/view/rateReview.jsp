<%@include file="jspf/header.jsp" %>

<body>
<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div id="central">
    <div class="uk-margin-left form">
        <h1>Review/Rating Form</h1>
        <p>Please leave a review for this seller. Leave a rating from 1
            to 5, 5 being the best experience.</p>
        <div id="form">
            <form id="form" name="rateReview" action="reviewRateSeller"
                  class="uk-form" method="POST">
                <div class="uk-margin-left uk-margin-top uk-position-center">
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
                    <input type="submit" class="uk-margin-top uk-button uk-button-primary" name="submit"
                           value="Leave Your Review" id="send-message"
                           style="clear: both;">
                    <%@include file="jspf/messages.jsp" %>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<%@include file="jspf/footer.jspf" %>
</html>