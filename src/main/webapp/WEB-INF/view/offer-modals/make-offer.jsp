<div id="make-offer${listing.id}" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default" type="button" uk-close></button>

        <div class="uk-container">
            <div class="uk-grid uk-margin-medium-bottom uk-align-center" uk-grid>

                <form role="form" data-toggle="validator" method="POST" class="uk-form uk-grid"
                      action="/makeOfferAjax" name="uploadListingForm" uk-grid>

                    <h2>Make an offer</h2>

                    <div class="uk-width-1-1 uk-align-center">

                        <div class="uk-width-1-1 uk-align-center">
                            <strong>Offer amount</strong><input type="number" min="1" class="uk-input"
                                                                id="price" name="offer-amount" placeholder="$Offer"
                                                                required>
                        </div>
                        <div class="uk-width-1-1 uk-align-center">
                            <strong> Offer Message (Optional): </strong>
                            <textarea class="uk-textarea" type="textarea" name="offer-message"
                                      id="message" placeholder="" maxlength="140" rows="7"></textarea>
                            <span class="help-block"><p id="characterLeft"
                                                        class="help-block "></span>
                            <input type="hidden" name="listing" value="${listing.id}">
                        </div>

                    </div>

                    <div class="uk-width-1-1 uk-margin-large-bottom uk-margin-small-top uk-padding-remove uk-align-center">
                        <button id="offerButton" type="submit" value="confirmOffer" name="submit"
                                class="uk-button-primary uk-border-rounded uk-button-large"
                                onclick="modalClick(${listing.id})">Confirm offer
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>

    $(document).load(function () {
        $('#price').keyup(function () {
            if ($(this).value > 0) {
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

    function modalClick(offerdata) {

        $.ajax({
            url: '/makeOfferAjax',
            type: 'POST',
            data: {listingId: offerdata},
            dataType: 'json',
            contentType: 'application/json',
            success: function (result) {


            }

            // Add data to modal

        });

    }
</script>