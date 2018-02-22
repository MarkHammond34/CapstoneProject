<%@ page import="edu.ben.model.Notification" %>
<%@include file="jspf/header.jsp" %>
<body style="background-color: whitesmoke;">

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div style="margin-top: 50px; margin-bottom: 50px;">

    <div class="uk-grid-large" uk-grid>
        <div class="uk-width-2-3 uk-align-center">
            <h2 class="uk-heading-primary uk-align-center">Notifications</h2>
            <ul class="uk-list" id="notificationSection" uk-grid>
                <c:forEach items="${notifications}" var="notification" varStatus="loop">
                    <c:choose>
                        <c:when test="${notification.type == 1}">
                            <c:choose>
                                <c:when test="${notification.viewed == 1}">
                                    <li class="uk-width-1-1 uk-padding-small uk-border-rounded"
                                        id="notification${notification.notificationID}"
                                        style="background-color: lightblue; font-size: 16px;">
                                        <img
                                                src="${pageContext.request.contextPath}/resources/img/icons/trophy.png"
                                                alt="Trophy" width="6%">
                                        <a href="/viewListing?l=${notification.listingID}"
                                           uk-icon="icon: link"> ${notification.message}</a>
                                        <a
                                                onclick="remove(${notification.notificationID});" class="uk-float-right"
                                                title="Remove"
                                                style="color: red"
                                                uk-icon="icon: close"></a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="uk-width-1-1 uk-padding-small uk-border-rounded"
                                        id="notification${notification.notificationID}"
                                        style="font-size: 16px;">
                                        <img
                                                src="${pageContext.request.contextPath}/resources/img/icons/trophy.png"
                                                alt="Trophy" width="6%">
                                        <a href="/viewListing?l=${notification.listingID}"
                                           uk-icon="icon: link"> ${notification.message}</a>
                                        <a
                                                onclick="remove(${notification.notificationID});" class="uk-float-right"
                                                title="Remove"
                                                style="color: red"
                                                uk-icon="icon: close"></a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:when test="${notification.type == 2}">
                            <c:choose>
                                <c:when test="${notification.viewed == 1}">
                                    <li class="uk-width-1-1 uk-padding-small uk-border-rounded"
                                        id="notification${notification.notificationID}"
                                        style="background-color: lightblue; font-size: 16px;">
                                        <img
                                                src="${pageContext.request.contextPath}/resources/img/icons/cash.png"
                                                alt="Cash" width="6%">
                                        <a href="/viewListing?l=${notification.listingID}"
                                           uk-icon="icon: link"> ${notification.message}</a>
                                        <a
                                                onclick="remove(${notification.notificationID});" class="uk-float-right"
                                                title="Remove"
                                                style="color: red"
                                                uk-icon="icon: close"></a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="uk-width-1-1 uk-padding-small uk-border-rounded"
                                        id="notification${notification.notificationID}"
                                        style="font-size: 16px;">
                                        <img
                                                src="${pageContext.request.contextPath}/resources/img/icons/cash.png"
                                                alt="Trophy" width="6%">
                                        <a href="/viewListing?l=${notification.listingID}"
                                           uk-icon="icon: link"> ${notification.message}</a>
                                        <a
                                                onclick="remove(${notification.notificationID});" class="uk-float-right"
                                                title="Remove"
                                                style="color: red"
                                                uk-icon="icon: close"></a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:when test="${notification.type == 3}">
                            <c:choose>
                                <c:when test="${notification.viewed == 1}">
                                    <li class="uk-width-1-1 uk-padding-small uk-border-rounded"
                                        id="notification${notification.notificationID}"
                                        style="background-color: lightblue; font-size: 16px;">
                                        <img
                                                src="${pageContext.request.contextPath}/resources/img/icons/cancel.png"
                                                alt="Cancel" width="6%">
                                        <a href="/viewListing?l=${notification.listingID}"
                                           uk-icon="icon: link"> ${notification.message}</a>
                                        <a
                                                onclick="remove(${notification.notificationID});" class="uk-float-right"
                                                title="Remove"
                                                style="color: red"
                                                uk-icon="icon: close"></a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="uk-width-1-1 uk-padding-small uk-border-rounded"
                                        id="notification${notification.notificationID}"
                                        style="font-size: 16px;">
                                        <img
                                                src="${pageContext.request.contextPath}/resources/img/icons/cancel.png"
                                                alt="Cancel" width="6%" uk-cover>
                                        <a href="/viewListing?l=${notification.listingID}"
                                           uk-icon="icon: link"> ${notification.message}</a>
                                        <a
                                                onclick="remove(${notification.notificationID});" class="uk-float-right"
                                                title="Remove"
                                                style="color: red"
                                                uk-icon="icon: close"></a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${notification.viewed == 1}">
                                    <li class="uk-width-1-1 uk-padding-small uk-border-rounded"
                                        id="notification${notification.notificationID}"
                                        style="background-color: lightblue; font-size: 16px;">
                                        <img
                                                src="${pageContext.request.contextPath}/resources/img/icons/star.png"
                                                alt="Star" width="6%">
                                        <a href="/viewListing?l=${notification.listingID}"
                                           uk-icon="icon: link"> ${notification.message}</a>
                                        <a
                                                onclick="remove(${notification.notificationID});" class="uk-float-right"
                                                title="Remove"
                                                style="color: red"
                                                uk-icon="icon: close"></a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="uk-width-1-1 uk-padding-small uk-border-rounded"
                                        id="notification${notification.notificationID}"
                                        style="font-size: 16px;">
                                        <img
                                                src="${pageContext.request.contextPath}/resources/img/icons/star.png"
                                                alt="Star" width="6%">
                                        <a href="/viewListing?l=${notification.listingID}"
                                           uk-icon="icon: link"> ${notification.message}</a>
                                        <a
                                                onclick="remove(${notification.notificationID});" class="uk-float-right"
                                                title="Remove"
                                                style="color: red"
                                                uk-icon="icon: close"></a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
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
        document.getElementById('notification' + notificationID).style.display = "none";
    }

    function removeAll(notifications) {
        $.ajax({
            type: 'GET',
            url: '/removeAll',
            data: {n: notifications},
        })
        document.getElementById('notificationSection').style.display = "none";
    }
</script>
</body>
</html>