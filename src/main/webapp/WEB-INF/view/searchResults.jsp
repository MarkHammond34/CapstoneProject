<%@include file="jspf/header.jsp"%>

<body>

	<%@include file="jspf/navbar.jspf"%>


	<c:if test="${categoryListing != null}">
		<div class="uk-container">

			<h1>Results</h1>
			<h2 class="lead">
				<strong class="text-danger">${categoryListing.size()}</strong>
				results were found for the search for <strong class="text-danger">${search}</strong>
			</h2>
			<hr>

			<c:forEach var="listings" items="${categoryListing}">


			</c:forEach>


		</div>
	</c:if>
	<c:if test="${userSearch != null}">
		<div class="uk-container">
			<h1>Results</h1>
			<h2 class="lead">
				<strong class="text-danger">${userSearch.size()}</strong> results
				were found for the search for <strong class="text-danger">${search}</strong>
			</h2>
			<hr>
			<c:forEach var="users" items="${userSearch}">
				<figure>
					<img class="uk-border-circle"
						src="<%=request.getContextPath()%>/resources/img/profile-pic/${user.image_path}"
						width="200" height="200" alt="Border circle">
					<figcaption>${user.username}</figcaption>
				</figure>
			</c:forEach>
		</div>
	</c:if>

</body>
</html>