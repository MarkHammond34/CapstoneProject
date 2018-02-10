<%@include file="jspf/header.jsp"%>
<style>
.uk-countdown-number {
	font-size: 18px;
}

.uk-countdown-label {
	font-size: 10px;
}

.uk-card-media-left img {
	max-height: 100%;
	max-width: 100%;
}

#grid {
	padding-top: 4%;
}
</style>
<%@include file="jspf/navbar.jspf"%>
<body class="uk-background-muted">

	<div class="uk-section">
		<div class="uk-container uk-container-large">
			<!-- For each start -->
			<c:forEach var="listing" items="${listings}">
				<div id="grid"
					class="uk-grid-medium uk-child-width-1-2@s uk-child-width-1-4@m uk-text-center"
					uk-grid>

					<div class="uk-card uk-card-default uk-card-body">
						<div>
							<img alt="Wolverine picture"
								src="${pageContext.request.contextPath}/resources/img/listings/Wolverine.jpg">
						</div>
						<div>
							<!-- Price -->
							<span>${listing.price}</span>

						</div>
					</div>

				</div>

				<!-- for each -->
			</c:forEach>
			<hr>
		</div>
	</div>
</body>
</html>