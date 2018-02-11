<%@include file="jspf/header.jsp"%>

<body>
	<%@include file="jspf/navbar.jspf"%>
	<div uk-grid>
		<div class="uk-width-1-4"></div>
		<div class="uk-width-1-2">
			<div class="uk-card uk-card-default uk-card-large uk-card-body">
				<h3 class="uk-card-title">Settings</h3>
				<hr>
				<form method="post" action="uploadProfilePic" name="profilePic"
					enctype="multipart/form-data">
					<div class="form-group">
						<strong>Edit Image:</strong> <input type="file" name="file">
					</div>
					<div>
						<button class="uk-button uk-button-danger" type="submit">Submit</button>
					</div>
				</form>
			</div>
		</div>
		<div class="uk-width-1-4"></div>
	</div>
</body>
</html>