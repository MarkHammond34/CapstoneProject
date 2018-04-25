function removeImage(isDraft, imageID, listingID) {

    // If draft remove from existing listing
    if (isDraft) {
        $.ajax({
            type: 'GET',
            url: '/removeImage',
            data: {listingID: listingID, imageID: imageID},
            success: function (result) {
                // Remove Badge
                document.getElementById("image" + imageID).style.display = "none";
            },
            error: function (result) {
                alert("Error Removing Image: " + result);
            },
        });

    } else {
        // Remove Badge
        document.getElementById("image" + imageID).style.display = "none";

        // Remove From Array
        var index = uploadedFileNames.indexOf(document.getElementById("image" + imageID).innerText);
        uploadedFileNames.splice(index, 1);

        // Add To Ignore List
        document.getElementById("filesToIgnore").value += document.getElementById("image" + imageID).innerText;

    }

}

var uploadedFileNames = new Array();
var fileCount = 0;

function updateFile() {

    var files = document.getElementById('image').files;

    for (var i = 0; i < files.length; i++) {
        // If new file
        if (!uploadedFileNames.includes(files[i].name)) {
            // Add file name to array
            uploadedFileNames.push(files[i].name);
            // Add badge
            var span = '<span class="uk-badge uk-padding-small" style="background-color: lightslategray; margin: 5px;" id="image' + fileCount + '">' + files[i].name;
            span += ' <a class="uk-margin-small-left" uk-icon="icon: close; ratio: 0.75" onclick="removeImage(false, ' + fileCount + ', -1)"></a></span>';

            $('#imageBadges').prepend(span);

            fileCount++;
        }
    }
}

function typeChange(type) {
    if (type.value == "auction") {
        document.getElementById("endDate").disabled = false;
        document.getElementById("endTime").disabled = false;
        document.getElementById("price").disabled = true;
    } else if (type.value == "fixed") {
        document.getElementById("endDate").disabled = true;
        document.getElementById("endTime").disabled = true;
        document.getElementById("price").disabled = false;
    } else if (type.value == "donation") {
        document.getElementById("endDate").disabled = true;
        document.getElementById("endTime").disabled = true;
        document.getElementById("price").disabled = true;
    }
}

function changeCategory(option) {

    var allSubCategories = document.getElementsByClassName("sub-category");

    for (var i = 0; i < allSubCategories.length; i++) {
        if (allSubCategories[i].classList.contains(option.value)) {
            allSubCategories[i].style.display = "inline";
        } else {
            allSubCategories[i].style.display = "none";
        }
    }

    document.getElementById("subCategorySelect").removeAttribute("disabled");
}

function draftToggle(checkbox) {
    if (checkbox.checked) {
        document.getElementById("submit").classList.remove("uk-button-primary");
        document.getElementById("submit").classList.add("uk-button-secondary");
        document.getElementById("submit").innerText = "Save Draft";
    } else {
        document.getElementById("submit").classList.remove("uk-button-secondary");
        document.getElementById("submit").classList.add("uk-button-primary");
        document.getElementById("submit").innerText = "Create Listing";
    }
}
