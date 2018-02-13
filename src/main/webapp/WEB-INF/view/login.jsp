<%@include file="jspf/header.jsp"%>

<body>

	<%@include file="jspf/navbar.jspf"%>

	<div style="margin: 2% 33% 5% 33%; margin-top: 5%">

		<%@include file="jspf/messages.jsp"%>
		<%@include file="jspf/footer.jspf"%>

		<form class="form-horizontal blacktext" action="loginUser"
			method="post">
			<div class="form-group">
				<label for="inputEmail" class="col-lg-10 blacktext">Email</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="email"
						value="${email}" placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-lg-10  blacktext">Password</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" name="password"
						placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-1.5">
					<button type="submit" class="btn btn-default">Login</button>
					<a href="/reset" class="btn btn-default">Forgot Password</a> <a
						href="email" class="btn btn-default">Unlock</a>
				</div>
			</div>
			<div class="form-group blacktext">
				<p style="text-align: center" class="blacktext">${message}</p>
			</div>
		</form>
	</div>
</body>
</html>