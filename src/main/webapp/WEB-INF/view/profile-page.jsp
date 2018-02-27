<%@include file="jspf/header.jsp"%>

<body>
	<%@include file="jspf/navbar.jspf"%>

	<div class="container-fluid">
		<div class="row">
			<div class="fb-profile">
				<img align="left" class="fb-image-lg"
					src="<%=request.getContextPath()%>/resources/img/background/ulistit_background.jpg"
					alt="Profile image example" height="250" /> <a
					href="${pageContext.request.contextPath}/editUser"><img
					align="left" style="border-radius: 50%"
					class="fb-image-profile thumbnail"
					src="<%=request.getContextPath()%>/resources/img/profile-pic/${user.image_path}"
					alt="Profile image example" /></a>
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
			<div class="uk-width-1-4 uk-column-divider uk-grid" uk-grid
				uk-scrollspy="cls: uk-animation-fade; target: > div > .uk-card; delay: 500; repeat: true">
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
						<dd>
							<c:if test="${sessionScope.user.userID != user.userID }">
								<br>
								<c:choose>
									<c:when test="${isFollowing == 'follow'}">
										<div class="uk-clearfix" id="follow">
											<div class="uk-float-left">
												<input type="hidden" id="followUser" value="${user.userID}">
												<button class="uk-button uk-button-default uk-width-1-1"
													type="button" onclick="follow()" data-uk-button>+
													Follow</button>
											</div>
										</div>

										<div class="uk-clearfix" id="unfollow" style="display: none;">
											<div class="uk-float-left">
												<input type="hidden" id="unfollowUser"
													value="${user.userID}">
												<button class="uk-button uk-button-danger uk-width-1-1"
													type="button" value="${user.userID}" onclick="unfollow()"
													data-uk-button>Following</button>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="uk-clearfix" id="follow" style="display: none;">
											<div class="uk-float-left">
												<input type="hidden" id="followUser" value="${user.userID}">
												<button class="uk-button uk-button-default uk-width-1-1"
													type="button" onclick="follow()" data-uk-button>+
													Follow</button>
											</div>
										</div>

										<div class="uk-clearfix" id="unfollow">
											<div class="uk-float-left">
												<input type="hidden" id="unfollowUser"
													value="${user.userID}">
												<button class="uk-button uk-button-danger uk-width-1-1"
													type="button" value="${user.userID}" onclick="unfollow()"
													data-uk-button>Following</button>
											</div>
										</div>
									</c:otherwise>
								</c:choose>

							</c:if>
							<br>


							<c:choose>
								<c:when test="${isFollowing == 'follow' }">
									<div class="uk-clearfix" id="followingTotal">
										<div class="uk-float-left">
											<strong class="uk-text-danger">${yourFollowing.size()}</strong>
											Followers
										</div>
										<div class="uk-float-right">
											<strong class="uk-text-danger">${peopleFollowingYou.size()}</strong>
											Following
										</div>
									</div>
									<div class="uk-clearfix" id="followingTotalNew"
										style="display: none;">
										<div class="uk-float-left">
											<strong class="uk-text-danger">${yourFollowing.size() - 1}</strong>
											Followers
										</div>
										<div class="uk-float-right">
											<strong class="uk-text-danger">${peopleFollowingYou.size()}</strong>
											Following
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="uk-clearfix" id="followingTotal">
										<div class="uk-float-left">
											<strong class="uk-text-danger">${yourFollowing.size()}</strong>
											Followers
										</div>
										<div class="uk-float-right">
											<strong class="uk-text-danger">${peopleFollowingYou.size()}</strong>
											Following
										</div>
									</div>
									<div class="uk-clearfix" id="followingTotalNew"
										style="display: none;">
										<div class="uk-float-left">
											<strong class="uk-text-danger">${yourFollowing.size() + 1}</strong>
											Followers
										</div>
										<div class="uk-float-right">
											<strong class="uk-text-danger">${peopleFollowingYou.size()}</strong>
											Following
										</div>
									</div>

								</c:otherwise>
							</c:choose>

						</dd>
					</dl>
				</div>
			</div>
			<div class="uk-width-3-4">
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
							<%@include file="jspf/index-listing.jsp"%>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(".watch-item").click(function() {
			var id = $(this).attr('id')
			$(this).toggleClass('watch-item');
			console.log("Hit Ajax")
			$.ajax({
				type : "POST",
				url : "watchListing",
				data : {
					listingID : id
				},
				success : function() {
					console.log("Complete")
				},

			});
		})

		function follow() {
			document.getElementById('unfollow').style.display = "inline";
			document.getElementById('follow').style.display = "none";
			document.getElementById('followingTotalNew').style.display = "inline";
			document.getElementById('followingTotal').style.display = "none";
			var userID = document.getElementById('followUser').value;
			$.ajax({
				type : 'GET',
				url : 'followUser',
				data : {
					result : "follow",
					followerId : userID
				}
			});
		}
		function unfollow() {
			document.getElementById('unfollow').style.display = "none";
			document.getElementById('follow').style.display = "inline";
			document.getElementById('followingTotalNew').style.display = "none";
			document.getElementById('followingTotal').style.display = "inline";
			var userID = document.getElementById('unfollowUser').value;
			$.ajax({
				type : 'GET',
				url : 'followUser',
				data : {
					result : "unfollow",
					followerId : userID

				}
			});
		}
	</script>
</body>
</html>