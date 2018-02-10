<%@include file="jspf/header.jsp"%>

<body>

	<%@include file="jspf/navbar.jspf"%>

	<div style="background-color: #f2f2f2;">

		<div class="uk-section">
			<div class="uk-container">

				<form class="uk-form-stacked" method="POST"
					action="displayListingByCategory">
					<div class="uk-margin">
						<div class="row">
							<div class="col-xs-6 col-xs-offset-2">
								<div class="uk-form-controls">
									<select class="uk-select" id="form-stacked-select"
										name="category">
										<option value="" disabled selected>Select Category</option>
										<option value="apparel">Apparel</option>
										<option value="books">Books</option>
										<option value="furnature">Furnature</option>
										<option value="supplies">School Supplies</option>
										<option value="technology">Technology</option>
									</select>
								</div>
							</div>
							<button class="uk-button uk-button-success">Submit</button>
						</div>

					</div>
				</form>

				<c:if test="${listings != null}">
					<div class="container">


						<hgroup class="mb20">
							<h1>Results</h1>
							<h2 class="lead">
								<strong class="text-danger">${listings.size()}</strong> results
								were found for the search for <strong class="text-danger">${category}</strong>
							</h2>
						</hgroup>

						<c:forEach var="listing" items="${listings}">

							<section class="col-xs-12 col-sm-6 col-md-12">
								<article class="search-result row">
									<div class="col-xs-12 col-sm-12 col-md-3">
										<a href="#" title="Lorem ipsum" class="thumbnail"><img
											src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
											alt="Listing" height="140" width="250" /></a>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-2">
										<ul class="meta-search">
											<li><i class="glyphicon glyphicon-user"></i> <span>${user.username}</span></li>
											<li><i class="glyphicon glyphicon-usd"></i> <span>${listing.price}
											</span></li>
											<li><i class="glyphicon glyphicon-map-marker"></i> <span>Insert
													Location Here</span></li>
										</ul>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
										<h3>
											<a href="#" title="">${listing.name}</a>
										</h3>
										<p>${listing.description}</p>

										<span class="plus"><a
											href="${pageContext.request.contextPath}/checkoutPage"
											title="Buy Now!"><i uk-icon="icon: cart"></i></a></span>

									</div>
									<span class="clearfix borda"></span>
								</article>
							</section>

						</c:forEach>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
<%@include file="jspf/footer.jspf"%>
</html>