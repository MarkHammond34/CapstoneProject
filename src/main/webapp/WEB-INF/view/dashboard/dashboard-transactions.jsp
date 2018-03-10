<div class="uk-card uk-card-small uk-card-default uk-border-rounded uk-padding-large">
	<h3 class="uk-card-title">Transactions</h3>
	<div class="uk-overflow-auto">
		<table
			class="uk-table uk-table-hover uk-table-middle uk-table-divider">
			<tbody>
				<c:forEach var="transaction" items="${transactions}">
					<tr>
						<td><img class="uk-preserve-width uk-border-circle"
							uk-tooltip="${offer.userID.username}"
							src="${pageContext.request.contextPath}/resources/img/profile-pic/${offer.userID.image_path}"
							height="auto" width="40" alt=""></td>
						<c:if
							test="${offer.offerMessage != null && offer.offerMessage.length() > 0}">
							<td class="uk-table-link">${offer.offerMessage}</td>
						</c:if>
						<td class="uk-text-truncate">${offer.offerAmount}</td>
						<td class="uk-text-nowrap">${offer.status}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>