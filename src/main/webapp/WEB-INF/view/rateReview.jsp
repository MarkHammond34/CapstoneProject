<%@include file="jspf/header.jsp"%>

<body>
	<%@include file="jspf/navbar.jspf"%>
	
	<%@include file="jspf/messages.jsp"%>

	<div id="central">
		<div class="form">
			<h1>Review/Rating Form</h1>
			<p>Please leave a review for this seller. Leave a rating from 1
				to 5, 5 being the best experience.</p>
			<div id="form">
				<form id="form" name="rateReview" action="reviewRateSeller"
					class="uk-form" method="POST">
					<div class="uk-margin uk-position-center">
						<div class="uk-margin">
							<input class="uk-input" type="hidden" name="id"
								value="${id}">
						</div>
						<div class="uk-margin">
							<textarea class="uk-text-area" rows="5" cols="100"
								placeholder="Please leave your genuine, honest review here." name="transReview" required></textarea>
						</div>
						<div class="uk-margin">
							<input type="radio" name="transRating" value="1"> 1 <br>
							<input type="radio" name="transRating" value="2"> 2 <br><input
								type="radio" name="transRating" value="3"> 3<br><input
								type="radio" name="transRating" value="4"> 4<br><input
								type="radio" name="transRating" value="5" checked> 5
						</div>
						<input type="submit" name="submit"
							value="Leave Your Review" id="send-message"
							style="clear: both;">
						<%@include file="jspf/messages.jsp"%>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<%@include file="jspf/footer.jspf"%>
</html>