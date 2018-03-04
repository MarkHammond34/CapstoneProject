<%@include file="jspf/header.jsp" %>
<body style="background-color: #e5e5e5">

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div class="uk-margin-medium-top uk-margin-large-bottom">
    <div class="uk-child-width-expand@s" uk-grid>

        <div class="uk-width-2-3@m" style="height: 100%">
            <h2 class="uk-heading-bullet uk-margin-medium-left">Pick Up Details</h2>
            <div class="uk-card uk-card-default uk-margin-medium-left">
                <div class="uk-card-body" uk-grid>
                    <div class="uk-float-left uk-width-1-3 uk-margin-auto-vertical">
                        <ul class="uk-list">
                            <li class="uk-width-1-1"><span class="uk-text-large"><strong
                                    style="color: #ff695c">Location: </strong>Krasa Center</span>
                            </li>
                            <li class="uk-width-1-1 uk-margin-large-top"><span class="uk-text-large"><strong
                                    style="color: #ff695c">Date: </strong>Friday, December 6th</span>
                            </li>
                            <li class="uk-width-1-1 uk-margin-large-top"><span class="uk-text-large"><strong
                                    style="color: #ff695c">Time: </strong>12:05 PM</span>
                            </li>
                        </ul>
                    </div>
                    <div class="uk-float-right uk-width-2-3">
                        <label><input class="uk-checkbox" type="checkbox" onclick="toggleSafeZones();" checked> See Safe
                            Zones</label>
                        <div id="map" style="width:100%;height:400px;"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="uk-width-1-3@m">
            <h2 class="uk-heading-bullet uk-margin-medium-left">Messages</h2>
            <div class="uk-card uk-card-default uk-margin-medium-left uk-margin-medium-right">
                <div class="uk-card-footer">
                    <a class="uk-float-right" title="Refresh" href="" uk-icon="icon: refresh"></a>
                </div>
                <div class="uk-card-body">
                    <div class="uk-border-rounded uk-margin">
                        <div>
                            <div class="uk-float-left uk-width-3-4 uk-text-left uk-background-primary uk-border-rounded uk-padding-small"
                                 style="color: white;">Receiving
                                Messages
                            </div>
                            <p class="uk-align-left uk-margin-remove-top uk-margin-small-left"
                               style="font-size: 12px;">3/3/18 5:06pm</p>
                        </div>
                        <div>
                            <div class="uk-float-right uk-width-3-4 uk-background-muted uk-border-rounded uk-padding-small"
                                 style="border-style: solid; border-width: 2px; border-color: darkgray">
                                Sending Messages
                            </div>
                            <p class="uk-align-right uk-margin-remove-top uk-margin-small-right"
                               style="font-size: 12px;">3/3/18 5:06pm</p>
                        </div>
                    </div>
                </div>
                <div class="uk-card-footer uk-grid-small" uk-grid>
                    <input class="uk-input uk-background-muted uk-border-rounded uk-width-4-5" type="text"
                           name="newMessage" placeholder="Send A Message">
                    <a class="uk-width-1-5" title="Send" href=""
                       uk-icon="icon: chevron-right; ratio: 2"></a>
                </div>
            </div>
        </div>

        <div class="uk-width-1-1">
            <button title="Accept" uk-toggle="target: #acceptModal"
                    class="uk-button-primary uk-button-large uk-border-rounded uk-float-right uk-margin-medium-left">
                Accept
                Meeting
            </button>
            <button title="Decline" uk-toggle="target: #declineModal"
                    class="uk-button-danger uk-button-large uk-border-rounded uk-float-right">Decline
                Meeting
            </button>
        </div>
    </div>
</div>

<div id="acceptModal" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
        <h2 class="uk-modal-title">Accept Meeting</h2>
        <div class="uk-modal-body"></div>
        <div class="uk-modal-footer">
            <button class="uk-button-primary uk-float-right uk-button-large uk-border-rounded" type="button">Accept
            </button>
            <button class="uk-modal-close uk-button-default uk-float-left uk-button-large uk-border-rounded"
                    type="button">Close
            </button>
        </div>
    </div>
</div>

<div id="declineModal" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
        <h2 class="uk-modal-title">Decline Meeting</h2>
        <div class="uk-modal-body"></div>
        <div class="uk-modal-footer">
            <button class="uk-button-danger uk-float-right uk-button-large uk-border-rounded" type="button">Decline
            </button>
            <button class="uk-modal-close uk-button-default uk-float-left uk-button-large uk-border-rounded"
                    type="button">Close
            </button>
        </div>
    </div>
</div>

<%@include file="jspf/footer.jspf" %>

<script>
    var map;

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: ${latitude}, lng: ${longitude}},
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.HYBRID
        });

        var marker = new google.maps.Marker({
            position: {lat: ${meetingLat}, lng: ${meetingLong}},
            map: map,
            animation: google.maps.Animation.DROP,
            title: 'Meeting Location',
            content: '<p>Open 8am-9pm</p>'
        })
        marker.addListener('click', toggleBounce);
    }

</script>


<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAYv7pVPxQ-k7yWlKPfa8ebsx7ci9q7vQ8&callback=initMap"
        type="text/javascript"></script>

</body>
</html>