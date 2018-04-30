<div id="offer${offer.offerID}" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default" type="button" uk-close></button>

        <div class="uk-container uk-container-large uk-flex-middle">
            <div class="uk-grid" uk-grid>

                <div class="uk-modal-header">
                    <h2 class="uk-modal-title">Offer details</h2>
                </div>

                <div class="uk-modal-body">
                    <div class="uk-width-1-1">
                        <strong>Amount offered:</strong>
                        <p id="amount"></p>
                    </div>
                    <div class="uk-width-1-1">
                        <strong> Offer Message:</strong>
                        <p id="message"></p>
                    </div>
                    <div class="uk-modal-footer">
                        <div class="uk-text-right">
                            <button class="uk-button uk-button-secondary uk-border-rounded uk-modal-close"
                                    type="button">Cancel
                            </button>
                        </div>
                        <div class="uk-text-right">
                            <button id="rejectButton" class="uk-button uk-border-rounded" style="background-color: red"
                                    value="${listing.id}">Reject offer
                            </button>
                        </div>
                        <div class="uk-text-right">
                            <button id="acceptButton" class="uk-button uk-border-rounded"
                                    style="background-color: green"
                                    value="${listing.id}">Accept offer
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    // $(document).ready(function() {
    //
    // });

    document.getElementById("offer${offer.offerID}").addEventListener("load", offerClick(${offer.offerID}));

    // Fills the modal with data
    function offerClick(offerdata) {

        $.ajax({
            url: '/offerDetails',
            type: 'GET',
            data: {offerId: offerdata},
            dataType: 'json',
            contentType: 'application/json',
            success: function (result) {

                var offer = result;
                var amount = window.document.getElementById('amount');
                var message = window.document.getElementById('message');

                console.log(document.getElementById('amount').innerText);

                amount.innerHTML = offer['offerAmount'];
                message.textContent = offer.offerMessage;
                console.log(offer.offerAmount);
                console.log(offer);

                console.log(document.getElementById('amount').innerText);

            }

        });
    }

    // Calls button method within modal
    $("#acceptButton").click(function (e) {
        console.log($(this).val());
        $.ajax({
            url: 'makeOfferAjax',
            type: 'POST',
            data: {listing: $(this).val(), offerAmount: $("#price").val(), offerMessage: $("#message").val()},
            success: function (result) {
                console.log(result);
                if (result) {
                    UIkit.modal("#make-offer${listing.id}").hide();
                    UIkit.notification({message: 'Your offer has been sent!', status: 'success'})
                }
                else {
                    UIkit.notification({
                        message: 'An error occurred while sending your offer. Please contact an admin.',
                        status: 'danger'
                    })
                }
            }

            // Add data to modal

        });
    });

    // Calls button method within modal
    $("#rejectButton").click(function (e) {
        console.log($(this).val());
        $.ajax({
            url: 'makeOfferAjax',
            type: 'POST',
            data: {listing: $(this).val(), offerAmount: $("#price").val(), offerMessage: $("#message").val()},
            success: function (result) {
                console.log(result);
                if (result) {
                    UIkit.modal("#make-offer${listing.id}").hide();
                    UIkit.notification({message: 'Your offer has been sent!', status: 'success'})
                }
                else {
                    UIkit.notification({
                        message: 'An error occurred while sending your offer. Please contact an admin.',
                        status: 'danger'
                    })
                }
            }

            // Add data to modal

        });
    });
</script>

