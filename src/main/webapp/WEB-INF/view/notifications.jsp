<%@ page import="edu.ben.model.Notification" %>
<%@include file="jspf/header.jsp" %>
<body style="background-color: whitesmoke;">

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div style="margin-top: 50px; margin-bottom: 50px;">

    <div class="uk-grid-large" uk-grid>
        <div class="uk-width-2-3 uk-align-center">
            <h2 class="uk-heading-primary uk-align-center">Notifications</h2>
            <hr>
            <ul class="uk-list" id="notificationSection" uk-grid>
                <c:forEach items="${notifications}" var="notification" varStatus="loop">
                    <li class="uk-width-1-1 uk-padding-small uk-border-rounded"
                        id="notification${notification.notificationID}Item"
                        style="font-size: 16px;"
                        onmouseover="turnOrange(this);"
                        onmouseleave="normal(this);">
                        <div class="uk-grid-small">
                            <a
                                    onclick="remove(${notification.notificationID});"
                                    class="uk-float-right"
                                    title="Remove"
                                    style="color: red"
                                    uk-icon="icon: close; ratio: 1.3"></a>
                            <c:choose>
                                <c:when test="${notification.type == 'WON'}">
                                    <img
                                            src="${pageContext.request.contextPath}/resources/img/icons/trophy.png"
                                            alt="Trophy" width="8%">
                                </c:when>
                                <c:when test="${notification.type == 'SOLD'}">
                                    <img
                                            src="${pageContext.request.contextPath}/resources/img/icons/cash.png"
                                            alt="Trophy" width="8%">
                                </c:when>
                                <c:when test="${notification.type == 'BID_CANCEL'}">
                                    <img
                                            src="${pageContext.request.contextPath}/resources/img/icons/cancel.png"
                                            alt="Trophy" width="8%">
                                </c:when>
                                <c:when test="${notification.type == 'DISPUTE'}">
                                    <img
                                            src="${pageContext.request.contextPath}/resources/img/icons/gavel.png"
                                            alt="Gavel" width="8%">
                                </c:when>
                                <c:otherwise>
                                    <img
                                            src="${pageContext.request.contextPath}/resources/img/icons/star.png"
                                            alt="Trophy" width="8%">
                                </c:otherwise>
                            </c:choose>
                            <a href="/viewListing?l=${notification.listingID}"
                               uk-icon="icon: link"> ${notification.message}</a>
                            <c:if test="${notification.viewed == 0}">
                                <span class="uk-badge" style="background-color: #ff695c;">New</span>
                            </c:if>
                            <p class="uk-margin-large-left uk-margin-remove-top uk-margin-remove-bottom uk-text-small">
                                Date: ${notification.dateCreated}</p>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<%@include file="jspf/footer.jspf" %>

<script>

    function remove(notificationID) {
        $.ajax({
            type: 'GET',
            url: '/remove',
            data: {n: notificationID},
        })
        document.getElementById("notification" + notificationID + "Item").style.display = "none";
    }

    function turnOrange(x) {
        x.style.backgroundColor = "#ffdb99";
    }

    function normal(x) {
        x.style.backgroundColor = "whitesmoke";
    }

</script>
</body>
</html>