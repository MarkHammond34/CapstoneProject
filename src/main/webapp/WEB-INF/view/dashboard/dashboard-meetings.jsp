<div>
	<div class="uk-card uk-card-small uk-card-default uk-border-rounded">
		<%@include file="tableHeaders/meeting-table-header.jsp"%>
		<div class="uk-card-body">
			<div class="uk-overflow-auto">
				<table
					class="uk-table uk-table-hover uk-table-middle uk-table-divider">
					<tbody>
						<c:forEach var="offer" items="${offers}">
							<tr>
								<td><img class="uk-preserve-width uk-border-circle"
									uk-tooltip="${offer.userID.username}"
									src="${pageContext.request.contextPath}/resources/img/profile-pic/${offer.userID.imagePath.image_path}"
									height="auto" width="40" alt=""></td>
								<c:if
									test="${offer.offerMessage != null && offer.offerMessage.length() > 0}">
									<td class="uk-preserve-width">${offer.offerMessage}</td>
								</c:if>
								<td class="uk-preserve-width">${offer.offerAmount}</td>
								<td class="uk-text-nowrap">${offer.status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
