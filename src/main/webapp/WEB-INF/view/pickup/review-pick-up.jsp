<%@include file="../jspf/header.jsp" %>
<body class="uk-background-muted">
<%@include file="../jspf/navbar.jspf" %>

<%@include file="../jspf/messages.jsp" %>

<div class="uk-container">
    <div class="uk-margin-large-bottom">

        <ul class="uk-breadcrumb">
            <li><a href="/">Home</a></li>
            <li><a href="/listing?l=${pickUp.transaction.listingID.id}">Listing</a></li>
            <li><span>Pick Up</span></li>
        </ul>

        <div class="uk-child-width-expand@s" uk-grid>

            <!-- Left Side -->
            <div class="uk-width-2-3@m uk-width-1-1@s" style="height: 100%">
                <form action="/pick-up-edit" method="post">
                    <h2 class="uk-heading">Pick Up Details
                        <c:if test="${sessionScope.user.userID == pickUp.transaction.seller.userID}">
                            <a onclick="toggleEditDetails();" uk-icon="icon: pencil"></a>
                        </c:if>
                    </h2>
                    <div class="uk-card uk-card-default pickup-tutorial"
                         data-intro="Here you can review the pick up info and chat to pick the best time and place for your."
                         data-step="1">
                        <div class="uk-card-body" uk-grid>
                            <div class="uk-width-1-1 uk-margin-auto-vertical">
                                <span class="uk-align-center">
                                <c:choose>
                                    <c:when test="${sessionScope.user.userID == pickUp.transaction.seller.userID}">
                                        <span class="uk-width-1-3@m uk-width-1-1@s uk-padding-small">
                                            <span class="uk-text-large">
                                            <strong style="color: #ff695c">Location: </strong>${pickUp.location.name}
                                                <input id="editLocationName" style="display: none;" type="text"
                                                       class="uk-input"
                                                       name="newName" value="${pickUp.location.name}">
                                            </span>
                                        </span>
                                        <span class="uk-width-1-3@m uk-width-1-1@s uk-padding-small"><span
                                                class="uk-text-large">
                                        <strong
                                                style="color: #ff695c">Date: </strong>
                                            <c:choose>
                                                <c:when test="${pickUp.pickUpDate == null}">
                                                    TBD
                                                </c:when>
                                                <c:otherwise>
                                                    ${pickUp.pickUpDate}
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                            <input id="editDate" style="display: none;" type="date" class="uk-input"
                                                   name="newDate"></span>
                                        <span class="uk-width-1-3@m uk-width-1-1@s uk-padding-small"><span
                                                class="uk-text-large"><strong
                                                style="color: #ff695c">Time: </strong>
                                                <c:choose>
                                                    <c:when test="${pickUp.pickUpTime == null}">
                                                        TBD
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${pickUp.pickUpTime}
                                                    </c:otherwise>
                                                </c:choose>
                                        <input id="editTime" style="display: none;" type="time" class="uk-input"
                                               name="newTime"></span>
                                        </span>
                                        <input type="hidden" value="${pickUp.pickUpID}" name="pickUpID">
                                        <input type="hidden" id="newPosition" value="" name="newPosition">
                                    </c:when>
                                    <c:otherwise>
                                        <span class="uk-width-1-3@m uk-width-1-1@s uk-padding-small"><span
                                                class="uk-text-large"><strong
                                                style="color: #ff695c">Location: </strong>${pickUp.location.name}</span>
                                        </span>
                                        <span class="uk-width-1-3@m uk-width-1-1@s uk-padding-small"><span
                                                class="uk-text-large"><strong
                                                style="color: #ff695c">Date: </strong>${pickUp.pickUpDate}</span>
                                        </span>
                                        <span class="uk-width-1-3@m uk-width-1-1@s uk-padding-small"><span
                                                class="uk-text-large"><strong
                                                style="color: #ff695c">Time: </strong>${pickUp.pickUpTime}</span>
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                                </span>
                            </div>
                            <div class="uk-width-1-1">
                                <div id="map" style="width:100%;height:400px;"></div>
                            </div>
                        </div>
                    </div>
                    <button id="editButton" style="display: none;" type="submit" onclick="setLatAndLong();"
                            class="uk-float-left uk-margin-medium-left uk-margin-small-top uk-button-large uk-border-rounded uk-button-primary uk-box-shadow-hover-large">
                        Edit
                    </button>
                </form>
            </div>

            <!-- Right Side -->
            <div class="uk-width-1-3@m uk-width-1-1@s">
                <h2 class="uk-heading">Messages</h2>
                <div class="uk-card uk-card-default">
                    <div class="uk-card-header">
                        <a class="uk-float-right" onclick="refreshPage(500);" title="Refresh"
                           uk-icon="icon: refresh"></a>
                    </div>
                    <div class="uk-panel-scrollable uk-height-medium">
                        <div class="uk-border-rounded uk-margin">
                            <c:choose>
                                <c:when test="${pickUp.conversation.messages == null}">
                                    <div>
                                        <div class="uk-float-right uk-width-3-4 uk-background-muted uk-border-rounded uk-padding-small"
                                             style="border-style: solid; border-width: 2px; border-color: darkgray">
                                            Be The First To Send A Message
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${pickUp.conversation.messages}" var="message">
                                        <c:choose>
                                            <c:when test="${sessionScope.user.userID != message.user.userID}">
                                                <div>
                                                    <div class="uk-float-left uk-width-3-4 uk-text-left uk-background-primary uk-border-rounded uk-padding-small"
                                                         style="color: white;">${message.messageBody}
                                                    </div>
                                                    <p class="uk-align-left uk-margin-remove-top uk-margin-small-left"
                                                       style="font-size: 12px;">${message.dateSent}</p>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div>
                                                    <div class="uk-float-right uk-width-3-4 uk-background-muted uk-border-rounded uk-padding-small"
                                                         style="border-style: solid; border-width: 2px; border-color: darkgray">
                                                            ${message.messageBody}
                                                    </div>
                                                    <p class="uk-align-right uk-margin-remove-top uk-margin-small-right"
                                                       style="font-size: 12px;">${message.dateSent}</p>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <!-- Send Message -->
                    <div class="uk-card-footer uk-grid-small" uk-grid>
                        <input class="uk-input uk-background-muted uk-border-rounded uk-width-4-5" type="text"
                               name="message" placeholder="Send A Message" id="message">
                        <a class="uk-width-1-5" title="Send"
                           uk-icon="icon: chevron-right; ratio: 2"
                           onclick="sendMessage();"></a>
                    </div>
                </div>

                <!-- Display Appropriate Buttons -->
                <div class="uk-width-1-3@s uk-width-1-1@m">
                    <c:choose>

                        <c:when test="${pickUp.buyerAccept == 0 && pickUp.transaction.seller.userID == sessionScope.user.userID}">
                            <!-- Display Disabled Checkout Button -->
                            <button title="Checkout"
                                    onclick="showErrorMessage('Buyer Must Accept Before You Can Checkout');"
                                    class="uk-button-default uk-button-large uk-border-rounded uk-margin-large-top uk-float-right uk-box-shadow-hover-large">
                                Checkout
                            </button>
                        </c:when>

                        <c:when test="${pickUp.buyerAccept == 0 && pickUp.transaction.buyer.userID == sessionScope.user.userID}">
                            <!-- Display Accept Button -->
                            <button title="Accept" uk-toggle="target: #acceptModal"
                                    class="uk-button-primary uk-button-large uk-border-rounded uk-margin-large-top uk-float-right uk-box-shadow-hover-large">
                                Accept Pick Up
                            </button>
                        </c:when>

                        <c:when test="${pickUp.buyerAccept == 1 && pickUp.transaction.transactionType == 'pending checkout'}">
                            <!-- Display Checkout Button -->
                            <form action="/checkout" method="get">
                                <input name="l" type="hidden"
                                       value="${pickUp.transaction.listingID.id}">
                                <button title="Checkout" type="submit"
                                        class="uk-button-primary uk-button-large uk-border-rounded uk-margin-large-top uk-float-right uk-box-shadow-hover-large">
                                    Checkout
                                </button>
                            </form>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="acceptModal" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">Accept Pick Up</h2>
            <a class="uk-link-muted uk-modal-close uk-position-top-right uk-padding"
               type="button"> <strong>X</strong></a>
        </div>
        <div class="uk-modal-body uk-margin-auto-vertical">
            <ul class="uk-list uk-text-center">
                <li class="uk-width-1-1"><span class="uk-text-large"><strong
                        style="color: #ff695c">Location: </strong>${pickUp.location.name}</span>
                </li>
                <li class="uk-width-1-1 uk-margin-large-top"><span class="uk-text-large"><strong
                        style="color: #ff695c">Date: </strong>${pickUp.pickUpDate}</span>
                </li>
                <li class="uk-width-1-1 uk-margin-large-top"><span class="uk-text-large"><strong
                        style="color: #ff695c">Time: </strong>${pickUp.pickUpTime}</span>
                </li>
            </ul>
        </div>
        <form action="/pick-up-accept" method="post">
            <div class="uk-modal-footer">
                <input name="pickUpID" type="hidden" value="${pickUp.pickUpID}">
                <button class="uk-button-primary uk-float-right uk-button-large uk-border-rounded" type="submit">Accept
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    var map;
    var marker;
    var markerPosition;

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: ${latitude}, lng: ${longitude}},
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.HYBRID
        });

        markerPosition = new google.maps.LatLng(${pickUp.location.latitude}, ${pickUp.location.longitude});
        marker = new google.maps.Marker({
            position: markerPosition,
            map: map,
            animation: google.maps.Animation.DROP,
            title: 'Meeting Location'
        });
    }

    function sendMessage() {
        $.ajax({
            type: 'POST',
            url: '/sendPickUpMessage',
            data: {message: document.getElementById("message").value, pickUpID: ${pickUp.pickUpID}},
        })

        refreshPage(1000);
    }

    function refreshPage(timeout) {
        setTimeout(function () {
            location.reload();
        }, timeout);
    }

    function toggleEditDetails() {

        if (document.getElementById("editButton").style.display == "inline") {
            document.getElementById("editButton").style.display = "none";
        } else {
            document.getElementById("editButton").style.display = "inline";
        }

        if (document.getElementById('editLocationName').style.display == "inline") {
            document.getElementById("editLocationName").style.display = "none"
        } else {
            document.getElementById("editLocationName").style.display = "inline";
        }

        if (document.getElementById("editTime").style.display == "inline") {
            document.getElementById("editTime").style.display = "none";
        } else {
            document.getElementById("editTime").style.display = "inline";
        }

        if (document.getElementById("editDate").style.display == "inline") {
            document.getElementById("editDate").style.display = "none";
        } else {
            document.getElementById("editDate").style.display = "inline";
        }

        marker.setMap(null);

        marker = new google.maps.Marker({
            position: markerPosition,
            map: map,
            draggable: true,
            animation: google.maps.Animation.DROP,
            title: 'Meeting Location'
        });

        google.maps.event.addListener(marker, 'dragend', function (evt) {
            document.getElementById("newPosition").value = marker.position;
        });
    }

    function showErrorMessage(message) {

        // Get message box
        var messageBox = document.getElementById("messageBox");

        // Create a new error div
        var newErrorDiv = document.createElement("DIV");

        // Add style to newErrorDiv
        newErrorDiv.style.textAlign = "center";
        newErrorDiv.style.marginTop = "40px";

        // Add uk-alert-success as a class
        var newErrorDivClass = document.createAttribute("class");
        newErrorDivClass.value = "uk-alert-danger";
        newErrorDiv.setAttributeNode(newErrorDivClass);
        newErrorDiv.setAttributeNode(document.createAttribute("uk-alert"));

        // Add alert close anchor
        var newErrorDivClose = document.createElement("A");
        var newErrorDivCloseClass = document.createAttribute("class");
        newErrorDivCloseClass.value = "uk-alert-close";
        newErrorDivClose.setAttributeNode(newErrorDivCloseClass);
        newErrorDivClose.setAttributeNode(document.createAttribute("uk-close"));

        // Add anchor to newErrorDiv
        newErrorDiv.appendChild(newErrorDivClose);

        // Add error message p to newErrorDiv
        var newErrorDivPara = document.createElement("P");
        newErrorDivPara.appendChild(document.createTextNode(message));
        newErrorDiv.appendChild(newErrorDivPara);

        // Add error div to message box
        messageBox.appendChild(newErrorDiv);

    }

    function showWarningMessage(message) {

        // Get message box
        var messageBox = document.getElementById("messageBox");

        // Create a new warning div
        var newWarningDiv = document.createElement("DIV");

        // Add style to newWarning
        newWarningDiv.style.textAlign = "center";
        newWarningDiv.style.marginTop = "40px";

        // Add uk-alert-warning as a class
        var newWarningDivClass = document.createAttribute("class");
        newWarningDivClass.value = "uk-alert-warning";
        newWarningDiv.setAttributeNode(newWarningDivClass);
        newWarningDiv.setAttributeNode(document.createAttribute("uk-alert"));

        // Add alert close anchor
        var newWarningDivClose = document.createElement("A");
        var newWarningDivCloseClass = document.createAttribute("class");
        newWarningDivCloseClass.value = "uk-alert-close";
        newWarningDivClose.setAttributeNode(newWarningDivCloseClass);
        newWarningDivClose.setAttributeNode(document.createAttribute("uk-close"));

        // Add anchor to newWarningDiv
        newWarningDiv.appendChild(newWarningDivClose);

        // Add warning message p to newErrorDiv
        var newWarningDivPara = document.createElement("P");
        newWarningDivPara.appendChild(document.createTextNode(message));
        newWarningDiv.appendChild(newErrorDivPara);

        // Add warning div to message box
        messageBox.appendChild(newWarningDiv);

    }

    function showSuccessMessage(message) {

        // Get message box
        var messageBox = document.getElementById("messageBox");

        // Create a new success div
        var newSuccessDiv = document.createElement("DIV");

        // Add style to newWarning
        newSuccessDiv.style.textAlign = "center";
        newSuccessDiv.style.marginTop = "40px";

        // Add uk-alert-warning as a class
        var newSuccessDivClass = document.createAttribute("class");
        newSuccessDivClass.value = "uk-alert-success";
        newSuccessDiv.setAttributeNode(newSuccessDivClass);
        newSuccessDiv.setAttributeNode(document.createAttribute("uk-alert"));

        // Add alert close anchor
        var newSuccessDivClose = document.createElement("A");
        var newSuccessDivCloseClass = document.createAttribute("class");
        newSuccessDivCloseClass.value = "uk-alert-close";
        newSuccessDivClose.setAttributeNode(newSuccessDivCloseClass);
        newSuccessDivClose.setAttributeNode(document.createAttribute("uk-close"));

        // Add anchor to newSuccessDiv
        newSuccessDiv.appendChild(newSuccessDivClose);

        // Add success message p to newErrorDiv
        var newSuccessDivPara = document.createElement("P");
        newSuccessDivPara.appendChild(document.createTextNode(message));
        newSuccessDiv.appendChild(newSuccessDivPara);

        // Add success div to message box
        messageBox.appendChild(newSuccessDiv);

    }

    function onload(showTutorial) {
        if (showTutorial == true) {
            setTimeout(function () {
                introJs(".pickup-tutorial").start();
            }, 2000);
        }

        introJs(".pickup-tutorial").start();
    }

</script>

<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAYv7pVPxQ-k7yWlKPfa8ebsx7ci9q7vQ8&callback=initMap"
        type="text/javascript"></script>

</body>
</html>