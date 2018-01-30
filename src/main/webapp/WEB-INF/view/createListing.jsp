<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CreateListing</title>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	<div class="container">
		<c:if test="${message != null}">
			<div class="alert alert-success" role="alert">
				<h2>${message}</h2>
			</div>
		</c:if>
		<c:if test="${error != null}">
			<div class="alert alert-danger" role="alert">
				<h2>${error}</h2>
			</div>
		</c:if>
	</div>

	<div class="container">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="form-area">
				<form method="POST" action="uploadListing"
					enctype="multipart/form-data">
					<br style="clear: both">
					<h3 style="margin-bottom: 25px; text-align: center;">Create A
						Listing</h3>
					<div class="form-group">
						<strong>Title of Product</strong> <input type="text"
							class="form-control" id="title" name="title" placeholder="Title"
							required>
					</div>
					<div class="form-group">
						<strong>File to upload:</strong> <input type="file" name="file">
					</div>
					<div class="form-group">
						<strong>Category</strong><select id="category" name="category"
							class="form-control" required>
							<option value="furnature">Furnature</option>
							<option value="books">Books</option>
							<option value="supplies">School Supples</option>
						</select>
					</div>
					<div class="form-group">
						<strong>Price</strong><input type="number" class="form-control"
							id="price" name="price" placeholder="Price" required>
					</div>

					<div class="form-group">
						<strong> Description </strong>
						<textarea class="form-control" type="textarea" name="description"
							id="message" placeholder="Description" maxlength="140" rows="7"></textarea>
						<span class="help-block"><p id="characterLeft"
								class="help-block "></span>
					</div>

					<button type="submit" id="submit" name="submit"
						class="btn btn-primary pull-right">Submit Form</button>
				</form>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		$(".alert-success").fadeTo(2000, 500).slideUp(500, function() {
			$("#success-alert").slideUp(500);
		});
	});
	$(document).ready(function() {
		$(".alert-danger").fadeTo(2000, 500).slideUp(500, function() {
			$(".alert-danger").slideUp(500);
		});
	});
</script>
</html>