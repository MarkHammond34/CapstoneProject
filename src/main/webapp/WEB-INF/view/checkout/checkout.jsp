<%@include file="../jspf/header.jsp" %>
<body style="background-color: #e5e5e5">

<%@include file="../jspf/navbar.jspf" %>

<%@include file="../jspf/messages.jsp" %>

<div class="uk-container">
    <div class="uk-grid-large" uk-grid>

        <!-- Left side -->
        <div class="uk-width-2-3@m uk-width-1-1@s">

            <!-- Listing Details -->
            <h2 class="uk-heading-bullet">Listing Details</h2>
            <div class="uk-card uk-card-default">
                <div class="uk-card-body uk-grid" uk-grid>
                    <div class="uk-width-1-1@m">

                        <img class="uk-width-2-5@m uk-width-1-1@s uk-float-right"
                             src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
                             alt="">

                        <div class="uk-width-3-5@m uk-width-1-1@s uk-float-left uk-padding-small">
                            <h2>${listing.name}</h2>
                            <h3 class="uk-margin-remove-top">${listing.description}</h3>
                            <c:choose>
                                <c:when test="${listing.type == 'auction'}">
                                    <span class="uk-badge uk-padding-small">Winning Bid: $${listing.highestBid}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="uk-badge uk-padding-small">Price: $${listing.price}</span>
                                </c:otherwise>
                            </c:choose>

                            <hr class="uk-margin-top">

                            <c:choose>
                                <c:when test="${pickUp.transaction.buyer.userID == sessionScope.user.userID}">
                                    <b class="uk-text-large">Seller</b>
                                    <br>
                                    <span class="uk-text-large"><strong style="color: #ff695c">
                                            Name: </strong>${listing.user.firstName} ${listing.user.lastName}
                                        </span>
                                    <br>
                                    <span class="uk-text-large"><strong style="color: #ff695c">
                                            Email: </strong>${listing.user.schoolEmail}
                                        </span>
                                    <br>
                                    <span class="uk-text-large"><strong style="color: #ff695c">
                                            Phone: </strong>${listing.user.phoneNumber}
                                        </span>
                                </c:when>
                                <c:otherwise>
                                    <b class="uk-text-large">Buyer</b>
                                    <br>
                                    <span class="uk-text-large"><strong style="color: #ff695c">
                                            Name: </strong>${listing.highestBidder.firstName} ${listing.highestBidder.lastName}
                                        </span>
                                    <br>
                                    <span class="uk-text-large"><strong style="color: #ff695c">
                                            Email: </strong>${listing.highestBidder.schoolEmail}
                                        </span>
                                    <br>
                                    <span class="uk-text-large"><strong style="color: #ff695c">
                                            Phone: </strong>${listing.highestBidder.phoneNumber}
                                        </span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pick Up Details -->
            <h2 class="uk-heading-bullet">Pickup Details</h2>
            <div class="uk-card uk-card-default">
                <div class="uk-card-body uk-grid" uk-grid>
                    <div class="uk-width-1-1">
                        <span class="uk-text-center">
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
                        </span>

                        <div id="map" class="uk-align-center" style="width:95%;height:300px;"></div>

                    </div>
                </div>
            </div>
            <br>
        </div>

        <!-- Right side -->
        <div class="uk-width-1-3@m uk-width-1-1@s">
            <h2 class="uk-heading-bullet">Transaction Details</h2>
            <div class="uk-card uk-card-default">
                <c:choose>
                    <c:when test="${sessionScope.user.userID == pickUp.transaction.buyer.userID}">
                        <div class="uk-card-header">
                            <h4 class="uk-margin-remove-bottom uk-text-center">Cost</h4>
                        </div>
                        <!-- Buyer Transaction Details -->
                        <div class="uk-card-body">
                            <table class="uk-table">
                                <tbody>
                                <c:choose>
                                    <c:when test="${listing.type == 'auction'}">
                                        <tr>
                                            <td class="uk-float-left">Winning Bid</td>
                                            <td class="uk-float-right">$${listing.highestBid}</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="uk-float-left">Price</td>
                                            <td class="uk-float-right">$${listing.price}</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                        <div class="uk-card-footer">
                            <table class="uk-table">
                                <tbody>
                                <c:choose>
                                    <c:when test="${listing.type == 'auction'}">
                                        <tr>
                                            <td class="uk-float-left">Total</td>
                                            <td class="uk-float-right">
                                                <span class="uk-badge"
                                                      style="background-color: red; color: white;">$${listing.highestBid}</span>
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="uk-float-left">Total</td>
                                            <td class="uk-float-right">$${listing.price}</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="uk-card-header">
                            <h4 class="uk-margin-remove-bottom uk-text-center">Earnings</h4>
                        </div>
                        <div class="uk-card-body">
                            <table class="uk-table">
                                <tbody>
                                <c:choose>
                                    <c:when test="${listing.type == 'auction'}">
                                        <tr>
                                            <td class="uk-float-left">Winning Bid</td>
                                            <td class="uk-float-right">+$${listing.highestBid}</td>
                                        </tr>
                                        <c:if test="${listing.premium == 1}">
                                            <tr>
                                                <td class="uk-float-left">Premium</td>
                                                <td class="uk-float-right">-$${listing.highestBid * 0.05}</td>
                                            </tr>
                                        </c:if>
                                        <tr>
                                            <td class="uk-float-left">Listing Cost</td>
                                            <td class="uk-float-right">-$${listing.highestBid * 0.05}</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="uk-float-left">Price</td>
                                            <td class="uk-float-right">+$${listing.price}</td>
                                        </tr>
                                        <c:if test="${listing.premium == 1}">
                                            <tr>
                                                <td class="uk-float-left">Premium</td>
                                                <td class="uk-float-right">-$${listing.highestBid * 0.05}</td>
                                            </tr>
                                        </c:if>
                                        <tr>
                                            <td class="uk-float-left">Listing Cost</td>
                                            <td class="uk-float-right">-$${listing.highestBid * 0.05}</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                        <div class="uk-card-footer">
                            <table class="uk-table">
                                <tbody>
                                <c:choose>
                                    <c:when test="${listing.type == 'auction'}">
                                        <tr>
                                            <td class="uk-float-left">Total</td>
                                            <c:choose>
                                                <c:when test="${listing.premium == 1}">
                                                    <td class="uk-float-right">
                                                <span class="uk-badge"
                                                      style="background-color: green; color: white;">+$${listing.highestBid - (listing.highestBid * 0.05) - (listing.highestBid * 0.05)}</span>
                                                    </td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td class="uk-float-right">
                                                <span class="uk-badge"
                                                      style="background-color: green; color: white;">+$${listing.highestBid - (listing.highestBid * 0.05)}</span>
                                                    </td>
                                                </c:otherwise>
                                            </c:choose>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="uk-float-left">Total</td>
                                            <c:choose>
                                                <c:when test="${listing.premium == 1}">
                                                    <td class="uk-float-right">
                                                <span class="uk-badge"
                                                      style="background-color: green; color: white;">+$${listing.price - (listing.price * 0.05) - (listing.price * 0.05)}</span>
                                                    </td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td class="uk-float-right">
                                                <span class="uk-badge"
                                                      style="background-color: green; color: white;">+$${listing.price - (listing.price * 0.05)}</span>
                                                    </td>
                                                </c:otherwise>
                                            </c:choose>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>

            <!--
            <br>
            <div class="uk-card uk-card-default">
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
            -->

            <button class="uk-button-large uk-border-rounded uk-button-primary uk-float-right uk-margin-large-top uk-box-shadow-hover-large">
                Finish
            </button>
        </div>
    </div>
</div>


<script>
    var map;
    var marker;

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: ${pickUp.location.latitude}, lng: ${pickUp.location.longitude}},
            zoom: 18,
            mapTypeId: google.maps.MapTypeId.HYBRID
        });

        marker = new google.maps.Marker({
            position: {lat: ${pickUp.location.latitude}, lng: ${pickUp.location.longitude}},
            map: map,
            animation: google.maps.Animation.DROP,
            title: 'Meeting Location'
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