<%@include file="../jspf/header.jsp" %>

<body class="uk-background-muted checklist-tutorial">

<%@include file="../jspf/navbar.jspf" %>

<%@include file="../jspf/messages.jsp" %>

<div class="uk-container">

    <div class="uk-width-3-4@l uk-width-3-4@m uk-width-1-1@s uk-align-center uk-margin-medium-top">

        <h1 data-intro="Keep track of things you need to buy with our Freshman Checklist" data-step="1"
            class="uk-heading-line uk-text-center"><span> Freshman Checklist</span></h1>


        <div class="uk-tile uk-tile-default uk-border-rounded uk-box-shadow-medium uk-box-shadow-hover-large">

            <div class="uk-overflow-auto">

                <!-- Still Need Table -->
                <h2 class="uk-heading-bullet">Still Need <a
                        uk-toggle="target: #createNewItem; animation: uk-animation-fade; queued: true"
                        uk-icon="icon: plus; ratio: 1.2" style="color: dodgerblue" title="Add New Item"
                        data-intro="Want to add a new item to the checklist, click here and type it below."
                        data-step="5"></a>
                </h2>
                <table class="uk-table uk-table-hover uk-table-middle uk-table-divider uk-text-large"
                       data-intro="Here are the items you still need." data-step="2">
                    <thead>
                    <tr>
                        <th class="uk-width-1-3@s uk-width-4-5@l uk-width-4-5@m">Item</th>
                        <div class="uk-width-1-5@l uk-width-2-3@m">
                            <th class="uk-table-small">Don't Need</th>
                            <th class="uk-table-small">Bought</th>
                        </div>
                    </tr>
                    </thead>
                    <tbody>
                    <tr id="createNewItem" hidden>
                        <form action="/add-item" method="post" id="addItemForm">
                            <td class="uk-table-justify">
                                <input type="text" name="name" class="uk-input" placeholder="Create Your Own" required>
                                <input type="hidden" name="checklistID" value="${sessionScope.checklist.checklistID}">
                            </td>
                            <td>
                                <a class="uk-text-center" title="Create" style="color: dodgerblue"
                                   uk-icon="icon: plus-circle; ratio: 1.5" onclick="$('#addItemForm').submit();"></a>
                            </td>
                            <td></td>
                        </form>
                    </tr>

                    <c:forEach items="${sessionScope.checklist.items}" var="item">
                        <tr>
                            <c:if test="${item.status == 'STILL_NEED'}">
                                <td class="uk-table-justify">
                                    <p>${item.name}</p>
                                </td>
                                <td class="uk-table-small">
                                    <form action="/update-checklist" method="post" id="dontNeedForm">
                                        <input type="hidden" name="newStatus" value="DONT_NEED">
                                        <input type="hidden" name="itemID" value="${item.itemID}">
                                        <input type="hidden" name="checklistID"
                                               value="${sessionScope.checklist.checklistID}">
                                        <a class="uk-icon-button" style="color: red" title="Don't Need"
                                           uk-icon="icon: close; ratio: 1.2" onclick="$('#dontNeedForm').submit();"
                                           data-intro="Don't need an item? Click here to remove it from the list."
                                           data-step="3"></a>
                                    </form>
                                </td>
                                <td class="uk-table-small">
                                    <form action="/update-checklist" method="post" id="boughtForm">
                                        <input type="hidden" name="newStatus" value="JUST_BOUGHT">
                                        <input type="hidden" name="itemID" value="${item.itemID}">
                                        <input type="hidden" name="checklistID"
                                               value="${sessionScope.checklist.checklistID}">
                                        <a class=" uk-icon-button" style="color: green" title="Just Bought"
                                           uk-icon="icon: cart; ratio: 1.2" onclick="$('#boughtForm').submit();"
                                           data-intro="Bought this item? Click here to cross it off the list."
                                           data-step="4"></a>
                                    </form>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <!-- Already Bought Table -->
                <h2 class="uk-heading-bullet">Already
                    Bought</h2>
                <table class="uk-table uk-table-hover uk-table-middle uk-table-divider uk-text-large"
                       data-intro="Items you cross off your list go here." data-step="6">
                    <thead>
                    <tr>
                        <th class="uk-width-1-3@s uk-width-4-5@l uk-width-4-5@m">Item</th>
                        <div class="uk-width-1-5@l uk-width-2-3@m">
                            <th class="uk-table-small">Don't Need</th>
                            <th class="uk-table-small">Bought</th>
                        </div>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sessionScope.checklist.items}" var="item">
                        <tr>
                            <c:if test="${item.status == 'JUST_BOUGHT'}">
                                <td class="uk-table-justify">
                                    <p style="text-decoration: line-through;">${item.name}</p>
                                </td>
                                <td class="uk-table-small">
                                    <a class="uk-icon-button" style="color: lightslategray"
                                       title="Don't Need"
                                       uk-icon="icon: close; ratio: 1.2"></a>
                                </td>
                                <td class="uk-table-small">
                                    <a class="uk-icon-button" style="color: lightslategray"
                                       title="Just Bought"
                                       uk-icon="icon: cart; ratio: 1.2"></a>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%@include file="checklist-sidenav.jsp" %>

    <script>

        // Start Tutorial
        window.addEventListener("load", function () {
            $.ajax({
                type: 'GET',
                url: '/checkForTutorial',
                data: {page: "checklist"},
            }).done(function (response) {
                if (response.showTutorial == 'YES') {
                    setTimeout(function () {
                        introJs(".checklist-tutorial").start();
                    }, 1500);
                }
            });
        });

    </script>

</body>
</html>
