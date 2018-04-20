<div id="offer${offer.offerID}" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default" type="button" uk-close></button>

        <div class="uk-grid" uk-grid>

            <div class="uk-modal-header">
                <h2 class="uk-modal-title">Offer details</h2>
            </div>

            <div class="uk-modal-body">
                <div class="uk-width-1-1">
                    <strong>Amount offered:</strong>
                    <p>${offer.offerAmount}</p>
                </div>
                <div class="uk-width-1-1">
                    <strong> Offer Message:</strong>
                    <p>${offer.offerMessage}</p>

                    <input type="hidden" name="initial" value="${initial.offerID}">
                </div>

                <div class="uk-modal-footer">
                    <div class="uk-text-right">
                        <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                        <button type="submit" id="submit" name="submit"
                                class="btn btn-primary pull-right">Submit Form
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
