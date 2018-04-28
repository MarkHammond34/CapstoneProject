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
                        <p id="offeramount"></p>
                    </div>
                    <div class="uk-width-1-1">
                        <strong> Offer Message:</strong>
                        <p id="offermessage"></p>
                    </div>
                    <div uk-grid>
                        <div class="uk-width-1-3 uk-margin-large-bottom uk-margin-small-top uk-padding-remove uk-align-center">
                            <button id="*" class="uk-button-primary uk-border-rounded uk-button-large"
                                    value="${listing.id}">Accept offer
                            </button>
                        </div>
                        <div class="uk-width-1-3 uk-margin-large-bottom uk-margin-small-top uk-padding-remove uk-align-center">
                            <button id="offerButton" class="uk-button-primary uk-border-rounded uk-button-large"
                                    value="${listing.id}">Reject offer
                            </button>
                        </div>
                    </div>
                    <div class="uk-modal-footer">
                        <div class="uk-text-right">
                            <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    // Fills the modal with data
    function modalClick(offerdata) {

        $.ajax({
            url: '/offerDetails',
            type: 'GET',
            data: {offerId: offerdata},
            dataType: 'json',
            contentType: 'application/json',
            success: function (result) {

                // Add data to modal
                UIkit.modal('#offer${offer.offerID}').show();

                document.getElementById("offeramount").innerText = result['offer-amount'];
                document.getElementById("offermessage").innerText = result['offer-message'];
                console.log(result['offer-amount']);
                console.log(result);

            }

        });

    }

    // Checks for valid input
    $(document).ready(function () {
        $('#price').keyup(function () {
            console.log($(this).val());
            if ($(this).val() > 0) {
                $("#offerButton").prop("disabled", false);
                $("#price").removeClass("uk-form-danger").addClass("uk-form-success")
                $('#price').attr('uk-tooltip', 'Offer amount is valid');
            }
            else {
                $("#offerButton").prop("disabled", true);
                $("#price").removeClass("uk-form-success").addClass("uk-form-danger")
                $('#price').attr('uk-tooltip', 'Offer amount is invalid');
            }
        });
    });

    // Calls button method within modal
    $("#offerButton").click(function (e) {
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

