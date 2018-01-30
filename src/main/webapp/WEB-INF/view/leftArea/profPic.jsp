<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ page import="edu.ben.model.User"%>
<%@ page session="true"%>


<div class="panel panel-default panel-profile m-b-md">
	<div class="panel-heading"
		style="background-image: url(assets/img/iceland.jpg);"></div>
	<div class="panel-body text-center">

		<%
 		User currentUser = (User) request.getSession().getAttribute("currentUser");
		String newPath = currentUser.getAvatarPath();
 		%>
		<!-- Profile Picture -->
		<a data-toggle="modal" data-target="#changeAvi"> <img
			class="panel-profile-img" src=<%=newPath%> style="cursor:pointer; text-decoration:none;">

		</a>
		<!-- end of Prof Pic -->
		
		<br />
		<h5 class="panel-title">
		<br />
			 <%
 	out.print(currentUser.getFirstName() + " " + currentUser.getLastName());
 %>	
		</h5>
		<br />
		<button type="button" class="btn btn-primary btn-md"
			data-toggle="modal" data-target="#changeAvi">Change Avatar</button>

		<p class="m-b-md"></p>

	</div>
</div>