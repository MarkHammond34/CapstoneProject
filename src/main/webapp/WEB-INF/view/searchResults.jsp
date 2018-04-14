<%@include file="jspf/header.jsp" %>

<body class="uk-background-muted">

<%@include file="jspf/navbar.jspf" %>

<div class="search-tutorial" id="listingResults">
    <div class="uk-container">
        <div style="float: left;">
            <h1>Results</h1>
            <div id="listingDisplay">
                <div class="uk-text-large"
                     style="float: left; padding-top: 5px; padding-bottom: 10px; text-align: center;">
                    <strong class="uk-text-danger">${listingSearch.size()}</strong>
                    results were found for the search for <strong
                        class="uk-text-danger">${search}</strong>
                </div>

                <c:if test="${listingSearch.size() == 0 }">
                    <div
                            style="float: right; padding-left: 50px; padding-bottom: 10px;">

                        <form onclick="postValue()">
                            <input name="search" type="hidden" id="searchId"
                                   value="${search}">
                            <c:choose>

                                <c:when test="${saved == 'saved'}">
                                    <label style="padding-top: 10px;"
                                           data-intro="Can't find what you're looking for? Save your search and you'll be
                                           notified if someone posts a listing similar to what you're looking for."
                                           data-step="1"> <input
                                            class="uk-checkbox" type="checkbox" checked> <span
                                            class="uk-text-warning" style="position: relative; top: 3px;">
												Save Search</span>
                                    </label>
                                </c:when>

                                <c:otherwise>
                                    <label style="padding-top: 10px;"
                                           data-intro="Can't find what you're looking for? Save your search and you'll be
                                           notified if someone posts a listing similar to what you're looking for."
                                           data-step="1"> <input
                                            class="uk-checkbox" type="checkbox"> <span
                                            class="uk-text-warning" style="position: relative; top: 3px;">
												Save Search</span>
                                    </label>
                                </c:otherwise>

                            </c:choose>
                        </form>

                    </div>
                </c:if>
            </div>
            <div id="userDisplay" style="display: none;">
                <div class="uk-text-large"
                     style="float: left; padding-top: 5px; padding-bottom: 10px; text-align: center;">
                    <strong class="uk-text-danger">${userSearch.size()}</strong>
                    results were found for the search for <strong
                        class="uk-text-danger">${search}</strong>
                </div>

                <c:if test="${userSearch.size() == 0 }">
                    <div
                            style="float: right; padding-left: 50px; padding-bottom: 10px;">

                        <form onclick="postValue()">
                            <input name="search" type="hidden" id="searchId"
                                   value="${search}">
                            <c:choose>

                                <c:when test="${saved == 'saved'}">
                                    <label style="padding-top: 10px;"> <input
                                            class="uk-checkbox" type="checkbox" checked> <span
                                            class="uk-text-warning" style="position: relative; top: 3px;">
												Save Search</span>
                                    </label>
                                </c:when>

                                <c:otherwise>
                                    <label style="padding-top: 10px;"> <input
                                            class="uk-checkbox" type="checkbox"> <span
                                            class="uk-text-warning" style="position: relative; top: 3px;">
												Save Search</span>
                                    </label>
                                </c:otherwise>

                            </c:choose>
                        </form>

                    </div>
                </c:if>
            </div>
        </div>

        <div style="float: right; padding-bottom: 10px;">
            <div class="uk-container">
                <div style="padding-top: 55px; float: left;">
                    <form method="POST" class="uk-grid-large"
                          action="sortSearchListings" name="sortSearchListings" uk-grid>
                        <div style="float: right;">
                            <strong>Types</strong><select id="type" name="type"
                                                          class="uk-select" onchange="changeSearchType(this);">
                            <option value="listings" selected>Listings</option>
                            <option value="users">Users</option>
                        </select>
                        </div>
                    </form>
                </div>
                <form method="POST" class="uk-grid-large"
                      action="sortSearchListings" name="sortSearchListings" uk-grid>
                    <div style="padding-top: 55px; float: right;">
                        <strong>Sort</strong><select id="sort" name="sort"
                                                     class="uk-select" onchange="changeListing(this);">
                        <option value="all" selected>All</option>
                        <option value="soonest">Bids Ending Soonest</option>
                        <option value="latest">Bids Ending Latest</option>
                        <option value="high">Price: High to Low</option>
                        <option value="low">Price: Low to High</option>
                    </select>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="uk-container uk-margin-remove-right">
        <hr>
        <div class="uk-section uk-margin-remove-right">
            <div class="uk-grid">
                <div class="uk-width-3-4">
                    <div id="listingSection">
                        <div id="allListings" style="display: inline">
                            <div class="uk-container uk-container-small">
                                <div class="uk-grid-large uk-child-width-1-3 uk-text-center"
                                     uk-grid>
                                    <c:forEach var="listing" items="${listingSearch}">
                                        <%@include file="listing/index-listing.jsp" %>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div id="soonestListings" style="display: none">
                            <div class="uk-container uk-container-small">
                                <div class="uk-grid-large uk-child-width-1-3 uk-text-center"
                                     uk-grid>
                                    <c:forEach var="listing" items="${endingSoonest}">
                                        <%@include file="listing/index-listing.jsp" %>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div id="latestListings" style="display: none">
                            <div class="uk-container uk-container-small">
                                <div class="uk-grid-large uk-child-width-1-3 uk-text-center"
                                     uk-grid>
                                    <c:forEach var="listing" items="${endingLatest}">
                                        <%@include file="listing/index-listing.jsp" %>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div id="mostExpensiveListings" style="display: none">
                            <div class="uk-container uk-container-small">
                                <div class="uk-grid-large uk-child-width-1-3 uk-text-center"
                                     uk-grid>
                                    <c:forEach var="listing" items="${mostExpensive}">
                                        <%@include file="listing/index-listing.jsp" %>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div id="leastExpensiveListings" style="display: none">
                            <div class="uk-container uk-container-small">
                                <div class="uk-grid-large uk-child-width-1-3 uk-text-center"
                                     uk-grid>
                                    <c:forEach var="listing" items="${leastExpensive}">
                                        <%@include file="listing/index-listing.jsp" %>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="userSection" style="display: none;">
                        <div id="userSearch">
                            <div class="uk-container uk-container-small">
                                <div class="uk-grid-large uk-child-width-1-3 uk-text-center"
                                     uk-grid>
                                    <c:forEach var="users" items="${userSearch}">
                                        <div class="uk-clearfix" style="font-size: 14px;">

                                            <a href="${pageContext.request.contextPath}/viewProfile?userId=${users.userID}"><img
                                                    class="uk-align-center uk-border-circle"
                                                    src="<%=request.getContextPath()%>/resources/img/profile-pic/${users.image_path}"
                                                    width="250" height="250" alt="Border circle"></a>
                                            <ul class="uk-list">
                                                <li class="uk-width-1-1" uk-icon="icon: user">${users.firstName}
                                                    "${users.username}" ${users.lastName}</li>
                                                <li class="uk-width-1-1" uk-icon="icon: mail">${users.schoolEmail}</li>
                                            </ul>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    function postValue() {
        var saved = document.getElementById('searchId').value;
        $.ajax({
            type: 'GET',
            url: 'saveSearch',
            data: {
                search: saved
            }
        });
    }

    function changeListing(list) {
        if (list.value == "soonest") {
            document.getElementById('allListings').style.display = 'none';
            document.getElementById('soonestListings').style.display = 'inline';
            document.getElementById('latestListings').style.display = 'none';
            document.getElementById('mostExpensiveListings').style.display = 'none';
            document.getElementById('leastExpensiveListings').style.display = 'none';
        } else if (list.value == "latest") {
            document.getElementById('allListings').style.display = 'none';
            document.getElementById('soonestListings').style.display = 'none';
            document.getElementById('latestListings').style.display = 'inline';
            document.getElementById('mostExpensiveListings').style.display = 'none';
            document.getElementById('leastExpensiveListings').style.display = 'none';
        } else if (list.value == "all") {
            document.getElementById('allListings').style.display = 'inline';
            document.getElementById('soonestListings').style.display = 'none';
            document.getElementById('latestListings').style.display = 'none';
            document.getElementById('mostExpensiveListings').style.display = 'none';
            document.getElementById('leastExpensiveListings').style.display = 'none';
        } else if (list.value == "high") {
            document.getElementById('allListings').style.display = 'none';
            document.getElementById('soonestListings').style.display = 'none';
            document.getElementById('latestListings').style.display = 'none';
            document.getElementById('mostExpensiveListings').style.display = 'inline';
            document.getElementById('leastExpensiveListings').style.display = 'none';
        } else if (list.value == "low") {
            document.getElementById('allListings').style.display = 'none';
            document.getElementById('soonestListings').style.display = 'none';
            document.getElementById('latestListings').style.display = 'none';
            document.getElementById('mostExpensiveListings').style.display = 'none';
            document.getElementById('leastExpensiveListings').style.display = 'inline';
        } else if (list.value == "users") {
            document.getElementById('userSearch').style.display = 'inline';
        }
    }

    function changeSearchType(type) {

        if (type.value == "users") {
            document.getElementById('listingSection').style.display = 'none';
            document.getElementById('userSection').style.display = 'inline';
            document.getElementById('userDisplay').style.display = 'inline';
            document.getElementById('listingDisplay').style.display = 'none';
        } else if (type.value == "listings") {
            document.getElementById('listingSection').style.display = 'inline';
            document.getElementById('userSection').style.display = 'none';
            document.getElementById('userDisplay').style.display = 'none';
            document.getElementById('listingDisplay').style.display = 'inline';
        }
    }

    function toggle() {
        var test = document.getElementById('listing').value;
        if (document.getElementById('listing').checked) {
            document.getElementById('listingResults').style.display = 'inline';
            document.getElementById('userResults').style.display = 'none';
        } else if (document.getElementById('user').checked) {
            document.getElementById('listingResults').style.display = 'none';
            document.getElementById('userResults').style.display = 'inline';
        }
    }

    window.addEventListener("load", function () {
        if (document.getElementById("yes").style.display == "inline") {
            setTimeout(function () {
                introJs(".search-tutorial").start();
            }, 2000);
        }
    });

</script>

<c:if test="${showTutorial == true}">
    <p id="yes" style="display: inline;"></p>
</c:if>

</body>
<%@include file="jspf/footer.jspf" %>
</html>