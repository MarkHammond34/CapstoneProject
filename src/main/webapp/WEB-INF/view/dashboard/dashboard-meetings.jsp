<div>
	<div class="uk-card uk-card-small uk-card-default uk-border-rounded">
		<%@include file="tableHeaders/meeting-table-header.jsp" %>
		<div class="uk-card-body">
			<div class="uk-overflow-auto">
				<table
						class="uk-table uk-table-hover uk-table-middle uk-table-divider">
					<tbody>
					<c:forEach var="pickup" items="${pickUps}">
						<tr>
							<td><img class="uk-preserve-width uk-border-circle"
							<c:if test="${user.userID == pickup.transaction.buyer.userID}">
									 uk-tooltip="${pickup.transaction.buyer.username}"
							</c:if>
							<c:if test="${user.userID == pickup.transaction.seller.userID}">
									 uk-tooltip="${pickup.transaction.seller.username}"
							</c:if>
									 src="${pageContext.request.contextPath}/resources/img/listings/default.jpeg"
									 height="auto" width="40" alt=""></td>
							<td class="uk-preserve-width">${pickup.pickUpTimestamp}</td>
							<td class="uk-preserve-width">${pickup.location.name}</td>
							<td class="uk-text-nowrap">${pickup.status}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>

    var sortedList = ${requestScope.offers};

    sortedList.sort;

</script>