<%@include file="jspf/header.jsp"%>

<body>

	<%@include file="jspf/navbar.jspf"%>

	<div class="uk-position-relative uk-visible-toggle uk-light"
		uk-slideshow="max-height: 600; ratio: 10:3">

		<ul class="uk-slideshow-items">
			<li><img
				src="${pageContext.request.contextPath}/resources/img/volunteer-2055015_1920.png"
				alt="" heigh="600" uk-cover></li>
		</ul>
	</div>
	<div class="uk-container">
		<h1 style="text-align: center; padding-top: 20px;">
			<strong>VIEW OUR DONATED ITEMS</strong>
		</h1>
		<hr class="colorgraph">
		<div class="uk-section uk-section-default">
			<div class="uk-grid" uk-grid>
				<div class="uk-width-1-4 uk-column-divider">
					<div class="uk-container uk-container-small">
						<div class="uk-card uk-card-default">
							<div class="uk-card-media-top">
								<img
									src="${pageContext.request.contextPath}/resources/img/give-and-take-556151_1920.jpg"
									alt="">
							</div>
							<div class="uk-card-body">
								<h3 class="uk-card-title">
									<a href="#">Donate </a> an item today!
								</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="uk-width-3-4">
					<div class="uk-container uk-container-small">
						<form ethod="POST" action="donationCategory"
							name="categorizeDonationForm">
							<select name='category' onchange='this.form.submit()'>
								<option selected>Milk</option>
								<option value="apparel">Apparel</option>
								<option value="furnature">Furnature</option>
								<option value="supplies">School Supplies</option>
								<option value="technology">Technology</option>
							</select>
							<noscript>
								<input type="submit" value="Submit">
							</noscript>


						</form>
						<div class="uk-container">
							<div class="uk-grid-large uk-child-width-1-3 uk-text-center"
								uk-grid>
								<c:forEach var="listing" items="${donationList}">
									<%@include file="jspf/index-listing.jsp"%>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr class="colorgraph">
	</div>
</body>
	<%@include file="jspf/footer.jspf"%>
</html>