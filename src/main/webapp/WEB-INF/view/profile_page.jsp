<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="edu.ben.model.User"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<body class="with-top-navbar">

	<%@ include file="jspf/navbar.jspf"%>


	<div class="container p-t-md">
		<div class="row">

			<!-- This is the Left Side Bar -->
			<div class="col-md-3">


				<!-- This is the modal for when the Change Avatar button is clicked -->

				<%@ include file="leftArea/profPicModal.jsp"%>

				<!-- End of Modal -->
				
				<!-- This is the modal for when the Edit (about me) button is clicked -->

				<%@ include file="leftArea/aboutMeModal.jsp"%>

				<!-- End of Modal -->

				<%@ include file="leftArea/profPic.jsp"%>

				<%@ include file="leftArea/aboutMe.jsp"%>

				<!--  <%@ include file="leftArea/photoPreviews.jsp"%> -->
			</div>
			<!-- End of Left Side Bar -->


			<!-- This is where Posts appear -->
			<div class="col-md-9">
				<ul class="list-group media-list media-list-stream">
				</ul>
			</div>
			<!-- End of Posts -->




		</div>
	</div>


	<script src="assets/js/imgUpload.js"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/chart.js"></script>
	<script src="assets/js/toolkit.js"></script>
	<script src="assets/js/application.js"></script>

	<script>
		// execute/clear BS loaders for docs
		$(function() {
			if (window.BS && window.BS.loader && window.BS.loader.length) {
				while (BS.loader.length) {
					(BS.loader.pop())()
				}
			}
		})
	</script>
</body>
</html>