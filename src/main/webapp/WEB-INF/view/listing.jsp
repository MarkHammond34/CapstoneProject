<%@include file="jspf/header.jsp"%>
<%@ page import="edu.ben.model.Listing" %>
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
	padding-left: 4%;
}

img {
	max-width: 100%;
	height: auto;
	padding-bottom: 8%;
}
</style>

<body>

	<%@include file="jspf/navbar.jspf"%>

	<div style="background-color: #f2f2f2;">

		<div class="uk-section">
			<div style="background-color: #f2f2f2;">
				<div class="uk-container uk-container-large">
					<div style="background-color: #f2f2f2;">
						<div class="uk-card uk-card-default uk-grid-collapse uk-child-width-1-2@s uk-margin" id="grid"
							uk-grid>

							<div class="uk-card-media-left uk-cover-container">
								<img
									src="${pageContext.request.contextPath}/resources/img/listings/Wolverine.jpg"
									alt="" uk-cover>
								<canvas width="100%" height="auto"></canvas>
							</div>
							<div>
								<div class="uk-card-body">
									<article class="uk-article">
										
										<p class="uk-article-meta">
											Posted by <a href="viewProfile">${user.username}</a> on
											<%--${listing.dateCreated} --%> ${date}.
										</p>

										<h1 class="uk-article-title">
											<a class="uk-link-reset" href="">${listing.name}</a> <a
												class="uk-button uk-button-text" style="color: green;"
												href="${pageContext.request.contextPath}/button?listing=${listing.id}">Buy Now!</a>
										</h1>

										<p class="uk-text-lead">${listing.description}</p>

										<div class="uk-grid-small uk-child-width-auto" uk-grid>
											<div>${listing.price}0</div>
										</div>

									</article>

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="jspf/footer.jspf"%>
</html>