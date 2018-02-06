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
					src="<%=request.getContextPath()%>/resources/img/profile-pic/${user.image_path}">
				<!-- http://lorempixel.com/850/280/people/9/ -->
			</div>
			<div class="useravatar">
				<a href="#editProfilePic${user.userID}" data-toggle="modal"
					data-target="#editProfilePic${user.userID}"><span
					data-toggle="tooltip" data-placement="right"> <img alt=""
						src="<%=request.getContextPath()%>/resources/img/profile-pic/${user.image_path}"></span></a>
			</div>
			<div class="card-info">
				<span class="card-title">${user.username}</span>

			</div>
		</div>
		<%@include file="jspf/editProfilePic.jspf"%>

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

									<div class="container">
										<div class="row">
											<h4>
												So I've worked on a new project and came up with this UI.
												Here you can use it. :) Follow me on twitter: <a
													href="https://twitter.com/AlexMahrt/">@AlexMahrt</a>
											</h4>
										</div>
										<hr>
										<div class="row row-margin-bottom">
											<div class="col-md-5 no-padding lib-item"
												data-category="view">
												<div class="lib-panel">
													<div class="row box-shadow">
														<div class="col-md-6">
															<img class="lib-img-show"
																src="http://lorempixel.com/850/850/?random=123">
														</div>
														<div class="col-md-6">
															<div class="lib-row lib-header">
																Example library
																<div class="lib-header-seperator"></div>
															</div>
															<div class="lib-row lib-desc">Lorem ipsum dolor
																Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor
																Lorem ipsum dolor Lorem ipsum dolor</div>
														</div>
													</div>
												</div>
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
					<%@include file="profile-bid-section.jsp"%>
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