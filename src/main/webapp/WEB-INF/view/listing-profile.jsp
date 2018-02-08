<%@include file="jspf/header.jsp"%>

<body>
	<%@include file="jspf/navbar.jspf"%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="uk-child-width-expand@s uk-text-center" uk-grid>
		<div class="uk-width-1-4">
			<div class="uk-card uk-card-muted uk-card-body uk-grid-margin">
				<div>
					<h3>
						<a class="uk-link-heading" href="">Content Header</a>
					</h3>
				</div>
				<hr>
				<div>
					<a href="" class="uk-link-reset">content</a>
				</div>
				<div>
					<a href="" class="uk-link-reset">content</a>
				</div>
				<div>
					<a href="" class="uk-link-reset">content</a>
				</div>
				<br>

				<div>
					<h3>
						<a class="uk-link-heading" href="">Content Header</a>
					</h3>
				</div>
				<hr>
				<div>
					<a href="" class="uk-link-reset">content</a>
				</div>
				<div>
					<a href="" class="uk-link-reset" swe4w property>content</a>
				</div>
				<div>
					<a href="" class="uk-link-reset">content</a>
				</div>
				<br>

				<div>
					<h3>
						<a class="uk-link-heading" href="">Content Header</a>
					</h3>
				</div>
				<hr>
				<div>
					<a href="" class="uk-link-reset">content</a>
				</div>
				<div>
					<a href="" class="uk-link-reset">content</a>
				</div>
				<div>
					<a href="" class="uk-link-reset"> content</a>
				</div>
				<br>
			</div>
		</div>
		<div class="uk-width-3-4">
			<ul class="uk-flex-center" uk-tab>
				<li><a href="#">Your Listings</a></li>
				<li><a href="#">Your Biddings</a></li>
				<li><a href="#">Currently Watching</a></li>
			</ul>

			<ul class="uk-switcher uk-margin">
				<li><div
						class="uk-grid-large uk-child-width-1-3 uk-text-center" uk-grid>
						<c:forEach var="listing" items="${userListings}">

							<div class="uk-card uk-card-muted uk-card-small uk-card-body">
								<img
									src="<%=request.getContextPath()%>/resources/img/listings/${listing.image_path}">
								<div class="name" style="font-size: 20px;">
									<a href="#"><strong class="uk-text-danger">${listing.name}</strong></a>
								</div>
								<div class="price" style="font-size: 16px;">
									<strong>$${listing.price}</strong>
								</div>
							</div>

						</c:forEach>

					</div></li>
				<li>Ut enim ad minim veniam, quis nostrud exercitation ullamco
					laboris nisi ut aliquip ex ea commodo consequat.</li>
				<li>Duis aute irure dolor in reprehenderit in voluptate velit
					esse cillum dolore eu fugiat nulla pariatur, sed do eiusmod.</li>
			</ul>
		</div>
	</div>
</html>