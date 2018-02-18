<%@include file="jspf/header.jsp"%>
<body>

	<%@include file="jspf/navbar.jspf"%>

	<div style="background-color: #f2f2f2;">

		<div class="uk-section">

			<div class="uk-container uk-container-small">

				<div class="uk-position-relative uk-margin-medium">

					<div class="uk-position-relative" uk-slideshow="animation: fade">

						<ul class="uk-slideshow-items">
							<li><img class="uk-thumbnail uk-thumbnail-medium"
								src="${pageContext.request.contextPath}/resources/img/listings/Wolverine.jpg"
								alt="" uk-cover></li>
							<li><img class="uk-thumbnail uk-thumbnail-medium"
								src="${pageContext.request.contextPath}/resources/img/listings/Cat.jpg"
								alt="" uk-cover></li>
							<li><img class="uk-thumbnail uk-thumbnail-medium"
								src="${pageContext.request.contextPath}/resources/img/listings/Wolverine.jpg"
								alt="" uk-cover></li>
						</ul>

						<div class="uk-position-bottom-center uk-position-small">
							<ul class="uk-thumbnav">
								<li uk-slideshow-item="0"><a href="#"><img class="uk-thumbnail"
										src="${pageContext.request.contextPath}/resources/img/listings/Wolverine.jpg"
										width="100" alt=""></a></li>
								<li uk-slideshow-item="1"><a href="#"><img class="uk-thumbnail"
										src="${pageContext.request.contextPath}/resources/img/listings/Cat.jpg"
										width="100" alt=""></a></li>
								<li uk-slideshow-item="2"><a href="#"><img class="uk-thumbnail"
										src="${pageContext.request.contextPath}/resources/img/listings/Wolverine.jpg"
										width="100" alt=""></a></li>
							</ul>
						</div>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>
<%@include file="jspf/footer.jspf"%>
</html>