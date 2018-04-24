<li>
    <div id="wonListings"
         class="uk-panel uk-panel-scrollable uk-resize-vertical uk-height-large uk-padding-remove uk-background-muted uk-border-rounded">
        <ul class="uk-nav uk-nav-default uk-child-width-1-4@m uk-grid-small uk-grid-match list" uk-grid>
            <c:forEach var="listing" items="${wonListings}">
                <li class="uk-padding-small">

                    <%@include file="../../listing/dashboard-listing.jsp" %>

                </li>
            </c:forEach>
        </ul>
    </div>
</li>
