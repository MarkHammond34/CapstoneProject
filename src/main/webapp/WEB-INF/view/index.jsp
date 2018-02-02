<%@include file="jspf/header.jsp"%>

<body>

	<%@include file="jspf/navbar.jspf"%>

	<div class="uk-background-muted">

		<div class="uk-section">

			<div class="uk-container">
			<br><br>
				<hgroup class="mb20">
					<h2>Most recent listings</h2>
				</hgroup>

				<c:forEach var="listing" items="${listings}">
					<section class="col-xs-12 col-sm-6 col-md-12">
						<article class="search-result row">
							<div class="col-xs-12 col-sm-12 col-md-3">
								<a href="#" title="Lorem ipsum" class="thumbnail"><img
									src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
									alt="Listing" /></a>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-2">
								<ul class="meta-search">
									<li><i class="glyphicon glyphicon-user"></i> <span>${listing.user.username}</span></li>
									<li><i class="glyphicon glyphicon-usd"></i> <span>${listing.price}</span></li>
									<li><i class="glyphicon glyphicon-map-marker"></i> <span>Location</span></li>
									<li><i class="glyphicon glyphicon-star-empty"></i> <span>Watch Item</span>
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
		</div>
	</div>
</body>
</html>