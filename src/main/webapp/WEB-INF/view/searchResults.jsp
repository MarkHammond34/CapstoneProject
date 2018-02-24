<%@include file="jspf/header.jsp"%>

<body>

	<%@include file="jspf/navbar.jspf"%>

	<div id="listingResults" style="display: inline">
		<div class="uk-container">
			<div style="float: left;">
				<h1>Results</h1>
				<div>

					<div class="uk-text-large"
						style="float: left; padding-top: 5px; padding-bottom: 10px; text-align: center;">
						<strong class="uk-text-danger">${listingSearch.size()}</strong>
						results were found for the search for <strong
							class="uk-text-danger">${search}</strong>
					</div>

					<c:if test="${listingSearch.size() == 0 }">
						<div
							style="float: right; padding-left: 50px; padding-bottom: 10px;">

							<form onclick="postValue()">
								<input name="search" type="hidden" id="searchId"
									value="${search}">
								<c:choose>

									<c:when test="${saved == 'saved'}">
										<label style="padding-top: 10px;"> <input
											class="uk-checkbox" type="checkbox" checked> <span
											class="uk-text-warning" style="position: relative; top: 3px;">
												Save Search</span>
										</label>
									</c:when>

									<c:otherwise>
										<label style="padding-top: 10px;"> <input
											class="uk-checkbox" type="checkbox"> <span
											class="uk-text-warning" style="position: relative; top: 3px;">
												Save Search</span>
										</label>
									</c:otherwise>

								</c:choose>
							</form>

						</div>
					</c:if>
				</div>
			</div>

			<div style="float: right; padding-bottom: 10px;">
				<div class="uk-container">
					<div style="padding-top: 80px; float: left;">
						<div class="uk-margin uk-grid-small uk-child-width-auto uk-grid"
							id="options">
							<label><input class="uk-radio" id="listing" type="radio"
								name="radio2" onclick="toggle()" checked><span
								class="uk-text-warning" style="position: relative; top: 3px;">
									Listings</span></label> <label><input class="uk-radio" type="radio"
								name="radio2" id="user" onclick="toggle()"><span
								class="uk-text-warning" style="position: relative; top: 3px;">
									Users</span></label>
						</div>
					</div>
					<form method="POST" class="uk-grid-large"
						action="sortSearchListings" name="sortSearchListings" uk-grid>
						<div style="padding-top: 55px; float: right;">
							<strong>Sort</strong><select id="sort" name="sort"
								class="uk-select" onchange="changeListing(this);">
								<option value="all" selected>All</option>
								<option value="soonest">Bids Ending Soonest</option>
								<option value="latest">Bids Ending Latest</option>
								<option value="high">Price: High to Low</option>
								<option value="low">Price: Low to High</option>
							</select>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="uk-container">
			<hr>

			<div class="uk-section uk-section-">
				<div class="uk-grid">
					<div class="uk-width-1-1">
						<div id="allListings" style="display: inline">
							<div class="uk-container uk-container-small">
								<div class="uk-grid-large uk-child-width-1-3 uk-text-center"
									uk-grid>
									<c:forEach var="listing" items="${listingSearch}">
										<%@include file="jspf/index-listing.jsp"%>
									</c:forEach>
								</div>
							</div>
						</div>
						<div id="soonestListings" style="display: none">
							<div class="uk-container uk-container-small">
								<div class="uk-grid-large uk-child-width-1-3 uk-text-center"
									uk-grid>
									<c:forEach var="listing" items="${endingSoonest}">
										<%@include file="jspf/index-listing.jsp"%>
									</c:forEach>
								</div>
							</div>
						</div>
						<div id="latestListings" style="display: none">
							<div class="uk-container uk-container-small">
								<div class="uk-grid-large uk-child-width-1-3 uk-text-center"
									uk-grid>
									<c:forEach var="listing" items="${endingLatest}">
										<%@include file="jspf/index-listing.jsp"%>
									</c:forEach>
								</div>
							</div>
						</div>
						<div id="mostExpensiveListings" style="display: none">
							<div class="uk-container uk-container-small">
								<div class="uk-grid-large uk-child-width-1-3 uk-text-center"
									uk-grid>
									<c:forEach var="listing" items="${mostExpensive}">
										<%@include file="jspf/index-listing.jsp"%>
									</c:forEach>
								</div>
							</div>
						</div>
						<div id="leastExpensiveListings" style="display: none">
							<div class="uk-container uk-container-small">
								<div class="uk-grid-large uk-child-width-1-3 uk-text-center"
									uk-grid>
									<c:forEach var="listing" items="${leastExpensive}">
										<%@include file="jspf/index-listing.jsp"%>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="userResults" style="display: none;">
		<div class="uk-container">
			<div style="float: left;">
				<h1>Results</h1>
				<div>
					<div class="uk-text-large"
						style="float: left; padding-top: 5px; padding-bottom: 10px; text-align: center;">
						<strong class="uk-text-danger">${userSearch.size()}</strong>
						results were found for the search for <strong
							class="uk-text-danger">${search}</strong>
					</div>

					<c:if test="${userSearch.size() == 0 }">
						<div
							style="float: right; padding-left: 50px; padding-bottom: 10px;">

							<form onclick="postValue()">
								<input name="search" type="hidden" id="searchId"
									value="${search}">
								<c:choose>

									<c:when test="${saved == 'saved'}">
										<label style="padding-top: 10px;"> <input
											class="uk-checkbox" type="checkbox" checked> <span
											class="uk-text-warning" style="position: relative; top: 3px;">
												Save Search</span>
										</label>
									</c:when>

									<c:otherwise>
										<label style="padding-top: 10px;"> <input
											class="uk-checkbox" type="checkbox"> <span
											class="uk-text-warning" style="position: relative; top: 3px;">
												Save Search</span>
										</label>
									</c:otherwise>

								</c:choose>
							</form>

						</div>
					</c:if>
				</div>
			</div>

			<div style="float: right; padding-bottom: 10px;">
				<div class="uk-container">
					<div style="padding-top: 80px; float: left;">
						<div class="uk-margin uk-grid-small uk-child-width-auto uk-grid"
							id="options">
							<label><input class="uk-radio" id="listing" type="radio"
								name="radio2" onclick="toggle()"><span
								class="uk-text-warning" style="position: relative; top: 3px;">
									Listings</span></label> <label><input class="uk-radio" type="radio"
								name="radio2" id="user" onclick="toggle()" checked><span
								class="uk-text-warning" style="position: relative; top: 3px;">
									Users</span></label>
						</div>
					</div>
					<form method="POST" class="uk-grid-large"
						action="sortSearchListings" name="sortSearchListings" uk-grid>
						<div style="padding-top: 55px; float: right;">
							<strong>Sort</strong><select id="sort" name="sort"
								class="uk-select" onchange="changeListing(this);">
								<option value="all" selected>All</option>
								<option value="soonest">Soonest</option>
								<option value="latest">Bids Ending Latest</option>
								<option value="high">Price: High to Low</option>
								<option value="low">Price: Low to High</option>
							</select>
						</div>
					</form>
				</div>
			</div>
		</div>
		<hr>
	</div>

	<script type="text/javascript">
		function postValue() {
			var saved = document.getElementById('searchId').value;
			$.ajax({
				type : 'GET',
				url : 'saveSearch',
				data : {
					search : saved
				}
			});
		}

		function changeListing(list) {
			if (list.value == "soonest") {
				document.getElementById('allListings').style.display = 'none';
				document.getElementById('soonestListings').style.display = 'inline';
				document.getElementById('latestListings').style.display = 'none';
				document.getElementById('mostExpensiveListings').style.display = 'none';
				document.getElementById('leastExpensiveListings').style.display = 'none';
			} else if (list.value == "latest") {
				document.getElementById('allListings').style.display = 'none';
				document.getElementById('soonestListings').style.display = 'none';
				document.getElementById('latestListings').style.display = 'inline';
				document.getElementById('mostExpensiveListings').style.display = 'none';
				document.getElementById('leastExpensiveListings').style.display = 'none';
			} else if (list.value == "all") {
				document.getElementById('allListings').style.display = 'inline';
				document.getElementById('soonestListings').style.display = 'none';
				document.getElementById('latestListings').style.display = 'none';
				document.getElementById('mostExpensiveListings').style.display = 'none';
				document.getElementById('leastExpensiveListings').style.display = 'none';
			} else if (list.value == "high") {
				document.getElementById('allListings').style.display = 'none';
				document.getElementById('soonestListings').style.display = 'none';
				document.getElementById('latestListings').style.display = 'none';
				document.getElementById('mostExpensiveListings').style.display = 'inline';
				document.getElementById('leastExpensiveListings').style.display = 'none';
			} else if (list.value == "low") {
				document.getElementById('allListings').style.display = 'none';
				document.getElementById('soonestListings').style.display = 'none';
				document.getElementById('latestListings').style.display = 'none';
				document.getElementById('mostExpensiveListings').style.display = 'none';
				document.getElementById('leastExpensiveListings').style.display = 'inline';
			}
		}

		function toggle() {
			if (document.getElementById('listing').checked) {
				document.getElementById('listingResults').style.display = 'inline';
				document.getElementById('userResults').style.display = 'none';
			} else if (document.getElementById('user').checked) {
				document.getElementById('listingResults').style.display = 'none';
				document.getElementById('userResults').style.display = 'inline';
			}
		}
	</script>
</body>
</html>