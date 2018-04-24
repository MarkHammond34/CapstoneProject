<div id="pickUp${pickup.pickUpID}" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
        <h2 class="uk-modal-title">Pickup Details</h2>
        <form method="post" action="/bid">
            <div class="uk-child-width-1-2@s" uk-grid>
                <div>
                    <h4>Listing: <!----></h4>
                    <h4>Buyer: <!--<a href="/viewProfile?id=}</a>--></h4>
                    <h4>Seller: <!--<a
                            href="/viewProfile?id=</a>-->
                    </h4>
                    <h4>Pickup time: <!----></h4>
                    <h4>Pickup location: <!----></h4>
                </div>
            </div>
            <p class="uk-text-right">
                <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel
                </button>
            </p>
        </form>
    </div>
</div>