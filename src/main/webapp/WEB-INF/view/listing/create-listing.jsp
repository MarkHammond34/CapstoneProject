<%@include file="../jspf/header.jsp" %>

<body class="uk-background-muted">

<%@include file="../jspf/navbar.jspf" %>

<%@include file="../jspf/footer.jspf" %>

<%@include file="../jspf/messages.jsp" %>

<div class="uk-container">

    <div class="uk-margin-medium-top" uk-grid>

        <div class="uk-width-3-4@m uk-width-1-1@s uk-align-center">
            <div class="uk-card uk-card-default uk-card-large uk-card-body uk-box-shadow-hover-large uk-border-rounded">
                <h2 class="uk-text-center">Create A Listing</h2>
                <hr>
                <div class="form-area">
                    <form method="POST" class="" uk-grid
                          onsubmit="return validateForm()" action="uploadListing"
                          enctype="multipart/form-data" name="uploadListingForm" uk-grid>
                        <br style="clear: both">


                        <div class="uk-width-2-3@m uk-width-1-2@s">
                            <strong>Title of Product</strong> <input type="text"
                                                                     class="uk-input" id="titleId" name="title"
                                                                     placeholder="Title">
                            <span class="val_error" id="title_error"></span>
                        </div>

                        <div class="uk-width-1-3@m uk-width-1-2@s" uk-form-custom>
                            <br>
                            <input id="image" type="file" name="file" multiple/>
                            <span class="val_error" id="image_error"></span>
                            <button class="uk-button uk-button-default uk-width-1-1" type="button" tabindex="-1">Upload
                                Images
                            </button>
                        </div>

                        <div class="uk-width-1-2">
                            <strong>Category</strong><select id="category" name="category"
                                                             class="uk-select" onchange="changeCategory(this);"
                                                             required>
                            <option value="" disabled selected>Select Category</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.category}">${category.category}</option>
                            </c:forEach>
                        </select>
                        </div>

                        <div class="uk-width-1-2">
                            <strong>Sub-Category</strong>

                            <select id="subCategorySelect"
                                    name="subCategory" class="uk-select" disabled>
                                <option value="" disabled selected>Select Sub-Category</option>

                                <c:forEach items="${subCategories}" var="subCat">
                                    <option class="sub-category ${subCat.category.category}"
                                            value="${subCat.subCategory}"
                                            style="display: none">${subCat.subCategory}</option>
                                </c:forEach>

                            </select>
                        </div>

                        <div class="uk-width-1-2@m uk-width-1-1@s">
                            <strong>Type</strong>
                            <select id="type" name="type"
                                    class="uk-select" onchange="typeChange(this);" required>
                                <option value="" disabled selected>Select Listing Type</option>
                                <option value="auction">Auction</option>
                                <option value="donation">Donation</option>
                                <option value="fixed">Fixed Price</option>
                            </select>
                        </div>

                        <div class="uk-width-1-2@m uk-width-1-1@s" id="value">
                            <strong>Price</strong><input type="number" class="uk-input"
                                                         id="price" name="price" placeholder="Price" disabled> <span
                                class="val_error" id="price_error"></span>
                        </div>

                        <div class="uk-width-1-1" id="paymentTypeDiv">
                            <strong>Payment Type</strong>
                            <select id="paymentType" name="paymentType"
                                    class="uk-select" required>
                                <option value="" disabled selected>Select Payment Type</option>
                                <option value="CASH">Cash</option>
                                <option value="PAYPAL">PayPal</option>
                                <option value="EITHER">Doesn't Matter (Buyer Chooses Cash or PayPal)</option>
                            </select>
                        </div>

                        <div class="uk-width-1-1" id="dateEnd">
                            <strong>End Date</strong><input type="datetime-local"
                                                            class="uk-input" id="endDate" name="endDate"
                                                            placeholder="End Date" disabled>
                        </div>

                        <div class="uk-width-1-1">
                            <strong>Description </strong>
                            <textarea class="uk-textarea" type="textarea" name="description"
                                      id="message" placeholder="Description" maxlength="140" rows="7"></textarea>
                            <span class="help-block"><p id="characterLeft"
                                                        class="help-block "></span>
                        </div>

                        <div class="uk-width-1-1">
                            <input type="hidden" name="premium" value="no">
                            <label><input class="uk-checkbox" style="margin-bottom: 5px" type="checkbox" name="premium"
                                          value="yes"> Premium Listing
                            </label>
                            <a uk-icon="icon: question"></a>
                            <div uk-drop="pos: right-center">
                                <div class="uk-tile uk-tile-default uk-box-shadow-medium">Lorem ipsum dolor
                                    sit
                                    amet,
                                    consectetur adipiscing elit, sed do eiusmod tempor incididunt.
                                </div>
                            </div>
                            <button type="submit" id="submit" name="submit"
                                    class="uk-button-large uk-button-primary uk-border-rounded uk-float-right">
                                Create
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script type="text/javascript">
    function validateForm() {
        var title_error = document.getElementById("title_error");
        var title = document.getElementById("titleId").value;

        var file = document.forms["uploadListingForm"]["file"].value;
        var fileArray = file.split(".");
        var extension = fileArray[1];

        var priceString = document.forms["uploadListingForm"]["price"].value;
        var price = parseInt(priceString);

        // Name checking
        if (title == "" || title == null) {
            console.log(title);
            document.getElementById("titleId").style.borderColor = "red";
            document.getElementById('title_error').textContent = "* Field Cannot Be empty";
            document.getElementById('title_error').style.color = "red";
            document.getElementById('titleId').focus();
            return false;
        } else {
            document.getElementById("titleId").style.borderColor = "black";
            document.getElementById('title_error').textContent = "";
        }
        // Image Checking
        if (extension != "jpeg" && extension != "png" && extension != "jpg") {
            document.getElementById('image_error').textContent = "* Must upload an image file.";
            document.getElementById('image_error').style.color = "red";
            document.getElementById('image').focus();
            return false;
        } else if (file == "" || file == null) {
            document.getElementById('image_error').textContent = "* Field Cannot Be Empty.";
            document.getElementById('image_error').style.color = "red";
            document.getElementById('image').focus();
        } else {
            document.getElementById('image_error').textContent = "";

            // Price Checking
        }
        if (price < 0) {
            document.getElementById("price").style.borderColor = "red";
            document.getElementById('price_error').textContent = "*Price cannot be negative.";
            document.getElementById('price_error').style.color = "red";
            document.getElementById('price').focus();
            return false;
        } else {
            document.getElementById("price").style.borderColor = "black";
            document.getElementById('price_error').textContent = "";
        }

        window.alert("Good shit");

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

    function typeChange(type) {
        if (type.value == "auction") {
            document.getElementById("endDate").disabled = false;
            document.getElementById("price").disabled = true;
        } else if (type.value == "fixed") {
            document.getElementById("endDate").disabled = true;
            document.getElementById("price").disabled = false;
        } else if (type.value == "donation") {
            document.getElementById("endDate").disabled = true;
            document.getElementById("price").disabled = true;
        }
    }
</script>
</html>