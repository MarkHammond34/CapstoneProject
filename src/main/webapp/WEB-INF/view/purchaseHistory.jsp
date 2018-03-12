<%@include file="jspf/header.jsp"%>



<body class="uk-background-muted">
	<%@include file="jspf/navbar.jspf"%>

	<%@include file="jspf/messages.jsp"%>

	<div id="central" class="uk-width-4-5 uk-align-center">
		<h2>
			<strong class="uk-text-danger"> ${user.username}</strong> has made <strong
				class="uk-text-danger"> ${userTransactions.size()}</strong>
			purchase(s)
		</h2>
		<p></p>
		<p></p>


		<p></p>
		<!-- <div class="uk-grid-large uk-text-center"> -->
		<table
			class="uk-table uk-table-hover uk-table-striped uk-table-condensed">
			<thead>
				<tr>
					<th>Item Name</th>
					<th>Item Description</th>
					<th>Category</th>
					<th>Price</th>
					<th>Purchase Date</th>
					<th>Seller</th>
					<th>Transaction Rating</th>
					<th>Transaction Review</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="transaction" items="${userTransactions}">
					<tr>
						<c:choose>
							<c:when test="${transaction.feedbackLeft < 1}">
								<td>${transaction.listingID.name}</td>
								<td>${transaction.listingID.description}</td>
								<td>${transaction.listingID.category}</td>
								<td>${transaction.listingID.price}</td>
								<td>${transaction.listingID.dateCreated}</td>
								<td>${transaction.seller.username}</td>
								<c:choose>
									<c:when test="${transaction.transRating < 1}">
										<td></td>
									</c:when>
									<c:otherwise>
										<td>${transaction.transRating}</td>
									</c:otherwise>
								</c:choose>
								<td></td>
								<td>${transaction.transReview}</td>

								<td><a
									href="${pageContext.request.contextPath}/rateReview?id=${transaction.id}"
									class="btn btn-default">Leave Feedback</a></td>

							</c:when>
							<c:otherwise>
								<td>${transaction.listingID.name}</td>
								<td>${transaction.listingID.description}</td>
								<td>${transaction.listingID.category}</td>
								<td>${transaction.listingID.price}</td>
								<td>${transaction.listingID.dateCreated}</td>
								<td>${transaction.seller.username}</td>
								<td>${transaction.transRating}</td>
								<td>${transaction.transReview}</td>
							</c:otherwise>
						</c:choose>
					</tr>

				</c:forEach>
			</tbody>
		</table>

	</div>

</body>
<%@include file="jspf/footer.jspf"%>

</html>
