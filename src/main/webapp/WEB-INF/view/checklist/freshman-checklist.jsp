<%@include file="../jspf/header.jsp" %>

<body class="uk-background-muted">

<%@include file="../jspf/navbar.jspf" %>

<%@include file="../jspf/messages.jsp" %>

<div class="uk-width-3-4@l uk-width-1-1@m uk-width-1-1@s uk-align-center uk-margin uk-tile uk-tile-default uk-border-rounded">

    <h1 class="uk-text-center uk-heading-primary">Freshman Checklist</h1>

    <div class="uk-overflow-auto">

        <!-- Still Need Table -->
        <h2 class="uk-heading-bullet">Still Need <a
                uk-toggle="target: #createNewItem; animation: uk-animation-fade; queued: true"
                uk-icon="icon: plus; ratio: 1.2" style="color: dodgerblue" title="Add New Item"></a></h2>
        <table class="uk-table uk-table-hover uk-table-middle uk-table-divider uk-text-large">
            <thead>
            <tr>
                <th class="uk-width-1-3@s uk-width-4-5@l uk-width-4-5@m">Item</th>
                <div class="uk-width-1-5@l uk-width-2-3@m">
                    <th class="uk-table-shrink uk-text-center">Don't Need</th>
                    <th class="uk-table-shrink uk-text-center">Already Have</th>
                    <th class="uk-table-shrink uk-text-center">Bought</th>
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
                    <td></td>
                </form>
            </tr>
            <c:forEach items="${sessionScope.checklist.items}" var="item">
                <tr>
                    <c:if test="${item.status == 'STILL_NEED'}">
                        <td class="uk-table-justify">
                            <p>${item.name}</p>
                        </td>
                        <td>
                            <form action="/update-checklist" method="post" id="dontNeedForm">
                                <input type="hidden" name="newStatus" value="DONT_NEED">
                                <input type="hidden" name="itemID" value="${item.itemID}">
                                <input type="hidden" name="checklistID" value="${sessionScope.checklist.checklistID}">
                                <a class="uk-text-center uk-icon-button" style="color: red" title="Don't Need"
                                   uk-icon="icon: close; ratio: 1.2" onclick="$('#dontNeedForm').submit();"></a>
                            </form>
                        </td>
                        <td>
                            <form action="/update-checklist" method="post" id="alreadyHaveForm">
                                <input type="hidden" name="newStatus" value="ALREADY_HAVE">
                                <input type="hidden" name="itemID" value="${item.itemID}">
                                <input type="hidden" name="checklistID" value="${sessionScope.checklist.checklistID}">
                                <a class="uk-text-center uk-icon-button" style="color: dodgerblue"
                                   title="Already Have"
                                   uk-icon="icon: check; ratio: 1.2" onclick="$('#alreadyHaveForm').submit();"></a>
                            </form>
                        </td>
                        <td>
                            <form action="/update-checklist" method="post" id="boughtForm">
                                <input type="hidden" name="newStatus" value="JUST_BOUGHT">
                                <input type="hidden" name="itemID" value="${item.itemID}">
                                <input type="hidden" name="checklistID" value="${sessionScope.checklist.checklistID}">
                                <a class="uk-text-center uk-icon-button" style="color: green" title="Just Bought"
                                   uk-icon="icon: cart; ratio: 1.2" onclick="$('#boughtForm').submit();"></a>
                            </form>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- Already Bought Table -->
        <h2 class="uk-heading-bullet">Already Bought</h2>
        <table class="uk-table uk-table-hover uk-table-middle uk-table-divider uk-text-large">
            <thead>
            <tr>
                <th class="uk-width-1-3@s uk-width-4-5@l uk-width-4-5@m">Item</th>
                <div class="uk-width-1-5@l uk-width-2-3@m">
                    <th class="uk-table-shrink uk-text-center">Don't Need</th>
                    <th class="uk-table-shrink uk-text-center">Already Have</th>
                    <th class="uk-table-shrink uk-text-center">Bought</th>
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
                        <td>
                            <a class="uk-text-center uk-icon-button" style="color: lightslategray"
                               title="Don't Need"
                               uk-icon="icon: close; ratio: 1.2"></a>
                        </td>
                        <td>
                            <a class="uk-text-center uk-icon-button" style="color: lightslategray"
                               title="Already Have"
                               uk-icon="icon: check; ratio: 1.2"></a>
                        </td>
                        <td>
                            <a class="uk-text-center uk-icon-button" style="color: lightslategray"
                               title="Just Bought"
                               uk-icon="icon: cart; ratio: 1.2"></a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <%@include file="checklist-sidenav.jsp" %>
    <!--
    <h1>Freshman Checklist Example</h1>
    <p>Use this checklist to make sure you have everything you need
        for your first year at college.</p>

    <h2>Room Needs/Storage</h2>
    <ul class="uk-list uk-list-striped uk-grid-small">
        <li class="uk-width-1-1">Bedside lamp</li>
        <li class="uk-width-1-1">Alarm clock/clock radio</li>
        <li class="uk-width-1-1">Mini trash can</li>
        <li class="uk-width-1-1">Storage bins</li>
        <li class="uk-width-1-1">Under-the-bed storage trays</li>
        <li class="uk-width-1-1">Desk lamp</li>
        <li class="uk-width-1-1">Fan Drying rack for laundry</li>
        <li class="uk-width-1-1">Bulletin board and pushpins</li>
        <li class="uk-width-1-1">Dry-erase wall calendar/board Mini
            toolkit (including screwdriver, hammer, wrench)
        </li>
        <li class="uk-width-1-1">Picture hangers (double-sided tape for
            concrete walls)
        </li>
    </ul>
    <h2>Linens/Laundry Supplies</h2>
    <ul class="uk-list uk-list-striped uk-grid-small">
        <li class="uk-width-1-1">Sheets and pillowcases (2 sets. Check
            with college for size needed - some college twin beds are extra
            long.)
        </li>
        <li class="uk-width-1-1">Towels (3 each of bath, hand and face)</li>
        <li class="uk-width-1-1">Pillows (2)</li>
        <li class="uk-width-1-1">Mattress pad (check with college for
            size needed)
        </li>
        <li class="uk-width-1-1">Blankets (2)</li>
        <li class="uk-width-1-1">Comforter/bedspread</li>
        <li class="uk-width-1-1">Clothes hangers</li>
        <li class="uk-width-1-1">Laundry bag/basket Laundry detergent,
            fabric softener and stain remover
        </li>
        <li class="uk-width-1-1">Lint brush</li>
        <li class="uk-width-1-1">Mini sewing kit</li>
    </ul>
    <h2>Office/Desk Supplies</h2>
    <ul class="uk-list uk-list-striped uk-grid-small">
        <li class="uk-width-1-1">Electronic storage media such as memory
            cards and USB flash drives
        </li>
        <li class="uk-width-1-1">Stapler and staples</li>
        <li class="uk-width-1-1">Printer paper (if you decide to bring a
            printer)
        </li>
        <li class="uk-width-1-1">Pencil holder and sharpener</li>
        <li class="uk-width-1-1">Stackable desk trays (at least 4)</li>
    </ul>
    <h2>Electronics</h2>
    <ul class="uk-list uk-list-striped uk-grid-small">
        <li class="uk-width-1-1">Laptop (printer is optional; there are
            usually computer labs where you can print)
        </li>
        <li class="uk-width-1-1">Portable speakers (if you want to play
            music from laptop/MP3 player)
        </li>
        <li class="uk-width-1-1">HDMI cord, Ethernet cord for computer
            (check if your room has wireless)
        </li>
        <li class="uk-width-1-1">Surge protector</li>
        <li class="uk-width-1-1">Extension cords 3-2 prong adapters</li>
        <li class="uk-width-1-1">MP3 player</li>
        <li class="uk-width-1-1">Headphones</li>
        <li class="uk-width-1-1">Camera</li>
        <li class="uk-width-1-1">Cell phone</li>
    </ul>
    <h2>Shared Items - Check with roommate(s)</h2>
    <ul class="uk-list uk-list-striped uk-grid-small">
        <li class="uk-width-1-1">Audio equipment</li>
        <li class="uk-width-1-1">TV and DVD player</li>
        <li class="uk-width-1-1">Coffeemaker/hot pot/microwave, if
            allowed
        </li>
        <li class="uk-width-1-1">Small refrigerator (if one isn't
            provided)
        </li>
        <li class="uk-width-1-1">Area rug</li>
        <li class="uk-width-1-1">Posters/art</li>
    </ul>

</div>
<p>
</p>-->

</div>
</body>
</html>
