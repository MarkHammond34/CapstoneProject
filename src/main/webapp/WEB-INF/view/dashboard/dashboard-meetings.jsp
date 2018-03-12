<div class="uk-background-secondary" uk-height-viewport="min-height:300">
	<div
		class="uk-grid-small uk-child-width-1-2@m uk-child-width-1-3@l uk-padding-small"
		uk-grid="">
		<c:forEach var="listing" items="${listings}">
			<div>
				<div class="uk-card uk-card-small uk-card-default uk-border-rounded">
					<div class="uk-card-header">
						<h3 class="uk-card-title  uk-text-center">Meet-ups</h3>
						<div class="uk-inline">
							<button class="uk-button uk-button-default" type="button">Sort by:</button>
							<div uk-dropdown="mode: click">
								<ul class="uk-nav uk-dropdown-nav">
									<li class="uk-active"><a href="#">Active</a></li>
									<li><a href="#">Active</a></li>
									<li><a href="#">Completed</a></li>
									<li><a href="#">Most Recent</a></li>
									<li><a href="#">Oldest</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="uk-card-body">
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
		</c:forEach>
	</div>
</div>