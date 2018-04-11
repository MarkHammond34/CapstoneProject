<%@include file="jspf/header.jsp"%>
<body>

	<%@include file="jspf/navbar.jspf"%>

	<!--<div style="background-color: #f2f2f2;">-->

		<div class="uk-section">

            <div class="uk-container">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="form-area uk-align-center">
						<form method="POST" class="uk-grid-large"
							onsubmit="return validateForm()" action="confirmOffer"
							enctype="multipart/form-data" name="uploadListingForm" uk-grid>
							<br style="clear: both">
							<h3 style="margin-bottom: 15px; text-align: center;">Make an
								offer</h3>

							<hr class="colorgraph uk-width-1-1 uk-align-center">

							<div class="uk-width-1-1">
								<strong>Price</strong><input type="number" class="uk-input"
									id="price" name="offer-amount" placeholder="Offer" required>
							</div>
							<div class="uk-width-1-1">
								<strong> Offer Message (Optional): </strong>
								<textarea class="uk-textarea" type="textarea" name="offer-message"
									id="message" placeholder="Message" maxlength="140" rows="7"></textarea>
								<span class="help-block"><p id="characterLeft"
										class="help-block "></span>
								<input type="hidden" name="listing" value="${listing.id}">
							</div>

							<hr class="colorgraph uk-width-1-1 uk-align-center">

							<div class="uk-width-1-1">
								<button type="submit" id="submit" name="submit"
									class="btn btn-primary pull-right">Submit Form</button>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>

</body>
<%@include file="jspf/footer.jspf"%>
</html>