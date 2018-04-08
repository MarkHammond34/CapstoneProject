<%@include file="jspf/header.jsp"%>
<body>
	<%@include file="jspf/navbar.jspf"%>
	<br>
	<br>
	<br>
	<div
		class="uk-container uk-container-center uk-margin-top uk-margin-large-bottom">


		<div class="uk-grid" data-uk-grid-margin>
			<div class="uk-width-3-4">
				<c:if test="${header != null }">
					<div class="uk-text-center uk-text-capitalize uk-text-bold uk-text-large">
						<p style="font-size: 350%;">${requestScope.header.getText()}</p>
					</div>
					<hr>
				</c:if>
				<div class="uk-panel">
				<img class="uk-align-left uk-margin-remove-adjacent" src="<%=request.getContextPath()%>/resources/img/profile-pic/default.jpeg" width="225" height="150" alt="Example image">
				<c:forEach var="paragraph" items="${paragraphList}">
					<p>${paragraph.getText()}</p>
				</c:forEach>
				</div>
			</div>
			<div class="uk-width-1-4"></div>
		</div>
	</div>
</body>
</html>