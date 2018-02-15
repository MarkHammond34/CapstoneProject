<%@include file="jspf/header.jsp"%>

<body>

	<%@include file="jspf/navbar.jspf"%>


	<c:if test="${categoryListing != null}">
		<div class="container">
			<hgroup class="mb20">
				<h1>Results</h1>
				<h2 class="lead">
					<strong class="text-danger">${categoryListing.size()}</strong>
					results were found for the search for <strong class="text-danger">${search}</strong>
				</h2>
			</hgroup>

			<c:forEach var="listings" items="${categoryListing}">

				<section class="col-xs-12 col-sm-6 col-md-12">
					<article class="search-result row">
						<div class="col-xs-12 col-sm-12 col-md-3">
							<a href="#" title="Lorem ipsum" class="thumbnail"><img
								src="<%=request.getContextPath()%>/resources/img/listings/${listings.image_path}"
								alt="Listing" height="140" width="250" /></a>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-2">
							<ul class="meta-search">
								<li><i class="glyphicon glyphicon-user"></i> <span>${user.username}</span></li>
								<li><i class="glyphicon glyphicon-usd"></i> <span>${listings.price}
								</span></li>
								<li><i class="glyphicon glyphicon-map-marker"></i> <span>Insert
										Location Here</span></li>
							</ul>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
							<h3>
								<a href="#" title="">${listings.name}</a>
							</h3>
							<p>${listings.description}</p>
							<span class="plus"><a href="#" title="Lorem ipsum"><i
									class="glyphicon glyphicon-plus"></i></a></span>

						</div>
						<span class="clearfix borda"></span>
					</article>
				</section>
			</c:forEach>
		</div>
	</c:if>
	</div>
</body>
</html>