function cancelBid(listingID) {
    alert("Works");
    $.ajax({
        type: "GET",
        url: "/cancelBid",
        data: {
            l: listingID
        },
    });

    $('#cancelBidModal + listingID').modal('hide');
}

function displayErrorMessage(message) {

}
