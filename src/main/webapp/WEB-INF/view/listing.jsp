<%@include file="jspf/header.jsp"%>

<body>

	<%@include file="jspf/navbar.jspf"%>

	<hr>

	<div style="background-color: #f2f2f2;">

		<div class="uk-section">

			<div class="uk-container">

				<div uk-grid>
					<!-- LEFT SIDE -->
					<div class="uk-width-1-2@m">
						<div class="uk-position-relative uk-margin-medium">
							<div class="uk-position-relative" uk-slideshow="animation: fade">

								<ul class="uk-slideshow-items">
									<li><img class="uk-thumbnail uk-thumbnail-medium"
										src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
										alt="" uk-cover></li>
									<li><img class="uk-thumbnail uk-thumbnail-medium"
										src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
										alt="" uk-cover></li>
									<li><img class="uk-thumbnail uk-thumbnail-medium"
										src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
										alt="" uk-cover></li>
								</ul>

								<div class="uk-position-bottom-center uk-position-small">
									<ul class="uk-thumbnav">
										<li uk-slideshow-item="0"><a href="#"> <img
												class="uk-thumbnail"
												src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
												width="100" alt="">
										</a></li>
										<li uk-slideshow-item="1"><a href="#"> <img
												class="uk-thumbnail"
												src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
												width="100" alt="">
										</a></li>
										<li uk-slideshow-item="2"><a href="#"> <img
												class="uk-thumbnail"
												src="${pageContext.request.contextPath}/resources/img/listings/${listing.image_path}"
												width="100" alt="">
										</a></li>
									</ul>
								</div>

							</div>
						</div>
					</div>

					<!-- RIGHT SIDE -->

					<c:if test="${listing.type.equals('fixed')}">
						<div class="uk-width-1-2@m">

							<div class="uk-card uk-card-body">
								<article class="uk-article">

									<p class="uk-article-meta" style="font-weight: bold;">
										Posted by <a href="viewProfile">${user.username}</a> on
										<%--${listing.dateCreated} --%>
										${date}.
									</p>

									<h1 class="uk-article-title">
										<p>${listing.name}</p>
										<a
											<c:if test="${hasOffer}">onclick="return confirm('You have already made an offer for this listing. Making a new one will replace the current one. Is this okay?');"</c:if>
											class="uk-button uk-button-text" style="color: green;"
											href="${pageContext.request.contextPath}/makeOffer?listing=${listing.id}">Make
											offer</a>

									</h1>

									<p class="uk-text-lead">${listing.description}</p>

									<div class="uk-grid-small uk-child-width-auto" uk-grid>
										<div>$${listing.price}</div>
									</div>

								</article>

							</div>

						</div>

					</c:if>
					<c:if test="${listing.type.equals('auction')}">

						<div class="uk-width-1-2@m">

							<div class="uk-card uk-card-body">
								<article class="uk-article">

									<p class="uk-article-meta" style="font-weight: bold;">
										Posted by <a href="viewProfile">${user.username}</a> on
										<%--${listing.dateCreated} --%>
										${date}.
									</p>

									<div class="uk-grid-small uk-child-width-auto" uk-grid>
										<div class="price" style="font-size: 16px;">
											<span class="uk-badge">Current Bid:
												$${listing.highestBid}</span>

											<c:if test="${listing.user.userID != user.userID}">
												<a class="uk-button uk-button-text"
													style="color: cornflowerblue; margin-left: 5px"
													uk-toggle="target: #placeBidModal${listing.id}"
													id="bidButton${listing.id}">Place Bid</a>
											</c:if>
											<c:if test="${listing.highestBidder.userID == user.userID}">
												<a title="Cancel Bid" uk-icon="icon: ban"
													uk-toggle="target: #cancelBid${listing.id}Modal"
													style="margin-left: 10px; color: red;"></a>
											</c:if>
										</div>
										<hr>
										<div style="margin-left: 8%;" id="countdown${listing.id}"
											class="uk-grid-small" uk-grid
											uk-countdown="date: ${listing.endTimestamp}">
											<div>
												<div class="uk-countdown-label uk-text-center uk-visible@s">Days</div>
												<div class="uk-countdown-number uk-countdown-days"></div>
											</div>
											<div>
												<div class="uk-countdown-label uk-text-center uk-visible@s">Hours</div>
												<div class="uk-countdown-number uk-countdown-hours"></div>
											</div>
											<div>
												<div class="uk-countdown-label uk-text-center uk-visible@s">Minutes</div>
												<div class="uk-countdown-number uk-countdown-minutes"></div>
											</div>
											<div>
												<div class="uk-countdown-label uk-text-center uk-visible@s">Seconds</div>
												<div class="uk-countdown-number uk-countdown-seconds"></div>
											</div>
										</div>
									</div>

								</article>

							</div>

						</div>

					</c:if>

				</div>

			</div>
		</div>

	</div>

</body>
<%@include file="jspf/footer.jspf"%>
</html>