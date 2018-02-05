<%@include file="jspf/header.jsp" %>

<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="jspf/navbar.jspf" %>


<%@include file="jspf/messages.jsp" %>

<div class="container">
    <div class="col-md-3"></div>
    <div class="col-md-6">
        <div class="form-area">
            <form method="POST" class="uk-grid-large" action="uploadListing"
                  enctype="multipart/form-data" uk-grid>
                <br style="clear: both">
                <h3 style="margin-bottom: 25px; text-align: center;">Create A
                    Listing</h3>

                <div class="uk-width-1-1">
                    <strong>Title of Product</strong> <input type="text"
                                                             class="uk-input" id="title" name="title"
                                                             placeholder="Title"
                                                             required>
                </div>
                <div class="uk-width-1-1">
                    <strong>File to upload:</strong> <input type="file" name="file">
                </div>
                <div class="uk-width-1-1">
                    <strong>Category</strong><select id="category" name="category"
                                                     class="uk-select" required>
                    <option value="" disabled selected>Select Category</option>
                    <option value="apparel">Apparel</option>
                    <option value="books">Books</option>
                    <option value="furnature">Furnature</option>
                    <option value="supplies">School Supplies</option>
                    <option value="technology">Technology</option>
                </select>
                </div>
                <div class="uk-width-1-1">
                    <strong>Type</strong><select id="type" name="type"
                                                 class="uk-select" required>
                    <option value="" disabled selected>Select Listing Type</option>
                    <option value="auction">Auction</option>
                    <option value="fixed">Fixed Price</option>
                </select>
                </div>
                <div class="uk-width-1-1">
                    <strong>End Date</strong><input type="datetime-local" class="uk-input"
                                                    id="endDate" name="endDate" placeholder="End Date" required>
                </div>
                <div class="uk-width-1-1">
                    <strong>Price</strong><input type="number" class="uk-input"
                                                 id="price" name="price" placeholder="Price" required>
                </div>
                <div class="uk-width-1-1">
                    <strong> Description </strong>
                    <textarea class="uk-textarea" type="textarea" name="description"
                              id="message" placeholder="Description" maxlength="140" rows="7"></textarea>
                    <span class="help-block"><p id="characterLeft"
                                                class="help-block "></span>
                </div>

                <div class="uk-width-1-1">
                    <button type="submit" id="submit" name="submit"
                            class="btn btn-primary pull-right">Submit Form
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<br>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        $(".alert-success").fadeTo(2000, 500).slideUp(500, function () {
            $("#success-alert").slideUp(500);
        });
    });
    $(document).ready(function () {
        $(".alert-danger").fadeTo(2000, 500).slideUp(500, function () {
            $(".alert-danger").slideUp(500);
        });
    });
</script>
</html>