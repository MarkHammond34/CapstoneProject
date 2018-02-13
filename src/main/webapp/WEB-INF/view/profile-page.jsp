<%@include file="jspf/header.jsp"%>

<body>
	<%@include file="jspf/navbar.jspf"%>

	<div class="container-fluid">
		<div class="row">
			<div class="fb-profile">
				<img align="left" class="fb-image-lg"
					src="<%=request.getContextPath()%>/resources/img/background/ulistit_background.jpg"
					alt="Profile image example" height="250" /> <img align="left"
					style="border-radius: 50%" class="fb-image-profile thumbnail"
					src="<%=request.getContextPath()%>/resources/img/profile-pic/default.jpeg"
					alt="Profile image example" />
				<div class="fb-profile-text">
					<h1>
						<strong class="uk-text-danger">${user.username}</strong>
					</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- /container fluid-->
	<div class="uk-section uk-section-muted">
		<div class="uk-grid">

			<div class="uk-width-1-3 uk-column-divider uk-grid" uk-grid uk-scrollspy="cls: uk-animation-fade; target: > div > .uk-card; delay: 500; repeat: true">
				<div class="uk-container uk-container-small">
					<dl class="uk-description-list uk-description-list-divider">
						<dt>
							<strong class="uk-text-danger">About Me</strong>
						</dt>
						<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</dd>
						<dt>
							<strong class="uk-text-danger">Rating</strong>
						</dt>
						<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</dd>
						<dt>
							<strong class="uk-text-danger">Connections</strong>
						</dt>
						<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</dd>
					</dl>
				</div>
			</div>

			<div class="uk-width-2-3">
				<div class="uk-container uk-container-small">
					<h4>
						<strong class="uk-text-danger"> ${user.username}</strong> has <strong
							class="uk-text-danger"> ${userListings.size()}</strong> listings
						posted.
					</h4>
					<hr>
					<div class="uk-grid-large uk-child-width-1-3 uk-text-center"
						uk-grid>
						<c:forEach var="listing" items="${userListings}">

							<div class="uk-card uk-card-muted uk-card-small uk-card-body">
								<img
									src="<%=request.getContextPath()%>/resources/img/listings/${listing.image_path}">
								<div class="name" style="font-size: 20px;">
									<a href="#"><strong class="uk-text-danger">${listing.name}</strong></a>
								</div>
								<div class="price" style="font-size: 16px;">
									<a href="${pageContext.request.contextPath}/editListing"><strong>$${listing.price}</strong></a>
								</div>
							</div>

						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>