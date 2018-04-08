<!-- This is the modal -->
<div id="buyItNowModal${listing.id}" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
        <h2 class="uk-modal-title">Buy It Now</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
            ut labore et dolore
            magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
            aliquip ex ea
            commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
            dolore eu fugiat
            nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
            officia deserunt mollit
            anim id est laborum.</p>
        <p class="uk-text-right">
            <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
            <button class="uk-button uk-button-primary" type="button">Buy</button>
        </p>
    </div>
</div>

<div id="placeBidModal${listing.id}" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
        <h2 class="uk-modal-title">Place A Bid</h2>
        <form method="post" action="/bid">
            <div class="uk-child-width-1-2@s" uk-grid>
                <div>
                    <h4>Name: ${listing.name}</h4>
                    <h4>Highest Bid: $${listing.highestBid}</h4>
                    <h4>Seller: <a
                            href="/viewProfile?id=${listing.user.userID}">${listing.user.username}</a>
                    </h4>
                </div>

                <div>
                    <h4>Bid</h4>
                    <input class="uk-input" name="bidValue" type="number"
                           min="${listing.highestBid}" id="bidValue${listing.id}">
                    <input name="listingID" type="hidden" value="${listing.id}">
                </div>
            </div>
            <p class="uk-text-right">
                <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel
                </button>
                <button class="uk-button uk-button-primary" type="submit">Bid
                </button>
                <!--
                <button onclick="bid($('#bidValue${listing.id}').val(), ${listing.id});"
                        class="uk-button uk-button-primary" id="submit"
                        type="submit${listing.id}">Bid
                </button>
                -->
            </p>
        </form>
    </div>
</div>

<div id="cancelBid${listing.id}Modal" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
        <h3 style="text-align: center;">Are you sure you want to cancel your bid?</h3>
        <hr>
        <div>
            <h4>Name: ${listing.name}</h4>
            <h4>Highest Bid: ${listing.highestBid}</h4>
            <h4>Seller: <a
                    href="/viewProfile?id=${listing.user.userID}">${listing.user.username}</a>
            </h4>
        </div>
        <p class="uk-text-right">
            <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
            <a class="uk-button uk-button-primary"
               href="/cancelBid?l=${listing.id}">
                Yes
            </a>
        </p>
    </div>
</div>