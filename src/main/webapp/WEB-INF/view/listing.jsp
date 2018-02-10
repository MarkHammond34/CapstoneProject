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

#center-card {
	position: relative;
}
</style>

<body>

	<%@include file="jspf/navbar.jspf"%>

	<div style="background-color: #f2f2f2;">

		<div class="uk-section">
			<div class="uk-container uk-container-large" id="center-card">
				<div class="uk-card uk-card-default uk-child-width-1-2" uk-grid>

					<div class="uk-card-media-left uk-cover-container">
						<img
							src="${pageContext.request.contextPath}/resources/img/listings/Wolverine.jpg"
							alt="" uk-cover>
						<canvas width="" height="500"></canvas>
					</div>
					<div>
						<div class="uk-card-body">
							<article class="uk-article">

								<h1 class="uk-article-title">
									<a class="uk-link-reset" href="">${listing.name}</a> <a>${listing.price}</a>
								</h1>

								<p class="uk-article-meta">
									Posted by <a href="#">${user.username}</a> on
									${user.dateCreated}.
								</p>

								<p class="uk-text-lead">${listing.description}</p>

								<div class="uk-grid-small uk-child-width-auto" uk-grid>
									<div>
										<a class="uk-button uk-button-text" href="#">Read more</a>
									</div>
									<div>
										<a class="uk-button uk-button-text" href="#">5 Comments</a>
									</div>
								</div>

							</article>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
<%@include file="jspf/footer.jspf"%>
</html>