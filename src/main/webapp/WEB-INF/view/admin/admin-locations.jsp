<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<spring:url value="resources/css/uikit.css" var="uikitCSS"/>
<spring:url value="resources/js/uikit.js" var="uikitJS"/>
<spring:url value="resources/js/jquery.js" var="jquery"/>
<spring:url value="resources/js/uikit-icons.js" var="uikiticons"/>
<link href="${uikitCSS}" rel="stylesheet"/>
<script type="text/javascript" src="${uikitJS}"></script>
<script type="text/javascript" src="${jquery}"></script>
<script type="text/javascript" src="${uikiticons}"></script>
<head>
    <title>Locations</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body class="uk-background-muted">

<div class="uk-position-relative">
    <div class="uk-position-relativetop">
        <nav class="uk-navbar-container uk-navbar-dark" uk-navbar>
            <div class="uk-navbar-center">
                <ul class="uk-navbar-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin">Dashboard</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adminUser">Manage Users</a>
                    </li>
                    <li class="uk-active">
                        <a href="${pageContext.request.contextPath}/adminListing">Manage Listings</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adminDisputes">Manage Disputes</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/adminDisputes">Manage Disputes</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/eventsNews">Events/News</a>
                    </li>
                </ul>
            </div>
            <div class="uk-navbar-right">
                <ul class="uk-navbar-nav">
                    <li>
                        <a>Welcome ${user.firstName}</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/">Home</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>

<%@include file="../jspf/messages.jsp" %>

<div class="uk-grid" uk-grid>

    <div class="uk-width-3-4@m uk-width-1-1@s uk-align-center uk-card uk-card-default">
        <div class="uk-card-header">
            <ul class="uk-float-right uk-text-center" uk-tab="connect: #listMapSwitcher;">
                <li><a href="#">Safe Zones</a></li>
                <li><a href="#" onclick="addMapMarkers(${locationCount})">Pick Up Map</a></li>
            </ul>
            <h3 class="uk-float-left">Pick Up Locations</h3>
        </div>
        <div class="uk-card-body uk-grid" uk-grid>
            <ul class="uk-switcher uk-margin uk-card-body uk-align-center" id="listMapSwitcher">
                <li class="uk-margin-remove">
                    <table class=" uk-table uk-table-hover uk-align-center uk-width-1-1 uk-table-middle uk-table-divider">
                        <thead>
                        <tr>
                            <th class="uk-table-expand">Name</th>
                            <th class="uk-table-shrink">Latitude</th>
                            <th class="uk-table-shrink">Longitude</th>
                            <th class="uk-table-shrink uk-text-nowrap uk-text-center">Date Created</th>
                            <th class="uk-table-shrink"></th>
                            <th class="uk-table-shrink"></th>
                            <th class="uk-table-shrink">
                                <a href="#newSafeZoneModal" style="color: cornflowerblue"
                                   uk-icon="icon: plus-circle" title="Create" uk-toggle
                                   onclick="createNewMarker();"></a>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${safeZones}" var="location">
                            <tr>
                                <td>${location.name}</td>
                                <td class="uk-table-link">${location.latitude}</td>
                                <td class="uk-text-truncate">${location.longitude}</td>
                                <td class="uk-text-nowrap">${location.dateCreated}</td>
                                <td>
                                    <a href="#editModal${location.locationID}" uk-icon="icon: pencil" title="Edit"
                                       uk-toggle onclick="addNewMap();"></a>
                                </td>
                                <td>
                                    <a href="#deleteModal${location.locationID}" uk-icon="icon: trash"
                                       title="Delete" uk-toggle></a>
                                </td>
                                <td></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </li>
                <li>
                    <div class="uk-width-1-1" id="map" style="width:800px;height:400px;"></div>
                </li>
            </ul>
        </div>
    </div>
</div>

<!-- Create Safe Zone -->
<div id="newSafeZoneModal" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
        <h2 class="uk-modal-title">Create New Safe Zone</h2>
        <form method="post" action="/createSafeZone" class="uk-grid-small" uk-grid>

            <input type="hidden" type="text" name="position" id="position" required>

            <label class="uk-form-label uk-width-1-1">Name
                <input type="text" name="name" class="uk-width-1-1 uk-input" required></label>

            <div id="map2" class="uk-align-center" style="width:92%;height:300px;"></div>

            <div class="uk-modal-footer uk-width-1-1">
                <button class="uk-button-large uk-button-default uk-modal-close uk-float-left" type="button">
                    Cancel
                </button>
                <button class="uk-button-primary uk-button-large uk-float-right" type="submit">Create</button>
            </div>
        </form>
    </div>
</div>

<c:forEach items="${safeZones}" var="location">
    <!-- Edit Safe Zone -->
    <div id="editModal${location.locationID}" uk-modal>
        <div class="uk-modal-dialog uk-modal-body">
            <h2 class="uk-modal-title">Edit Safe Zone</h2>
            <form method="post" action="/editSafeZone" class="uk-grid-small" uk-grid>
                <input type="hidden" name="locationID" value="${location.locationID}">

                <label class="uk-form-label uk-width-1-1">Name
                    <input type="text" name="newName" value="${location.name}" class="uk-width-1-1 uk-input"
                           required></label>

                <label class="uk-form-label uk-width-1-2">Latitude
                    <input type="number" step="0.0001" name="newLat" value="${location.latitude}"
                           class="uk-input" required></label>

                <label class="uk-form-label uk-width-1-2">Longitude
                    <input type="number" step="0.0001" name="newLng" value="${location.latitude}"
                           class="uk-input" required></label>

                <div class="uk-modal-footer uk-width-1-1">
                    <button class="uk-button-large uk-button-default uk-modal-close uk-float-left" type="button">
                        Cancel
                    </button>
                    <button class="uk-button-primary uk-button-large uk-float-right" type="submit">Edit</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Delete Safe Zone -->
    <div id="deleteModal${location.locationID}" uk-modal>
        <div class="uk-modal-dialog uk-modal-body">
            <h2 class="uk-modal-title">Delete Safe Zone</h2>
            <br>
            <h4 class="uk-text-center">Are you sure you want to delete <b>${location.name}</b> as a safe zone?</h4>
            <br>
            <form method="post" action="/deleteSafeZone" class="uk-grid-small" uk-grid>
                <input type="hidden" name="locationID" value="${location.locationID}">
                <div class="uk-modal-footer uk-width-1-1">
                    <button class="uk-button-large uk-button-default uk-modal-close uk-float-left" type="button">
                        Cancel
                    </button>
                    <button class="uk-button-primary uk-button-large uk-float-right" type="submit">Delete</button>
                </div>
            </form>
        </div>
    </div>
</c:forEach>

<script>
    var map;
    var mapMarkers;
    var createMarker;
    var map2;

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: ${lat}, lng: ${lng}},
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.HYBRID
        });

        map2 = new google.maps.Map(document.getElementById('map2'), {
            center: {lat: ${lat}, lng: ${lng}},
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.HYBRID
        });
    }

    function createNewMarker() {

        if (createMarker != null) {
            createMarker.setMap(null);
        }

        createMarker = new google.maps.Marker({
            position: {lat: ${lat}, lng: ${lng}},
            map: map2,
            animation: google.maps.Animation.DROP,
            draggable: true,
            title: 'Safe Zone'
        });

        google.maps.event.addListener(createMarker, 'dragend', function (evt) {
            document.getElementById("position").value = createMarker.position;
        });

    }

    function addMapMarkers(count) {

        mapMarkers = new Array();

        for (var i = 0; i < count; i++) {
            setTimeout(function () {
                var marker = new google.maps.Marker({
                    position: {lat: ${locations.get(i).latitude}, lng: ${locations.get(i).longitude}},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    draggable: false,
                    title: name
                });
                mapMarkers.push(marker);
            }, 500);
        }
    }

</script>

<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAYv7pVPxQ-k7yWlKPfa8ebsx7ci9q7vQ8&callback=initMap"
        type="text/javascript"></script>


</body>
</html>