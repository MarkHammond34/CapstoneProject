<li>
    <div id="inactiveListings"
         class="uk-panel uk-panel-scrollable uk-resize-vertical uk-height-large uk-padding-remove uk-background-muted uk-border-rounded">
        <button class="sort" data-sort="timestamp">Sort date</button>
        <ul class="uk-nav uk-nav-default uk-child-width-1-3@m uk-grid list" uk-grid="">
            <c:forEach var="listing" items="${inactiveListings}">
                <li class="uk-padding-small">
                    <div
                            class="uk-panel">

                        <%@include file="../../listing/dashboard-listing.jsp" %>

                    </div>
                </li>

            </c:forEach>
        </ul>
    </div>
</li>