<%@include file="jspf/header.jsp"%>

<body>

	<%@include file="jspf/navbar.jspf"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<br>
	<br>
	<div class="col-lg-12 col-sm-12">
		<div class="card hovercard">
			<div class="card-background">
				<img class="card-bkimg" alt=""
					src="http://lorempixel.com/100/100/people/9/">
				<!-- http://lorempixel.com/850/280/people/9/ -->
			</div>
			<div class="useravatar">
				<img alt="" src="http://lorempixel.com/100/100/people/9/">
			</div>
			<div class="card-info">
				<span class="card-title">${user.username}</span>

			</div>
		</div>
		<div class="btn-pref btn-group btn-group-justified btn-group-lg"
			role="group" aria-label="...">
			<div class="btn-group" role="group">
				<button type="button" id="stars" class="btn btn-primary"
					href="#tab1" data-toggle="tab">
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<div class="hidden-xs">Your Listings</div>
				</button>
			</div>
			<div class="btn-group" role="group">
				<button type="button" id="favorites" class="btn btn-default"
					href="#tab2" data-toggle="tab">
					<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
					<div class="hidden-xs">Your Bids</div>
				</button>
			</div>
			<div class="btn-group" role="group">
				<button type="button" id="following" class="btn btn-default"
					href="#tab3" data-toggle="tab">
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					<div class="hidden-xs">Watching</div>
				</button>
			</div>
		</div>

		<div class="well">
			<div class="tab-content">
				<div class="container tab-pane fade in active" id="tab1">
					<div class="container container-pad" id="property-listings">
						<div class="row">
							<div class="col-sm-5">
								<c:forEach var="listing" items="${userListings}">

									<!-- Begin Listing: 609 W GRAVERS LN-->
									<div
										class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
										<div class="media">
											<a class="pull-left" href="#" target="_parent"> <img
												alt="image" class="img-responsive"
												src="<%=request.getContextPath()%>/resources/img/listings/${listing.image_path}"></a>

											<div class="clearfix visible-sm"></div>

											<div class="media-body fnt-smaller">
												<a href="#" target="_parent"></a>

												<h4 class="media-heading">
													<a href="#editListingModal${listing.id}"
														data-toggle="modal"
														data-target="#editListingModal${listing.id}"
														style="color: black;"><span data-toggle="tooltip"
														data-placement="right"> <small
															class="pull-right glyphicon glyphicon-edit"></small>
													</span></a>
												</h4>


												<p class="hidden-xs">${listing.description}</p>

											</div>
										</div>
									</div>
									<%@include file="jspf/editListing.jspf"%>

								</c:forEach>
								<!-- End Listing-->
							</div>
						</div>
					</div>

					<!-- End Listing-->
				</div>
				<div class="tab-pane fade in" id="tab2">
					<h3>These are the items your're bidding on</h3>
				</div>
				<div class="tab-pane fade in" id="tab3">
					<h3>These are your watched items</h3>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(
			function() {
				$(".btn-pref .btn").click(
						function() {
							$(".btn-pref .btn").removeClass("btn-primary")
									.addClass("btn-default");
							// $(".tab").addClass("active"); // instead of this do the below 
							$(this).removeClass("btn-default").addClass(
									"btn-primary");
						});
			});
</script>
</html>