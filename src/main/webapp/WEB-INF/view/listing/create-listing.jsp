<%@include file="../jspf/header.jsp" %>

<body class="uk-background-muted">

<%@include file="../jspf/navbar.jspf" %>

<%@include file="../jspf/messages.jsp" %>

<div class="uk-container">

    <div class="uk-margin-medium-top" uk-grid>

        <div class="uk-width-3-4@m uk-width-1-1@s uk-align-center">
            <div class="uk-card uk-card-default uk-card-large uk-card-body uk-box-shadow-hover-large uk-border-rounded">
                <span>
                    <a href="${pageContext.request.contextPath}/viewListingDrafts" class="uk-icon-button uk-float-right"
                       uk-icon="file-edit"
                       uk-tooltip="View Listing Drafts"></a>
                <h2 class="uk-text-center uk-text-bold">Create Listing</h2>
                </span>
                <hr>
                <div class="form-area">
                    <c:choose>
                    <c:when test="${isDraft == true}">
                    <form method="POST" class="" uk-grid
                          onsubmit="return validateForm()" action="uploadListingDraft"
                          enctype="multipart/form-data" name="uploadListingForm" uk-grid>
                        <input type="hidden" name="id" value=${listing.id}>
                        </c:when>
                        <c:otherwise>
                        <form method="POST" class="" uk-grid
                              onsubmit="return validateForm()" action="uploadListing"
                              enctype="multipart/form-data" name="uploadListingForm" uk-grid>
                            </c:otherwise>
                            </c:choose>
                            <br style="clear: both">


                            <div class="uk-width-2-3@m uk-width-1-2@s">
                                <strong>Title of Product</strong> <input type="text"
                                                                         class="uk-input" id="titleId" name="title"
                                                                         value="${listing.name}"
                                                                         placeholder="Title">
                                <span class="val_error" id="title_error"></span>
                            </div>

                            <div class="uk-width-1-3@m uk-width-1-2@s" uk-form-custom>
                                <br>
                                <input id="image" type="file" name="file" multiple/>
                                <span class="val_error" id="image_error"></span>
                                <button class="uk-button uk-button-default uk-width-1-1" type="button"
                                        tabindex="-1">Upload
                                    Images
                                </button>
                                <span><c:forEach items="${listing.images}" var="image">
                                    ${image.image_name}
                                </c:forEach></span>
                            </div>

                            <div class="uk-width-1-2">
                                <strong>Category</strong><select id="category" name="category"
                                                                 class="uk-select" onchange="changeCategory(this);"
                                                                 required>
                                <c:choose>
                                    <c:when test="${isDraft == true}">
                                        <c:forEach var="category" items="${categories}">
                                            <c:choose>
                                                <c:when test="${listing.category == category.category}">
                                                    <option value="${category.category}"
                                                            selected>${category.category}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${category.category}">${category.category}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="" disabled selected>Select Category</option>
                                        <c:forEach var="category" items="${categories}">
                                            <option value="${category.category}">${category.category}</option>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>

                            </select>
                            </div>

                            <div class="uk-width-1-2">
                                <strong>Sub-Category</strong>
                                <c:choose>
                                <c:when test="${isDraft == true}">
                                <select id="subCategorySelect"
                                        name="subCategory" class="uk-select">
                                    <c:forEach var="subCategory" items="${subCategories}">
                                    <c:choose>
                                    <c:when test="${listing.subCategory == subCategory.subCategory}">
                                    <option value="${subCategory.subCategory}"
                                            selected>${subCategory.subCategory}</option>
                                    </c:when>
                                    <c:otherwise>
                                    <option value="${subCategory.subCategory}">${subCategory.subCategory}</option>
                                    </c:otherwise>
                                    </c:choose>
                                    </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                    <select id="subCategorySelect"
                                            name="subCategory" class="uk-select" disabled>
                                        <option value="" disabled selected>Select Category</option>
                                        <c:forEach var="subCategory" items="${subCategories}">
                                            <option value="${subCategory.subCategory}">${subCategory.subCategory}</option>
                                        </c:forEach>
                                        </c:otherwise>
                                        </c:choose>
                                    </select>
                            </div>

                            <div class="uk-width-1-2@m uk-width-1-1@s">
                                <strong>Type</strong>
                                <select id="type" name="type"
                                        class="uk-select" onchange="typeChange(this);" required>
                                    <c:choose>
                                        <c:when test="${isDraft == true}">
                                            <c:choose>
                                                <c:when test="${listing.type == 'fixed'}">
                                                    <option value="${listing.type}" selected>Fixed Price</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${listing.type}">Fixed Price</option>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${listing.type == 'auction'}">
                                                    <option value="${listing.type}" selected>Auction</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${listing.type}">Auction</option>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${listing.type == 'donation'}">
                                                    <option value="${listing.type}" selected>Donation</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${listing.type}">Donation</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="" disabled selected>Select Listing Type</option>
                                            <option value="auction">Auction</option>
                                            <option value="donation">Donation</option>
                                            <option value="fixed">Fixed Price</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>

                            <div class="uk-width-1-2@m uk-width-1-1@s" id="value">
                                <strong>Price</strong><input type="number" class="uk-input"
                                                             id="price" name="price" value="${listing.price}"
                                                             placeholder="
                                                         Price"> <span
                                    class="val_error" id="price_error"></span>
                            </div>

                            <div class="uk-width-1-1" id="paymentTypeDiv">
                                <strong>Payment Type</strong>
                                <select id="paymentType" name="paymentType"
                                        class="uk-select" required>
                                    <c:choose>
                                        <c:when test="${isDraft == true}">
                                            <c:choose>
                                                <c:when test="${listing.paymentType == 'PAYPAL'}">
                                                    <option value="${listing.paymentType}" selected>PayPal</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${listing.paymentType}">PayPal</option>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${listing.paymentType == 'CASH'}">
                                                    <option value="${listing.paymentType}" selected>Cash</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${listing.paymentType}">Cash</option>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${listing.paymentType == 'EITHER'}">
                                                    <option value="${listing.type}" selected>Doesn't Matter (Buyer
                                                        Chooses
                                                        Cash or PayPal)
                                                    </option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${listing.type}">Doesn't Matter (Buyer Chooses
                                                        Cash or
                                                        PayPal)
                                                    </option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="" disabled selected>Select Payment Type</option>
                                            <option value="PAYPAL">PayPal</option>
                                            <option value="CASH">Cash</option>
                                            <option value="EITHER">Doesn't Matter (Buyer Chooses Cash or PayPal)
                                            </option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>

                            <div class="uk-width-1-1" id="dateEnd">
                                <strong>End Date</strong><input type="datetime-local"
                                                                class="uk-input" id="endDate"
                                                                value="${listing.endDate}" name=" endDate"
                                                                placeholder="End Date" disabled>
                            </div>

                            <div class="uk-width-1-1">
                                <strong>Description </strong>
                                <textarea class="uk-textarea" type="textarea" name="description"
                                          id="message" placeholder="Description" maxlength="140"
                                          rows="7">${listing.description}</textarea>
                                <span class="help-block"><p id="characterLeft"
                                                            class="help-block "></span>
                            </div>

                            <div class="uk-width-1-1">
                                <div class="uk-width-1-1">
                                    <c:if test="${isDraft != true}">
                                    <label><input class="uk-checkbox" style="margin-bottom: 5px" type="checkbox"
                                                  name="draft"
                                                  value="yes" onclick="draftToggle(this)"> Save as Draft
                                    </label>
                                    </c:if>

                                    <button type="submit" id="submit" name="submit"
                                            class="uk-button-large uk-button-primary uk-border-rounded uk-float-right uk-margin-right">
                                        Create Listing
                                    </button>
                        </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../jspf/footer.jspf" %>
</body>

<script type="text/javascript">
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
        if (${isDraft != true}) {
            if (extension != "jpeg" && extension != "png" && extension != "jpg") {
                document.getElementById('image_error').textContent = "* Must upload an image file.";
                document.getElementById('image_error').style.color = "red";
                document.getElementById('image').focus();
                return false;
            }
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