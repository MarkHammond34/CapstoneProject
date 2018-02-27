<%@include file="jspf/header.jsp"%>

<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<%@include file="jspf/navbar.jspf"%>
	<%@include file="jspf/footer.jspf"%>

	<%@include file="jspf/messages.jsp"%>

	<div uk-grid>
		<div class="uk-width-1-4"></div>
		<div class="uk-width-1-2">
			<div class="uk-card uk-card-default uk-card-large uk-card-body">
				<h3 class="uk-card-title"
					style="margin-bottom: 25px; text-align: center;">Create A
					Listing</h3>
				<hr>
				<div class="form-area">
					<form method="POST" class="uk-grid-large"
						onsubmit="return validateForm()" action="uploadListing"
						enctype="multipart/form-data" name="uploadListingForm" uk-grid>
						<br style="clear: both">

						<div uk-grid>
							<div class="uk-width-1-2">
								<strong>Title of Product</strong> <input type="text"
									class="uk-input" id="titleId" name="title" placeholder="Title">
								<span class="val_error" id="title_error"></span>
							</div>
							<div class="uk-width-1-2">
								<strong>File to upload:</strong> <input type="file" name="file">
							</div>
						</div>
						<div uk-grid>
							<div class="uk-width-1-2">
								<strong>Category</strong><select id="category" name="category"
									class="uk-select" onchange="changeCategory(this);" required>
									<option value="" disabled selected>Select Category</option>
									<option value="apparel">Apparel</option>
									<option value="furnature">Furnature</option>
									<option value="supplies">School Supplies</option>
									<option value="technology">Technology</option>
								</select>
							</div>
							<div class="uk-width-1-2" id="placeholder">
								<strong>Sub-Category</strong> <input class="uk-input"
									placeholder="Please select a Category">
							</div>

							<%@include file="jspf/sub-category.jsp"%>
						</div>
						<div uk-grid>
							<div class="uk-width-1-2">
								<strong>Type</strong><select id="type" name="type"
									class="uk-select" onchange="typeChange(this);" required>
									<option value="" disabled selected>Select Listing Type</option>
									<option value="auction">Auction</option>
									<option value="donation">Donation</option>
									<option value="fixed">Fixed Price</option>
								</select>
							</div>

							<div class="uk-width-1-2" id="value">
								<strong>Price</strong><input type="number" class="uk-input"
									id="price" name="price" placeholder="Price" disabled>
							</div>
						</div>
						<div class="uk-width-1-1" id="dateEnd">
							<strong>End Date</strong><input type="datetime-local"
								class="uk-input" id="endDate" name="endDate"
								placeholder="End Date" disabled>
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
								class="btn btn-primary pull-right">Submit Form</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br>
</body>
<script type="text/javascript">
	function validateForm() {
		var title = document.forms["uploadListingForm"]["title"].value;
		var title_error = document.getElementById("title_error");
		var titleId = document.getElementById("titleId");
		
		var file = document.forms["uploadListingForm"]["file"].value;
		var fileArray = file.split(".");
		var extension = fileArray[1];

		var priceString = document.forms["uploadListingForm"]["price"].value;
		var price = parseInt(priceString);
		
		titleId.addEventListener("blur", titleVerify, true);
		

		

		console.log("title = " + title);
		if (title == "" || title == null) {
			console.log("Hit title validity");
			titleId.style.border = "1px solid red";
			title_error.textContent = "*Title is required";
			title_error.style.color = "red";
			titleId.focus();
			return false;
		}

		if (extension != "jpeg" && extension != "png" && extension != "jpg") {
			console.log(extension);
			window.alert("extension error");
			return false;

		} else if (price < 0) {
			window.alert("price error");
			return false;
		}

		window.alert("Good shit");

	}
	
	function titleVerify() {
		if (titleId != "") {
			titleId.style.border = "1px solid black";
			title_error.innterHTML = "";
			return true;
		}
	}

	function changeCategory(option) {

		if (option.value == "apparel") {
			document.getElementById('apparelSub').style.display = 'inline';
			document.getElementById('technologySub').style.display = 'none';
			document.getElementById('furnatureSub').style.display = 'none';
			document.getElementById('suppliesSub').style.display = 'none';
			document.getElementById('placeholder').style.display = 'none';

		} else if (option.value == "technology") {
			document.getElementById('apparelSub').style.display = 'none';
			document.getElementById('technologySub').style.display = 'inline';
			document.getElementById('furnatureSub').style.display = 'none';
			document.getElementById('suppliesSub').style.display = 'none';
			document.getElementById('placeholder').style.display = 'none';

		} else if (option.value == "furnature") {
			document.getElementById('apparelSub').style.display = 'none';
			document.getElementById('technologySub').style.display = 'none';
			document.getElementById('furnatureSub').style.display = 'inline';
			document.getElementById('suppliesSub').style.display = 'none';
			document.getElementById('placeholder').style.display = 'none';

		} else if (option.value == "supplies") {
			document.getElementById('apparelSub').style.display = 'none';
			document.getElementById('technologySub').style.display = 'none';
			document.getElementById('furnatureSub').style.display = 'none';
			document.getElementById('suppliesSub').style.display = 'inline';
			document.getElementById('placeholder').style.display = 'none';
		}
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
	<%@include file="jspf/footer.jspf"%>
</html>