function dismiss(notificationID) {
    $.ajax({
        type: 'GET',
        url: '/dismiss',
        data: {n: notificationID},
    })
    document.getElementById('notification' + notificationID).style.display = "none";
}

$('#notificationDrop').on("hide", function () {
    $.ajax({
        type: 'GET',
        url: '/markAsViewed',
    })

    document.getElementById('badge1').style.visibility = "hidden";

    var spans = document.getElementsByTagName('span');

    for (var i = 0; i < spans.length; i++) {
        var spanClass = spans[i].getAttribute("class");
        if (spans[i].getAttribute("class") === "badge2") {
            spans[i].style.display = "none";
        }
    }
})


function bid(currentBid, bidValue, listingID) {
    $.ajax({
        type: 'POST',
        url: '/bid',
        data: {bidValue: bidValue, listingID: listingID},
    })
}