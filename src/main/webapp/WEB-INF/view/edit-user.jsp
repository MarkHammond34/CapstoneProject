<%@include file="jspf/header.jsp"%>

<body>
	<%@include file="jspf/footer.jspf"%>
	<%@include file="jspf/navbar.jspf"%>
	<div uk-grid>
		<div class="uk-width-1-4"></div>
		<div class="uk-width-1-2">
			<div class="uk-card uk-card-default uk-card-large uk-card-body">
				<h3 class="uk-card-title">Settings</h3>
				<hr>
				<form method="post" action="updateUser"
					onsubmit="return validateForm()" name="updateUser"
					enctype="multipart/form-data">
					<div uk-grid>
						<div class="uk-width-1-3"></div>
						<div class="uk-width-1-3">
							<div class="form-group">
								<strong>Change Profile Picture:</strong> <input type="file"
									name="file">
							</div>
						</div>

					</div>
					<div uk-grid>
						<div class="uk-width-1-3">
							<strong>Username:</strong> <input type="text" class="uk-input"
								id="username" name="username" placeholder="Username" required>
						</div>
						<div class="uk-width-1-3">
							<strong>First Name:</strong> <input type="text" class="uk-input"
								id="firstName" name="firstName" placeholder="First Name"
								required>
						</div>
						<div class="uk-width-1-3">
							<strong>Last Name: </strong> <input type="text" class="uk-input"
								id="last Name" name="lastName" placeholder="Last Name" required>
						</div>
					</div>
					<div uk-grid>
						<div class="uk-width-1-2">
							<strong>E-Mail:</strong> <input type="email" class="uk-input"
								id="email" name="email" placeholder="E-Mail" required>
						</div>
						<div class="uk-width-1-2">
							<strong>Phone Number</strong> <input type="text" class="uk-input"
								id="phoneNumber" name="phoneNumber" placeholder="Phone Number"
								required>
						</div>
					</div>
					<div uk-grid>
						<div class="uk-width-1-2">
							<strong>Password:</strong> <input type="password"
								class="uk-input" id="password" name="password" required>
						</div>
						<div class="uk-width-1-2">
							<strong>Confirm Password:</strong> <input type="password"
								class="uk-input" id="confirmPassword" name="confirmPassword"
								required>
						</div>
					</div>
					<button class="uk-button uk-button-danger" type="submit">Update</button>

					<div class="uk-width-1-2"></div>
				</form>
			</div>
		</div>
		<div class="uk-width-1-4"></div>
	</div>
	<script type="text/javascript">
		function validateForm() {
			var file = document.forms["updateUser"]["file"].value;
			var fileArray = file.split(".");
			var extension = fileArray[1];
			
			var firstName = document.forms["updateUser"]["firstName"].value;
			var lastName = document.forms["updateUser"]["lastName"].value;
			var username = document.forms["updateUser"]["username"].value;
			
			var password = document.forms["updateUser"]["password"].value;
			var confirm = document.forms["updateUser"]["confirmPassword"].value;
			
			var email = document.forms["updateUser"]["email"].value;
			
			var phoneNumber = document.forms["updateUser"]["phoneNumber"].value;
			
			
			
			if (extension != "jpeg" && extension != "png" && extension != "jpg") {
				alert.("You must upload an image file.");
				return false;
			} else if ( /\d/.test(firstName) == true) {
				alert.("First Name cannot have letters");
				return false;
			}
		}
	</script>
</body>
</html>