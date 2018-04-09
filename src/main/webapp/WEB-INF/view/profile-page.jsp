<%@include file="jspf/header.jsp"%>

<body>
	<%@include file="jspf/navbar.jspf"%>
	<div class="uk-container">
		<div class="row">
			<div class="fb-profile">
				<a href="${pageContext.request.contextPath}/editUser"><img
					align="left" style="border-radius: 50%"
					class="fb-image-profile thumbnail"
					src="https://media-exp2.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAO7AAAAJDVkYzc5Y2UzLWM2YzktNGVhMi05YWJjLTdlYjVlNzc1Nzk4OQ.jpg"
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
	<div class="uk-margin-left uk-section uk-section-muted">
		<div class="uk-grid uk-margin-left">
			<div class="uk-width-1-4 uk-column-divider uk-grid" uk-grid
				uk-scrollspy="cls: uk-animation-fade; target: > div > .uk-card; delay: 500; repeat: true">
				<div class="uk-margin-left uk-container uk-container-small">
					<dl
						class="uk-margin-left uk-description-list uk-description-list-divider">
						<dt>
							<strong class="uk-text-danger">Joined Date</strong>
						</dt>
						<dd>${user.truncatedDate}</dd>
						<dt>
							<strong class="uk-text-danger">About Me</strong>
						</dt>
						<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</dd>
						<dt>
							<strong class="uk-text-danger">Seller Rating</strong>
						</dt>
						<c:choose>
							<c:when
								test="${user.sellerRating == null || user.sellerRating == 0}">
								<dd>This user does not have any transactions!</dd>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${user.sellerRating == 1}">
										<td><span uk-icon="star"></span></td>
									</c:when>
									<c:when test="${user.sellerRating == 2}">
										<td><span uk-icon="star"></span><span uk-icon="star"></span></td>
									</c:when>
									<c:when test="${user.sellerRating == 3}">
										<td><span uk-icon="star"></span><span uk-icon="star"></span><span uk-icon="star"></span></td>
									</c:when>
									<c:when test="${user.sellerRating == 4}">
										<td><span uk-icon="star"></span><span uk-icon="star"></span><span uk-icon="star"></span><span uk-icon="star"></span></td>
									</c:when>
									<c:when test="${user.sellerRating == 5}">
										<td><span uk-icon="star"></span><span uk-icon="star"></span><span uk-icon="star"></span><span uk-icon="star"></span><span uk-icon="star"></span></td>
									</c:when>
								</c:choose>
								<dd></dd>
								<dd class="uk-margin-top">
									<a
										href="${pageContext.request.contextPath}/sellerReviews?id=${user.userID}"
										class="uk-button uk-button-small uk-button-primary">View
										Seller Reviews</a>
								</dd>
							</c:otherwise>
						</c:choose>
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
								<c:when test="${isFollowing == 'following' }">
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
											<strong class="uk-text-danger">${yourFollowing.size() - 1}</strong>
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
					<c:choose>
						<c:when test="${sessionScope.user.userID == user.userID }">
							<h4>
								<strong class="uk-text-danger">You</strong> have <strong
									class="uk-text-danger"> ${userListings.size()}</strong>
								listing(s) posted.
							</h4>
						</c:when>

						<c:otherwise>
							<h4>
								<strong class="uk-text-danger"> ${user.username}</strong> has <strong
									class="uk-text-danger"> ${userListings.size()}</strong>
								listing(s) posted.
							</h4>
						</c:otherwise>
					</c:choose>
					<hr>
					<div class="uk-grid-large uk-child-width-1-3 uk-text-center"
						uk-grid>
						<c:forEach var="listing" items="${userListings}">
							<%@include file="listing/index-listing.jsp"%>
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
<%@include file="jspf/footer.jspf"%>
</html>