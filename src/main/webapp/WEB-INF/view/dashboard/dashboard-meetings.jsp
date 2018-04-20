<div>
	<div class="uk-card uk-card-small uk-card-default uk-border-rounded">
		<%@include file="tableHeaders/meeting-table-header.jsp" %>
		<div class="uk-card-body">
			<div class="uk-overflow-auto">
				<table
						class="uk-table uk-table-hover uk-table-middle uk-table-divider">
                    <thead>
                    <tr>
                        <th>User</th>
                        <th>Time</th>
                        <th>Location</th>
                        <th>Status</th>
                    </tr>
                    </thead>
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
                            <td class="uk-preserve-width uk-table-link"><a class="uk-link-reset"
                                                                           uk-toggle="target: #pickUp${pickup.pickUpID}">${pickup.location.name}</a>
                            </td>
							<td class="uk-text-nowrap">${pickup.status}</td>
                            <td class="uk-text-nowrap">
                                <div class="uk-text-right uk-float-right uk-flex-right"
                                     uk-tooltip="title: More info">
                                    <i class="fas fa-ellipsis-v"></i>
                                </div>
                            </td>
						</tr>
                        <%@include file="tableModals/pickUp-details-modal.jsp" %>
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