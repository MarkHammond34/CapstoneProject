<%@ page import="edu.ben.model.User"%>
<!-- This is the Create New Post button -->

<%
	User user = (User) request.getSession().getAttribute("currentUser");
%>
<div class="panel panel-default visible-md-block visible-lg-block">
	<div class="panel-body">
	<h5 class="m-t-0">About <small>· <a data-toggle="modal" data-target="#aboutMe" style="cursor:pointer; text-decoration:none;">Edit</a></small></h5>
		<ul class="list-unstyled list-spaced">
			<li><span class="text-muted icon icon-home m-r"></span>Home
				City: <a href="#"><%=user.getHomeCity()%></a>
			<li><span class="text-muted icon icon-home m-r"></span>Home
				State: <a href="#"><%=user.getHomeState()%></a>
			<li><span class="text-muted icon icon-calendar m-r"></span>Year
				in Program: <a href="#"><%=user.getYearInProgram()%></a>
			<li><span class="text-muted icon icon-users m-r"></span>Hobby: <a href="#"><%=user.getHobby()%></a>
		</ul>
	</div>
</div>