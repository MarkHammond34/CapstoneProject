<%@include file="jspf/header.jsp"%>
<body>

	<%@include file="jspf/messages.jsp"%>

	<%@include file="jspf/navbar.jspf"%>
	<%@include file="jspf/footer.jspf"%>

	<div>

		<div class="uk-section">
			<div class="uk-position-relative uk-visible-toggle uk-light"
				uk-slideshow="max-height: 300; ratio: 10:3">

				<ul class="uk-slideshow-items">
					<li><img
						src="${pageContext.request.contextPath}/resources/img/hp-img1.png"
						alt="" width="1203" uk-cover></li>
					<li><img
						src="${pageContext.request.contextPath}/resources/img/sunset.jpg"
						alt="" uk-cover></li>
					<li><img
						src="${pageContext.request.contextPath}/resources/img/sunset.jpg"
						alt="" uk-cover></li>
				</ul>

				<a class="uk-position-center-left uk-position-small uk-hidden-hover"
					href="#" uk-slidenav-previous uk-slideshow-item="previous"></a> <a
					class="uk-position-center-right uk-position-small uk-hidden-hover"
					href="#" uk-slidenav-next uk-slideshow-item="next"></a>

			</div>
			<br>
			<div class="uk-child-width-expand@s uk-text-center" uk-grid>
				<div class="uk-width-1-4">
					<h2>Auctions</h2>
					<div class="uk-card uk-card-default uk-card-body uk-grid-margin">
						<div class="uk-container uk-container-small">
							<dl class="uk-description-list uk-description-list-divider">
								<dt>
									<a onclick="dailyBidClicked()"><strong
										class="uk-text-danger">Daily</strong></a><span
										class="uk-badge pull-right">${dailyBids.size()}</span>
								</dt>

								<dt>
									<a onclick="weeklyBidClicked()"><strong
										class="uk-text-danger">Weekly</strong></a><span
										class="uk-badge pull-right">${weeklyBids.size()}</span>
								</dt>

								<dt>
									<a onclick="beyondWeekClick()"><strong
										class="uk-text-danger">Week+</strong></a><span
										class="uk-badge pull-right">${weeklyPlus.size()}</span>
								</dt>
								<dt>
									<a onclick="fixedPriceClick()"><strong
										class="uk-text-danger">Fixed</strong></a><span
										class="uk-badge pull-right">${fixedPrice.size()}</span>
								</dt>

							</dl>
						</div>
					</div>
				</div>
				<div class="uk-width-3-4">
					<h2 id="daily-header" style="display: none;">Daily Auction</h2>
					<h2 id="weekly-header" style="display: none;">Weekly Auction</h2>
					<h2 id="weekly+-header" style="display: none;">Weekly Plus
						Auction</h2>
					<h2 id="fixed-header" style="display: none;">Fixed Price
						Auction</h2>

					<ul uk-tab id="tabs">
						<li class="uk-active"><a onclick="trendingClicked()">Trending</a></li>
						<li><a onclick="endingSoonClicked()">Ending Soon</a></li>
						<li><a onclick="recentlyAddedClicked()">Recently Added</a></li>
					</ul>


					<div id="trending-listings" style="display: inline">
						<div class="uk-child-width-1-3@m uk-grid-small uk-text-center"
							uk-grid>
							<c:forEach var="listing" items="${trendingListings}">
								<%@include file="jspf/index-listing.jsp"%>
							</c:forEach>
						</div>
					</div>
					<div id="ending-soon-listings" style="display: none">
						<div class="uk-child-width-1-3@m uk-grid-small uk-text-center"
							uk-grid>
							<c:forEach var="listing" items="${endingSoonListings}">
								<%@include file="jspf/index-listing.jsp"%>
							</c:forEach>
						</div>
					</div>
					<div id="recently-added-listings" style="display: none">
						<div class="uk-child-width-1-3@m uk-grid-small uk-text-center"
							uk-grid>
							<c:forEach var="listing" items="${recentListings}">
								<%@include file="jspf/index-listing.jsp"%>
							</c:forEach>
						</div>
					</div>
					<div id="daily-bids" style="display: none">
						<div class="uk-child-width-1-3@m uk-grid-small uk-text-center"
							uk-grid>
							<c:forEach var="listing" items="${dailyBids}">
								<%@include file="jspf/index-listing.jsp"%>
							</c:forEach>
						</div>
					</div>
					<div id="weekly-bids" style="display: none">
						<div class="uk-child-width-1-3@m uk-grid-small uk-text-center"
							uk-grid>
							<c:forEach var="listing" items="${weeklyBids}">
								<%@include file="jspf/index-listing.jsp"%>
							</c:forEach>
						</div>
					</div>
					<div id="weekly+-bids" style="display: none">
						<div class="uk-child-width-1-3@m uk-grid-small uk-text-center"
							uk-grid>
							<c:forEach var="listing" items="${weeklyPlus}">
								<%@include file="jspf/index-listing.jsp"%>
							</c:forEach>
						</div>
					</div>
					<div id="fixed-price" style="display: none">
						<div class="uk-child-width-1-3@m uk-grid-small uk-text-center"
							uk-grid>
							<c:forEach var="listing" items="${fixedPrice}">
								<%@include file="jspf/index-listing.jsp"%>
							</c:forEach>
						</div>
					</div>

				</div>
				6y
			</div>
		</div>
	</div>
	<%@include file="jspf/footer.jspf"%>
	<script>
	function trendingClicked() {
		document.getElementById('trending-listings').style.display = 'inline';
		document.getElementById('ending-soon-listings').style.display = 'none';
		document.getElementById('recently-added-listings').style.display = 'none';
		document.getElementById('daily-bids').style.display = 'none';
		document.getElementById('weekly-bids').style.display = 'none';
		document.getElementById('daily-header').style.display = 'none';
		document.getElementById('weekly-header').style.display = 'none';
		document.getElementById('fixed-header').style.display = 'none';
		document.getElementById('weekly+-header').style.display = 'none';
	}

	function endingSoonClicked() {
		document.getElementById('trending-listings').style.display = 'none';
		document.getElementById('ending-soon-listings').style.display = 'inline';
		document.getElementById('recently-added-listings').style.display = 'none';
		document.getElementById('daily-bids').style.display = 'none';
		document.getElementById('fixed-price').style.display = 'none';
		document.getElementById('weekly+-bids').style.display = 'none';
		document.getElementById('weekly-bids').style.display = 'none';
		document.getElementById('fixed-header').style.display = 'none';
		document.getElementById('weekly+-header').style.display = 'none';
	}

	function recentlyAddedClicked() {
		document.getElementById('trending-listings').style.display = 'none';
		document.getElementById('ending-soon-listings').style.display = 'none';
		document.getElementById('recently-added-listings').style.display = 'inline';
		document.getElementById('daily-bids').style.display = 'none';
		document.getElementById('fixed-price').style.display = 'none';
		document.getElementById('weekly+-bids').style.display = 'none';
		document.getElementById('weekly-bids').style.display = 'none';
		document.getElementById('daily-header').style.display = 'none';
		document.getElementById('weekly-header').style.display = 'none';
		document.getElementById('fixed-header').style.display = 'none';
		document.getElementById('weekly+-header').style.display = 'none';

	}

	function dailyBidClicked() {
		document.getElementById('trending-listings').style.display = 'none';
		document.getElementById('ending-soon-listings').style.display = 'none';
		document.getElementById('recently-added-listings').style.display = 'none';
		document.getElementById('daily-bids').style.display = 'inline';
		document.getElementById('weekly-bids').style.display = 'none';
		document.getElementById('fixed-price').style.display = 'none';
		document.getElementById('weekly+-bids').style.display = 'none';
		document.getElementById('tabs').style.display = 'none';
		document.getElementById('weekly-header').style.display = 'none';
		document.getElementById('daily-header').style.display = 'inline';
		document.getElementById('fixed-header').style.display = 'none';
		document.getElementById('weekly+-header').style.display = 'none';

	}
	function weeklyBidClicked() {
		document.getElementById('trending-listings').style.display = 'none';
		document.getElementById('ending-soon-listings').style.display = 'none';
		document.getElementById('recently-added-listings').style.display = 'none';
		document.getElementById('daily-bids').style.display = 'none';
		document.getElementById('weekly-bids').style.display = 'inline';
		document.getElementById('fixed-price').style.display = 'none';
		document.getElementById('weekly+-bids').style.display = 'none';
		document.getElementById('tabs').style.display = 'none';
		document.getElementById('daily-header').style.display = 'none';
		document.getElementById('weekly-header').style.display = 'inline';
		document.getElementById('fixed-header').style.display = 'none';
		document.getElementById('weekly+-header').style.display = 'none';

	}
	function beyondWeekClick() {
		document.getElementById('trending-listings').style.display = 'none';
		document.getElementById('ending-soon-listings').style.display = 'none';
		document.getElementById('recently-added-listings').style.display = 'none';
		document.getElementById('daily-bids').style.display = 'none';
		document.getElementById('weekly-bids').style.display = 'none';
		document.getElementById('weekly+-bids').style.display = 'inline';
		document.getElementById('fixed-price').style.display = 'none';
		document.getElementById('tabs').style.display = 'none';
		document.getElementById('daily-header').style.display = 'none';
		document.getElementById('weekly-header').style.display = 'none';
		document.getElementById('fixed-header').style.display = 'none';
		document.getElementById('weekly+-header').style.display = 'inline';
	}

	function fixedPriceClick() {
		document.getElementById('trending-listings').style.display = 'none';
		document.getElementById('ending-soon-listings').style.display = 'none';
		document.getElementById('recently-added-listings').style.display = 'none';
		document.getElementById('daily-bids').style.display = 'none';
		document.getElementById('weekly-bids').style.display = 'none';
		document.getElementById('fixed-price').style.display = 'inline';
		document.getElementById('weekly+-bids').style.display = 'none';
		document.getElementById('tabs').style.display = 'none';
		document.getElementById('daily-header').style.display = 'none';
		document.getElementById('weekly-header').style.display = 'none';
		document.getElementById('fixed-header').style.display = 'inline';
		document.getElementById('weekly+-header').style.display = 'none';
	}
		function dismiss(notificationID) {
			$.ajax({
				type : 'GET',
				url : '/dismiss',
				data : {
					n : notificationID
				},
			})
			document.getElementById('notification' + notificationID).style.display = "none";
		}

		$('#notificationDrop').on("hide", function() {
			$.ajax({
				type : 'GET',
				url : '/markAsViewed',
			})

			document.getElementById('badge1').style.visibility = "hidden";

			var spans = document.getElementsByTagName('span');

			for (var i = 0; i < spans.length; i++) {
				var spanClass = spans[i].getAttribute("class");
				if (spans[i].getAttribute("class") === "badge2") {
					spans[i].style.display = "none";
				}
			}
		})
		
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
	</script>
</body>
</html>