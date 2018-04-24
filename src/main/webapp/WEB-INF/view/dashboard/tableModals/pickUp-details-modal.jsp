<div id="pickUp${pickup.pickUpID}" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
        <h2 class="uk-modal-title">Pickup Details</h2>
        <form method="post" action="/bid">
            <div class="uk-child-width-1-2@s" uk-grid>
                <div>
                    <h4>Name: ${listing.name}</h4>
                    <h4>Highest Bid: $${listing.highestBid}</h4>
                    <h4>Seller: <a
                            href="/viewProfile?id=${listing.user.userID}">${listing.user.username}</a>
                    </h4>
                </div>
            </div>
            <p class="uk-text-right">
                <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel
                </button>
            </p>
        </form>
    </div>
</div>