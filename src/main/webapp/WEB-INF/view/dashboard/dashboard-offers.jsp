<div id="off-card" class="uk-card uk-card-small uk-card-default uk-border-rounded uk-padding-large uk-position-relative">
	<h3 class="uk-card-title">Offers</h3>
	<div class="uk-overflow-auto">
		<table
			class="uk-table uk-table-hover uk-table-middle uk-table-divider">
			<tbody>
				<c:forEach var="offer" items="${offers}">
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

<!-- <div
	class="uk-panel uk-panel-scrollable uk-resize-vertical uk-height-large uk-padding-remove uk-background-secondary uk-border-rounded">
	<ul class="uk-nav uk-nav-default uk-child-width-1-3@m" uk-grid>
		<c:forEach var="listing" items="${listings}">
			<li class="uk-padding-small"><div class="uk-panel uk-width-auto">
					<a
						href="${pageContext.request.contextPath}/listing?listingId=${listing.id}"><img
						height="auto" width="85%"
						class="uk-border-rounded uk-box-shadow-hover-large"
						src="${pageContext.request.contextPath}/resources/img/listings/Wolverine.jpg"
						alt=""></a>
				</div></li>
		</c:forEach>
	</ul>
</div> -->