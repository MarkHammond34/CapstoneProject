<%@include file="jspf/header.jsp" %>
<body style="background-color: #e5e5e5">

<%@include file="jspf/navbar.jspf" %>

<%@include file="jspf/messages.jsp" %>

<div class="uk-margin-medium-top uk-margin-large-bottom">
    <div class="uk-child-width-expand@s" uk-grid>

        <div class="uk-width-2-3">
            <h2 class="uk-heading-bullet uk-margin-large-left">Listing Details</h2>
            <div class="uk-card uk-card-default uk-margin-large-left">
                <div class="uk-card-body uk-grid" uk-grid>
                    <div class="uk-width-2-3">
                        <img class="uk-width-2-5 uk-align-left"
                             src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                             alt="">
                        <p class="uk-text-large">${listing.name}</p>
                        <p class="uk-text-small uk-margin-left">${listing.description}</p>

                        <c:if test="${listing.type == 'auction'}">
                            <span class="uk-badge">Winning Bid: $${listing.highestBid}</span>
                        </c:if>
                    </div>

                    <div class="uk-width-1-3" uk-grid>
                        <div class="uk-padding-small"
                             style="border-left: solid lightgray; height: 100%; border-width: 1px;">
                            <h3 class="uk-heading uk-text-center">Seller</h3>
                            <img
                                    src="${pageContext.request.contextPath}/resources/img/profile-pic/${listing.user.image_path}"
                                    alt="" width="70%" class="uk-border-rounded uk-align-center">
                            <p class="uk-text-small uk-text-center">
                                <u style="color: #ff695c">Name:</u> ${listing.user.firstName} ${listing.user.lastName}
                            </p>
                            <p class="uk-text-small uk-text-center"><u style="color: #ff695c">School
                                Email:</u> ${listing.user.schoolEmail}</p>
                        </div>
                    </div>
                </div>
            </div>

            <h2 class="uk-heading-bullet uk-margin-large-left">Pickup Details <span uk-icon="icon: info"
                                                                                    onmouseover=""></span></h2>
            <div class="uk-card uk-card-default uk-margin-large-left">
                <div class="uk-card-body uk-grid" uk-grid>
                    <div class="uk-width-1-3">
                        <h3><u style="color: #ff695c">Date:</u> Friday, February 23rd</h3>
                        <h3><u style="color: #ff695c">Time:</u> 3pm</h3>
                        <h3><u style="color: #ff695c">Location:</u> Krasa Center</h3>
                    </div>
                    <div class="uk-width-2-3">
                        <div id="map" class="uk-float-right" style="width:90%;height:300px;"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="uk-width-1-3" style="height: 100%">
            <h2 class="uk-heading-bullet">Transaction Details</h2>
            <div class="uk-card uk-card-default uk-margin-large-right">
                <div class="uk-card-header">
                    <h4 class="uk-margin-remove-bottom uk-text-center">Cost</h4>
                </div>
                <div class="uk-card-body">
                    <table class="uk-table">
                        <tbody>
                        <tr>
                            <td class="uk-float-left">Winning Bid</td>
                            <td class="uk-float-right">$${listing.highestBid}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="uk-card-footer">
                    <table class="uk-table">
                        <tbody>
                        <tr>
                            <td class="uk-float-left">Total</td>
                            <td class="uk-float-right">
                                <span class="uk-badge"
                                      style="background-color: green; color: white;">$${listing.highestBid}</span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <br>
            <div class="uk-card uk-card-default uk-margin-large-right">
                <div class="uk-card-header">
                    <h4 class="uk-margin-remove-bottom uk-text-center">Payment Method</h4>
                </div>
                <div class="uk-card-body">
                    <table class="uk-table">
                        <tbody>
                        <tr>
                            <td class="uk-grid" uk-grid>
                                <div class="uk-width-1-2" id="paypal-button">
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
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
    }
</script>


<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAYv7pVPxQ-k7yWlKPfa8ebsx7ci9q7vQ8&callback=initMap"
        type="text/javascript"></script>

<script>
    paypal.Button
        .render(
            {
                env: 'sandbox', // Or 'production',
                client: {
                    sandbox: 'AVGW1RKTj5gyUclN5wBmPk97pGaiTCsnR4AHZZ6QHsjDgraupasf1V8YbxMbKZLiBAJ-BwtkoUmIsfdf',
                    production: 'AUTi02B9WEFnsmjxP3XY2p2IljLU5HATmVK5yynF22kD3myoQhcQ7bKx2QF8CjiQRQ8-qyDJfgLwRd1u'
                },
                commit: true, // Show a 'Pay Now' button
                style: {
                    color: 'gold',
                    size: 'small'
                },
                payment: function (data, actions) {
                    /*
                     * Set up the payment here
                     */
                    return actions.payment.create({
                        payment: {
                            transactions: [{
                                amount: {
                                    total: ${listing.highestBid},
                                    currency: 'USD'
                                }
                            }]
                        }
                    });
                },
                onAuthorize: function (data, actions) {
                    /*
                     * Execute the payment here
                     */
                    return actions.payment.execute().then(
                        function (payment) {

                            // The payment is complete!
                            // You can now show a confirmation message to the customer
                            window.alert('Payment Complete!');
                        });
                },
                onCancel: function (data, actions) {
                    /*
                     * Buyer cancelled the payment
                     */
                },
                onError: function (err) {
                    /*
                     * An error occurred during the transaction
                     */
                }
            }, '#paypal-button');
</script>
</body>
</html>