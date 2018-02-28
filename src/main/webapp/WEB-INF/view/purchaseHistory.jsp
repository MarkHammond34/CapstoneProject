<%@include file="jspf/header.jsp"%>

<body class="uk-background-muted">
	<%@include file="jspf/navbar.jspf"%>

	<div id="central" class="uk-width-4-5 uk-align-center">
		<h1>Your Purchase History</h1>
		<p></p>


		<p></p>
		<!-- <div class="uk-grid-large uk-text-center"> -->
			<table class="uk-table uk-table-hover">
				<thead>
					<tr>
						<th>Name</th>
						<th>Description</th>
						<th>Category</th>
						<th>Price</th>
						<th>Purchase Date</th>
						<th>Seller</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="transaction" items="${userTransactions}">
						<tr>
							<td>${transaction.listingID.name}</td>
							<td>${transaction.listingID.description}</td>
							<td>${transaction.listingID.category}</td>
							<td>${transaction.listingID.price}</td>
							<td>${transaction.listingID.dateCreated}</td>
							<td>${transaction.seller.username}</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>

		</div>
	<!-- </div> -->

</body>
<%@include file="jspf/footer.jspf"%>

</html>
